import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/routes/app_router.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/button_custom.dart';
import 'package:app_demo/src/shared/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    mainAxisSize: MainAxisSize.min,
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
                            'Welcome to E-com',
                            style: MyTextStyle.headingH4,
                          ),
                          Text(
                            'Sign in to continue',
                            style: MyTextStyle.bodyTextSmallNormal.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildformLogin(),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        spacing: 8,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Divider(
                              thickness: 1,
                              color: colorScheme.outline,
                            ),
                          ),
                          Text(
                            'OR',
                            style: MyTextStyle.bodyTextNormal.copyWith(
                              color: colorScheme.outline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Divider(
                              thickness: 1,
                              color: colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildThirdPartyLogin(),
                      const SizedBox(height: 24),
                      _buildForgotPassword(colorScheme),
                      const SizedBox(height: 8),
                      _buildRegister(colorScheme),
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

  Widget _buildformLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        TextFieldCustom(
          icon: MyImages.emailIcon,
          hintText: 'Your Email',
          focusNode: _emailFocusNode,
          controller: _emailController,
          onChanged: (value) {},
        ),
        TextFieldCustom(
          icon: MyImages.lockIcon,
          hintText: 'Password',
          focusNode: _passwordFocusNode,
          obscureText: true,
          controller: _passwordController,
          onChanged: (value) {
            //ref.read(signInProvider.notifier).setPassword(value);
          },
        ),
        ButtonCustom(
          onPressed: () {},
          type: ButtonType.elevated,
          label: 'Sign In',
        ),
      ],
    );
  }

  Widget _buildThirdPartyLogin() {
    return Column(
      spacing: 10,
      children: [
        ButtonCustom(
          type: ButtonType.outlined,
          onPressed: () {},
          label: 'Login with Google',
          icon: MyImages.googleIcon,
        ),
        ButtonCustom(
          type: ButtonType.outlined,
          onPressed: () {},
          label: 'Login with Facebook',
          icon: MyImages.facebookIcon,
        ),
      ],
    );
  }

  Widget _buildForgotPassword(ColorScheme colorScheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.primary,
            overlayColor: Colors.transparent,
          ),
          child: Text(
            'Forgot Password?',
            style: MyTextStyle.linkSmall,
          ),
        ),
      ],
    );
  }

  Widget _buildRegister(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 3,
      children: [
        Text(
          'Don’t have a account?',
          style: MyTextStyle.bodyTextSmallNormal.copyWith(
            color: colorScheme.outline,
          ),
        ),
        TextButton(
          onPressed: () => context.go(AppRouter.signUpPath),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
            foregroundColor: colorScheme.primary,
            overlayColor: Colors.transparent,
          ),
          child: Text(
            'Register',
            style: MyTextStyle.linkSmall,
          ),
        ),
      ],
    );
  }
}
