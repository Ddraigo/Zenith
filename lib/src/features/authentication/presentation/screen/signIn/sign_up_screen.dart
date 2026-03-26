import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/authentication/presentation/controller/sign_up_notifier.dart';
import 'package:app_demo/src/routes/app_router.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/button_custom.dart';
import 'package:app_demo/src/shared/widgets/date_picker_custom.dart';
import 'package:app_demo/src/shared/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _fullNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _rePasswordFocusNode = FocusNode();
  

  DateTime? _selectedDate;
  Gender _selectedGender = Gender.none;
  late bool isSubmit;

  @override
  void initState() {
    isSubmit = false;
    super.initState();
    ref.listenManual<AsyncValue<void>>(signUpProvider, (prev, next) {
      next.when(
        data: (_) {
          _clearForm();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Đăng ký thành công!')));
          Future.delayed(const Duration(milliseconds: 600), () {
            if (mounted) context.go(AppRouter.loginPath);
          });
        },
        loading: () {},
        error: (error, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        },
      );
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _rePasswordFocusNode.dispose();
    super.dispose();
  }

  void _clearForm() {
    _fullNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _rePasswordController.clear();
    _selectedDate = null;
    _selectedGender = Gender.none;
    _fullNameFocusNode.unfocus();
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _rePasswordFocusNode.unfocus();
    isSubmit = false;
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(signUpProvider);
    final colorScheme = Theme.of(context).colorScheme;
    

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          SvgPicture.asset(
                            MyImages.appIcon,
                            width: 50.w,
                            height: 50.h,
                            colorFilter: ColorFilter.mode(
                              colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            'Let\'s Get Started',
                            style: MyTextStyle.poppinsHeading1,
                          ),
                          Text(
                            'Create a new account',
                            style: MyTextStyle.poppinsHeading2.copyWith(
                              color: colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildFormRegister(asyncState),
                      const SizedBox(height: 24),
                      _buildSignIn(colorScheme),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFormRegister(AsyncValue<void> asyncState) {
    final _notifier = ref.read(signUpProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        TextFieldCustom(
          icon: MyImages.userIcon,
          hintText: 'Họ và tên',
          focusNode: _fullNameFocusNode,
          controller: _fullNameController,
          errorText: isSubmit ? _notifier.validateUsername(_fullNameController.text) : null,
        ),
        DatePickerCustom(
          initialDate: _selectedDate,
          hintText: 'Ngày sinh',
          onChanged: (date) => setState(() => _selectedDate = date),
          errorText: isSubmit ? _notifier.validateDayOfBirth(_selectedDate ) : null,
        ),
        DropdownButtonFormField<Gender?>(
          value: _selectedGender == Gender.none ? null : _selectedGender,
          decoration: const InputDecoration(hintText: 'Giới tính'),
          items: Gender.values
              .where((g) => g != Gender.none)
              .map(
                (g) => DropdownMenuItem<Gender?>(
                  value: g,
                  child: Text(g == Gender.male ? 'Nam' : 'Nữ'),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() => _selectedGender = value ?? Gender.none);
          },
        ),
        TextFieldCustom(
          icon: MyImages.emailIcon,
          hintText: 'Địa chỉ Email',
          focusNode: _emailFocusNode,
          controller: _emailController,
          errorText: isSubmit ? _notifier.validateEmail(_emailController.text) : null
        ),
        TextFieldCustom(
          icon: MyImages.lockIcon,
          hintText: 'Mật khẩu',
          focusNode: _passwordFocusNode,
          obscureText: true,
          controller: _passwordController,
          errorText: isSubmit ? _notifier.validatePassword(_passwordController.text) : null,
        ),
        TextFieldCustom(
          icon: MyImages.lockIcon,
          hintText: 'Xác nhận lại mật khẩu',
          focusNode: _rePasswordFocusNode,
          obscureText: true,
          controller: _rePasswordController,
          errorText: isSubmit ? _notifier.validateConfirmPassword(_passwordController.text, _rePasswordController.text) : null,
        ),
        asyncState.when(
          data: (_) {
            return ButtonCustom(
              onPressed: _handleSignUp,
              type: ButtonType.elevated,
              label: 'Đăng ký',
              minimumSize: Size(double.infinity, 58.h),
            );
          },
          loading: () {
            return ButtonCustom(
              onPressed: null,
              type: ButtonType.elevated,
              label: 'Đang xử lý...',
              minimumSize: Size(double.infinity, 58.h),
            );
          },
          error: (error, stack) {
            return ButtonCustom(
              onPressed: _handleSignUp,
              type: ButtonType.elevated,
              label: 'Đăng ký',
              minimumSize: Size(double.infinity, 58.h),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSignIn(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 3,
      children: [
        Text(
          'Đã có tài khoản?',
          style: MyTextStyle.poppinsMedium400.copyWith(
            color: colorScheme.tertiary,
          ),
        ),
        TextButton(
          onPressed: () => context.go(AppRouter.loginPath),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: colorScheme.primary,
            overlayColor: Colors.transparent,
            textStyle: MyTextStyle.poppinsMedium600,
          ),
          child: const Text('Đăng ký'),
        ),
      ],
    );
  }

  void _handleSignUp() {
    setState(() {
      isSubmit = true;
    });

    ref
        .read(signUpProvider.notifier)
        .handleSignUp(
          userName: _fullNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          rePassword: _rePasswordController.text,
          gender: _selectedGender,
          dayOfBirth: _selectedDate,
        );
  }
}
