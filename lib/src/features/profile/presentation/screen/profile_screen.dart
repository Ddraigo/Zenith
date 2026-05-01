import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/core/provider/current_user_id_notifire.dart';
import 'package:app_demo/src/core/service/image_upload_service.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/features/profile/presentation/controller/profile_notifier.dart';
import 'package:app_demo/src/shared/widgets/my_avatar.dart';
import 'package:app_demo/src/shared/widgets/retry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/constants/images_constants.dart';
import '../../../../shared/http/app_exception.dart';
import '../../../../shared/utils/helper_function.dart';
import '../../../../shared/widgets/date_picker_custom.dart';
import '../../../../shared/widgets/text_field_custom.dart';
import '../../../authentication/presentation/controller/sign_up_notifier.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _fullNameController = TextEditingController();
  final _fullNameFocusNode = FocusNode();
  late final ProviderSubscription<AppException?> _updateErrorSub;

  DateTime? _selectedDate;
  Gender _selectedGender = Gender.none;
  bool _isEditing = false;
  bool _isFormInitialized = false;

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(() {
      if (mounted) setState(() {});
    });

    _updateErrorSub = ref.listenManual<AppException?>(updateErrorProvider, (
      prev,
      next,
    ) {
      if (!mounted || next == null || prev == next) return;

      final msg = MyHelper.getErrorMessage(next);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(msg),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );

      ref.read(updateErrorProvider.notifier).state = null;
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _fullNameFocusNode.dispose();
    _updateErrorSub.close();
    super.dispose();
  }

  Gender _mapGenderFromProfile(String gender) {
    switch (gender.trim().toLowerCase()) {
      case 'male':
      case 'nam':
        return Gender.male;
      case 'female':
      case 'nữ':
        return Gender.female;
      default:
        return Gender.none;
    }
  }

  void _fillForm(ProfileModel profile) {
    if (_isFormInitialized) return;

    _fullNameController.text = profile.userName;
    _selectedDate = profile.dayOfBirth;
    _selectedGender = _mapGenderFromProfile(profile.gender);
    _isFormInitialized = true;
  }

  bool _isMissingProfileError(Object error) {
    return error is AppException &&
        error.maybeWhen(
          badRequest: (msg) => msg == ProfileNotifier.missingProfileMessage,
          orElse: () => false,
        );
  }

  Future<void> _saveProfile({
    required bool isCreateMode,
    ProfileModel? profile,
  }) async {
    final notifier = ref.read(profileProvider.notifier);

    final draft = isCreateMode
        ? ProfileModel(
            userId: ref.read(currentUserIdProvider),
            userName: _fullNameController.text.trim(),
            gender: _selectedGender.name,
            dayOfBirth: _selectedDate ?? DateTime.now(),
          )
        : profile!.copyWith(
            userName: _fullNameController.text.trim(),
            dayOfBirth: _selectedDate ?? profile.dayOfBirth,
            gender: _selectedGender.name,
          );

    final ok = isCreateMode
        ? await notifier.createProfile(draft)
        : await notifier.submitUpdate(draft);

    if (!mounted || !ok) return;
    if (isCreateMode) {
      ref.refresh(hasProfileProvider);
      ref.refresh(profileProvider);
    }
    setState(() => _isEditing = false);
  }

  void _startEdit() {
    setState(() => _isEditing = true);
  }

  void _onAvatarEditPressed() async {
    final imageService = ref.read(imageUploadServiceProvider);
    try {
      final imageFile = await imageService.pickImage();
      if (imageFile == null) {
        // User cancelled picker
        return;
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đang tải ảnh lên...'),
          duration: Duration(seconds: 2),
        ),
      );

      final notifier = ref.read(profileProvider.notifier);
      final ok = await notifier.updateProfileAvatar(imageFile);

      if (!mounted) return;
      if (!ok) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        return;
      }

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('Ảnh đã được cập nhật!'),
            duration: Duration(seconds: 2),
          ),
        );
    } catch (e) {
      if (!mounted) return;

      String errorMsg = 'Có lỗi xảy ra. Vui lòng thử lại.';
      if (e is AppException) {
        errorMsg = MyHelper.getErrorMessage(e);
      }

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            duration: const Duration(seconds: 3),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final hasProfileAsync = ref.watch(hasProfileProvider);
    final userEmail = ref.read(userEmailProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black26,
        backgroundColor: color.onPrimary,
        toolbarHeight: 70.h,
        titleSpacing: 0,
        centerTitle: true,
        title: const Text('Thông tin cá nhân'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push(AppRouter.settingPath),
            icon: SvgPicture.asset(
              MyIcons.setting,
              colorFilter: ColorFilter.mode(
                color.primary.withValues(alpha: 0.7),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: hasProfileAsync.when(
            data: (hasProfile) {
              if (!hasProfile) {
                return _buildProfileBody(
                  color: color,
                  userEmail: userEmail,
                  userAvatar: '',
                  isCreateMode: true,
                  formEnabled: true,
                  submitLabel: 'Tạo hồ sơ',
                  onSubmit: () => _saveProfile(isCreateMode: true),
                );
              }

              final asyncState = ref.watch(profileProvider);
              return asyncState.when(
                data: (profile) {
                  _fillForm(profile);
                  return _buildProfileBody(
                    color: color,
                    userEmail: userEmail,
                    userAvatar: profile.avatarUrl ?? '',
                    isCreateMode: false,
                    formEnabled: _isEditing,
                    submitLabel: _isEditing ? 'Lưu' : 'Cập nhật profile',
                    onSubmit: _isEditing
                        ? () => _saveProfile(
                            isCreateMode: false,
                            profile: profile,
                          )
                        : _startEdit,
                  );
                },
                error: (error, _) {
                  if (_isMissingProfileError(error)) {
                    return _buildProfileBody(
                      color: color,
                      userEmail: userEmail,
                      userAvatar: '',
                      isCreateMode: true,
                      formEnabled: true,
                      submitLabel: 'Tạo hồ sơ',
                      onSubmit: () => _saveProfile(isCreateMode: true),
                    );
                  }

                  final msg = error is AppException
                      ? MyHelper.getErrorMessage(error)
                      : 'Đã xảy ra lỗi';
                  return RetryWidget(
                    msg: msg,
                    onPressed: () => ref.refresh(profileProvider),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            },
            error: (error, _) {
              final msg = error is AppException
                  ? MyHelper.getErrorMessage(error)
                  : 'Đã xảy ra lỗi';
              return RetryWidget(
                msg: msg,
                onPressed: () => ref.refresh(hasProfileProvider),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileBody({
    required ColorScheme color,
    required String userEmail,
    required String userAvatar,
    required bool isCreateMode,
    required bool formEnabled,
    required String submitLabel,
    required VoidCallback onSubmit,
  }) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        _userAvatar(
          userAvatar,
          userEmail,
          color,
          onPressed: _onAvatarEditPressed,
        ),
        SizedBox(height: 16.h),
        Text(userEmail, style: MyTextStyle.poppinsLarge.copyWith(height: 1)),
        SizedBox(height: 8.h),
        Expanded(child: _buildFormRegister(isEditting: formEnabled)),
        ElevatedButton.icon(
          onPressed: onSubmit,

          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.maxFinite, 40.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.r),
            ),
          ),
          label: Text(
            submitLabel,
            style: MyTextStyle.poppinsLarge600.copyWith(color: color.onPrimary),
          ),
          icon: Icon(
            isCreateMode
                ? Icons.save
                : (formEnabled ? Icons.save : Icons.edit_square),
            size: 25,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _userAvatar(
    String userAvatar,
    String displayName,
    ColorScheme color, {
    required VoidCallback onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 3),
              ),
              child: MyAvatar(
                userAvatar: userAvatar,
                displayName: displayName,
                size: 45.r,
              ),
            ),
            Positioned(
              right: -12,
              bottom: 0,
              child: Container(
                height: 35.h,
                width: 35.h,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple.shade400,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3,
                      offset: Offset(5, 5),
                      spreadRadius: -6,
                    ),
                  ],
                  border: Border.all(color: color.onPrimary, width: 3),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onPressed,
                  icon: Icon(Icons.edit, color: color.onPrimary),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormRegister({required bool isEditting}) {
    final notifier = ref.read(profileProvider.notifier);
    final nameError = notifier.validateUserName(_fullNameController.text);
    final dayError = notifier.validateDayOfBirth(_selectedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFieldCustom(
          icon: MyIcons.userIcon,
          hintText: 'Họ và tên',
          focusNode: _fullNameFocusNode,
          controller: _fullNameController,
          errorText: nameError,
          isEnabled: isEditting,
        ),
        SizedBox(height: 16.h),
        DatePickerCustom(
          icon: MyIcons.calendar,
          initialDate: _selectedDate,
          hintText: 'Ngày sinh',
          onChanged: (date) => setState(() => _selectedDate = date),
          errorText: dayError,
          isEnabled: isEditting,
        ),
        SizedBox(height: 16.h),
        DropdownButtonFormField<Gender?>(
          value: _selectedGender == Gender.none ? null : _selectedGender,
          decoration: const InputDecoration(hintText: 'Giới tính'),
          items: Gender.values
              .map(
                (g) => DropdownMenuItem<Gender?>(
                  value: g,
                  child: Text(switch (g) {
                    Gender.none => 'Khác',
                    Gender.male => 'Nam',
                    Gender.female => 'Nữ',
                  }),
                ),
              )
              .toList(),
          onChanged: isEditting
              ? (value) =>
                    setState(() => _selectedGender = value ?? Gender.none)
              : null,
        ),
      ],
    );
  }
}
