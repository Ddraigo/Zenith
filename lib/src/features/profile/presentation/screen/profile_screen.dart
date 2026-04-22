import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/core/provider/current_user_id_notifire.dart';
import 'package:app_demo/src/features/profile/presentation/controller/profile_notifier.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/widgets/my_avatar.dart';
import 'package:app_demo/src/shared/widgets/retry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _fullNameController = TextEditingController();
  final _fullNameFocusNode = FocusNode();
  late final ProviderSubscription<AppException?> _updateErrorSub;

  DateTime? _selectedDate;
  Gender _selectedGender = Gender.none;
  bool isEditting = false;
  bool _isFormInitialized = false;

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    _updateErrorSub = ref.listenManual<AppException?>(updateErrorProvider, (prev, next){
      if(!mounted || next == null || prev == next) return;

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

  Gender _mapGenderFromProfile(String gender) {
    switch (gender.trim().toLowerCase()) {
      case 'male':
      case 'Nam':
        return Gender.male;
      case 'female':
      case 'Nữ':
        return Gender.female;
      default:
        return Gender.none;
    }
  }

  void _initFormData(ProfileModel profile) {
    if (_isFormInitialized) return;

    _fullNameController.text = profile.userName;
    _selectedDate = profile.dayOfBirth;
    _selectedGender = _mapGenderFromProfile(profile.gender);
    _isFormInitialized = true;
  }

  Future<void> _handleAction(ProfileModel profile) async {
    if (!isEditting) {
      setState(() {
        isEditting = true;
      });
      return;
    }

    final draft = profile.copyWith(
      userName: _fullNameController.text.trim(),
      dayOfBirth: _selectedDate ?? profile.dayOfBirth,
      gender: _selectedGender.name,
    );

    final ok = await ref.read(profileProvider.notifier).submitUpdate(draft);
    // final latestState = ref.read(profileProvider);

    if (!mounted) return;

    if (ok) {
      setState(() {
        isEditting = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _fullNameFocusNode.dispose();
    _updateErrorSub.close();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final asyncState = ref.watch(profileProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color.onPrimary,
          toolbarHeight: 70.h,
          titleSpacing: 0,
          centerTitle: true,
          title: Text('Profile'),
          leading: IconButton(
            onPressed: () {
              // ref.read(homeTapProvider.notifier).state = 2;
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: asyncState.when(
            data: (profile) {
              _initFormData(profile);
              final userAvatar = profile.avatarUrl ?? '';
              final userEmail = ref.read(userEmailProvider);
              return Column(
                spacing: 16.h,

                children: [
                  SizedBox(height: 16.h),
                  Row(
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
                            child: MyAvatar(userAvatar: userAvatar, size: 45.r),
                          ),
                          Positioned(
                            right: -15,
                            bottom: 0,
                            child: Container(
                              height: 35.h,
                              width: 35.h,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple.shade300,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 3,
                                  ),
                                ],
                                border: Border.all(
                                  color: color.onPrimary,
                                  width: 3,
                                ),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  // setState(() {
                                  //   isEditting = true;
                                  // });
                                },
                                icon: Icon(Icons.edit, color: color.onPrimary),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Text(userEmail, style: MyTextStyle.poppinsMedium400),

                  Expanded(
                    child: _buildFormRegister(
                      color: color,
                      isEditting: isEditting,
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: () => _handleAction(profile),
                    style: ElevatedButton.styleFrom(
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 16.w,
                      //   vertical: 10.h,
                      // ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.r),
                      ),
                    ),
                    label: Text(
                      isEditting ? 'Lưu' : 'Cập nhật profile',
                    ),
                    icon: Icon(isEditting ? Icons.save : Icons.edit_square),
                  ),
                  SizedBox(height: 16.h),
                ],
              );
            },
            error: (error, _) {
              final msg = error is AppException
                  ? MyHelper.getErrorMessage(error)
                  : 'Đã xảy ra lỗi';
              return RetryWidget(
                msg: msg,
                onPressed: () => ref.refresh(profileProvider),
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }

  Widget _buildFormRegister({
    required ColorScheme color,
    required bool isEditting,
  }) {
    final notifier = ref.read(profileProvider.notifier);

    var isError = notifier.validateUserName(_fullNameController.text) != null
        ? true
        : false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16.h,
      children: [
        TextFieldCustom(
          icon: MyIcons.userIcon,
          hintText: 'Họ và tên',
          focusNode: _fullNameFocusNode,
          controller: _fullNameController,
          errorText: isError
              ? notifier.validateUserName(_fullNameController.text)
              : null,
          isEnabled: isEditting,
        ),

        DatePickerCustom(
          icon: MyIcons.calendar,
          initialDate: _selectedDate,
          hintText: 'Ngày sinh',
          onChanged: (date) => setState(() => _selectedDate = date),
          errorText: isError
              ? notifier.validateDayOfBirth(_selectedDate)
              : null,
          isEnabled: isEditting,
        ),
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
              ? (value) {
                  setState(() => _selectedGender = value ?? Gender.none);
                }
              : null,
        ),
      ],
    );
  }
}
