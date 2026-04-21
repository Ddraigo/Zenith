import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/authentication/presentation/controller/auth_notifier.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
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
  late final ProviderSubscription<AsyncValue<void>> _authSubscription;
  late bool isSubmitted;

  @override
  void initState(){
    isSubmitted = false;
    super.initState();
    _authSubscription = ref.listenManual<AsyncValue<void>>(authProvider, (prev, next){
      next.when(
        data: (_){
          ScaffoldMessenger.of(
            context,
          ).showSnackBar( const SnackBar(content: Text('Đăng nhập thành công!')));
          _clearForm();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              context.go(AppRouter.homePath);
            }
          });
        }, 
        loading: (){},
        error: (error, stack) {
          final message = (error is AppException) 
            ? error.when(
                connectivity: () => 'Lỗi kết nối. Vui lòng kiểm tra internet.',
                unauthorized: () => 'Không được phép truy cập.',
                errorWithMessage: (msg) => msg,
                unknown: () => 'Có lỗi xảy ra. Vui lòng thử lại.',
                badRequest: (msg) => msg, 
                server: (msg) => msg, 
              )
            : error.toString();
          
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
        },
      );
    });
  }

  @override
  void dispose() {
    _authSubscription.close();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _clearForm(){
    _emailController.clear();
    _passwordController.clear();
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    isSubmitted = false;
  }



  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(authProvider);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16.r),
              
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                        spacing: 16,
                        children: [
                          SvgPicture.asset(
                            MyImages.logoSmall,
                            width: 50.w,
                            height: 50.h,
                            colorFilter: ColorFilter.mode(
                                colorScheme.primary, BlendMode.srcIn),
                          ),
                          Text(
                            'Chào mừng đến với Zenith',
                            style: MyTextStyle.poppinsHeading1,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Đăng nhập để tiếp tục',
                            style: MyTextStyle.poppinsHeading2.copyWith(
                              color: colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      _buildformLogin(loginState),
                      SizedBox(height: 24.h),
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
                            'HOẶC',
                            style: MyTextStyle.poppinsMedium700.copyWith(
                              color: colorScheme.outline.withValues(alpha: 0.5),
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
                      SizedBox(height: 24.h),
                      _buildThirdPartyLogin(),
                      SizedBox(height: 24.h),
                      _buildForgotPassword(colorScheme),
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

  Widget _buildformLogin(AsyncValue<void> asyncState) {
    final loginNotifier = ref.read(authProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        TextFieldCustom(
          icon: MyIcons.emailIcon,
          hintText: 'Địa chỉ Email',
          focusNode: _emailFocusNode,
          controller: _emailController,
          errorText: isSubmitted 
          ? loginNotifier.validateEmail(_emailController.text) 
          : null, 
        ),
        TextFieldCustom(
          icon: MyIcons.lockIcon,
          hintText: 'Mật khẩu',
          focusNode: _passwordFocusNode,
          obscureText: true,
          controller: _passwordController,
          errorText: isSubmitted 
          ? loginNotifier.validatePassword(_passwordController.text) 
          : null, 

        ),
        asyncState.when(
          data: (_){
            return ButtonCustom(
              onPressed: _handleLogin,
              type: ButtonType.elevated,
              label: 'Đăng nhập',
              minimumSize: Size(double.infinity, 58.h),
            );
          }, 
          loading: (){
            return ButtonCustom(
              onPressed: null,
              type: ButtonType.elevated,
              label: 'Đang xử lý...',
              minimumSize: Size(double.infinity, 58.h),
            );
          },
          error: (error, stack){
            return ButtonCustom(
              onPressed: _handleLogin,
              type: ButtonType.elevated,
              label: 'Đăng ký',
              minimumSize: Size(double.infinity, 58.h),
            );
          }
        ),
        
      ],
    );
  }

  void _handleLogin(){
    setState(() => isSubmitted = true,);

    ref.read(authProvider.notifier)
    .login(
      _emailController.text.trim(),
      _passwordController.text.trim()
    );
  }

  Widget _buildThirdPartyLogin() {
    return Column(
      spacing: 10,
      children: [
        ButtonCustom(
          type: ButtonType.outlined,
          onPressed: () {},
          label: 'Đăng nhập bằng Google',
          icon: MyIcons.googleIcon,
        ),
        ButtonCustom(
          type: ButtonType.outlined,
          onPressed: () {},
          label: 'Đăng nhập bằng Facebook',
          icon: MyIcons.facebookIcon,
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
            textStyle: MyTextStyle.poppinsMedium700
          ),
          child: Text(
            'Quên mật khẩu?',
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
          'Chưa có tài khoản?',
          style: MyTextStyle.poppinsMedium400.copyWith(
            color: colorScheme.tertiary,
          ),
        ),
        TextButton(
          onPressed: () => context.go(AppRouter.signUpPath),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
            foregroundColor: colorScheme.primary,
            overlayColor: Colors.transparent,
            textStyle: MyTextStyle.poppinsMedium600,
          ),
          child: Text(
            'Đăng ký ngay',
          ),
        ),
      ],
    );
  }
}
