import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/authentication/presentation/controller/sign_up_notifier.dart';
import 'package:app_demo/src/features/authentication/presentation/state/sign_up_state.dart';
import 'package:app_demo/src/routes/app_router.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/button_custom.dart';
import 'package:app_demo/src/shared/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
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

  late SignUpNotifier notifier;

  @override
  void initState() {
    notifier = ref.read(signUpProvider.notifier);
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();


    ghgh

    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _rePasswordController.dispose();
    _rePasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
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
                                colorScheme.primary, BlendMode.srcIn),
                          ),
                          Text(
                            'Let’s Get Started',
                            style: MyTextStyle.headingH4,
                          ),
                          Text(
                            'Create an new account',
                            style: MyTextStyle.bodyTextSmallNormal.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildformRegister(signUpState),
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

  Widget _buildformRegister(SignUpState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        TextFieldCustom(
          icon: MyImages.userIcon,
          hintText: 'Full name',
          focusNode: _fullNameFocusNode,
          controller: _fullNameController,
          onChanged: notifier.onUserNameChange,
          errorText: state.errorName,
        ),
        TextFieldCustom(
          icon: MyImages.emailIcon,
          hintText: 'Your Email',
          focusNode: _emailFocusNode,
          controller: _emailController,
          onChanged: notifier.onEmailChange,
           errorText: state.errorEmail,
          
        ),
        TextFieldCustom(
          icon: MyImages.lockIcon,
          hintText: 'Password',
          focusNode: _passwordFocusNode,
          obscureText: true,
          controller: _passwordController,
          onChanged: notifier.onPasswordChange,
          errorText: state.errorPassword,
        ),
        TextFieldCustom(
          icon: MyImages.lockIcon,
          hintText: 'Password Again',
          focusNode: _rePasswordFocusNode,
          obscureText: true,
          controller: _rePasswordController,
          onChanged: notifier.onRePasswordChange,
          errorText: state.errorRePassword,
        ),
        ButtonCustom(
          onPressed: notifier.handleSignUp,
          type: ButtonType.elevated,
          label: 'Sign Up',
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
          'Have a account?',
          style: MyTextStyle.bodyTextSmallNormal.copyWith(
            color: colorScheme.outline,
          ),
        ),
        TextButton(
          onPressed: () => context.go(AppRouter.loginPath),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
            foregroundColor: colorScheme.primary,
            overlayColor: Colors.transparent,
          ),
          child: Text(
            'Sign in',
            style: MyTextStyle.linkSmall,
          ),
        ),
      ],
    );
  }
}
