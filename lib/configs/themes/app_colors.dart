import 'package:flutter/material.dart';

/// Light [ColorScheme] made with FlexColorScheme v8.4.0.
/// Requires Flutter 3.22.0 or later.
/// 
class AppColors {
  const AppColors._();

  // primary
  static const primary100 = Color(0xFFECF1E8);
  static const primary200 = Color(0xFFDDEFCE);
  static const primary300 = Color(0xFFB7EC8C);
  static const primary400 = Color(0xFF8BDE47);
  static const primary500 = Color(0xFF67BD1F);
  static const primary600 = Color(0xFF8C2C8C);
  static const primary700 = Color(0xFF613766); 


  // Typography
  static const typography100 = Color(0xFFB6B8B5);
  static const typography200 = Color(0xFF91958E);
  static const typography300 = Color(0xFF70756B);
  static const typography400 = Color(0xFF60655C);
  static const typography500 = Color(0xFF363A33);

  // Grey
  static const grey0 = Color(0xFFFFFFFF);
  static const grey50 = Color(0xFFF9FAF8);
  static const grey100 = Color(0xFFF4F7F2);
  static const grey200 = Color(0xFFE8EBE6);
  static const grey300 = Color(0xFFA9ADA5);
  static const grey400 = Color(0xFF91958E);
  static const grey500 = Color(0xFF60635E);

  //error
  static const error300 = Color(0xff710e21);
  static const error200 = Color(0xff96132c);
  static const error100 = Color(0xffdf1c41);
  static const error50 = Color(0xffed8296);
  static const error25 = Color(0xffFEF5F3);
  static const error0 = Color(0xfffff0f3);

  // Other
  static const red = Color(0xFFE25839); //0xffFB7181
  static const yellow = Color(0xFFF5AE42);
  static const blue = Color(0xFF24B5D4);
  static const green = Color(0xFF45B733);
  static const orange = Color(0xFFE8712E);
  static const purplePastel = Color(0xFFF2DDF8);
  static const greenPastel = Color(0xFFE2F2E2);
  static const orangePastel = Color(0xFFFFEDE1);
  static const bluePastel = Color(0xFFE8F3FB);
  // Transparent
  static const grey500_6 = Color(0x0F60635E);
  static const white_92 = Color(0xEBFFFFFF);
  static const primary600_24 = Color(0x3D54A312);
  static const backgroundBlur80 = Color(0xCC9FA19E);

  // Gradient
  static const gradientLight = Color(0xFF5EAD1D);
  static const gradientDark = Color(0xFF54A312);

  // Base
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF232522);

  // Semantic (light)
  // Background
  static const backgroundPrimary = primary600;
  static const backgroundSecondary = primary100;
  static const backgroundDanger = red;
  static const backgroundLightRed = error25;
  static const backgroundGrey = grey400;
  static const backgroundDisabled = grey200;

  static const surfaceBackground = grey0;
  static const elementBackground = grey50;
  static const layer1Background = grey50;
  static const layer2Background = grey100;
  static const layer3Background = grey200;

  static const backgroundBlur = backgroundBlur80;
  static const transparentNav = white_92;
  static const darkModeDarkest = black;

  // Typography
  static const textHeading = typography500;
  static const textParagraph = typography400;
  static const textLightGrey = typography300;
  static const textInactive = typography200;
  static const textDisabled = typography100;
  static const textPrimary = primary600;
  static const textPrimary700 = primary700;
  static const typographyWhite = white;
  static const typographyDanger = red;

  // Icon
  static const iconDefault = typography400;
  static const iconLight = typography200;
  static const iconDisabled = typography100;
  static const iconPrimary = primary600;
  static const iconWhite = white;
  static const iconRed = red;
  static const iconYellow = yellow;
  static const iconBlue = blue;
  static const iconOrange = orange;
  static const iconDark = black;

  // Border
  static const borderDefault = grey200;
  static const borderLight = grey100;
  static const borderPrimary = primary600;
  static const borderDark = typography400;
  static const borderLink = blue;
  static const borderWhite = white;
  static const borderRed = red;
  static const borderTransparentGrey = grey500_6;
  static const borderTransparentPrimary = primary600_24;

  // Illustration
  static const illustrationGreyLightest = grey100;
  static const illustrationGrey = grey200;
  static const illustrationGreyDark = grey300;

  // Logo
  static const logoPrimary = primary600;
  static const logoBlack = black;

}

class AppDarkColors {
  const AppDarkColors._();

  // Primary
  static const primary100 = Color(0xFF3B3F38);
  static const primary200 = Color(0xFF3E532D);
  static const primary300 = Color(0xFF436923);
  static const primary400 = Color(0xFF5D9E26);
  static const primary500 = Color(0xFF6CB231);
  static const primary600 = Color(0xFF70BA32);
  static const primary700 = Color(0xFF88CD4E);

  // Typography
  static const typography100 = Color(0xFF7F7F7E);
  static const typography200 = Color(0xFF888A87);
  static const typography300 = Color(0xFF9FA19E);
  static const typography400 = Color(0xFFC8C9C7);
  static const typography500 = Color(0xFFEEF0ED);

  // Grey
  static const grey0 = Color(0xFF262725);
  static const grey50 = Color(0xFF2D2E2C);
  static const grey100 = Color(0xFF313330);
  static const grey200 = Color(0xFF3D3D3D);
  static const grey300 = Color(0xFF7A7A79);
  static const grey400 = Color(0xFF989998);
  static const grey500 = Color(0xFFD5D6D3);

  // Other
  static const red = Color(0xFFFB6A57);
  static const yellow = Color(0xFFFBB650);
  static const blue = Color(0xFF6FBDCE);
  static const green = Color(0xFF8CEC7D);
  static const orange = Color(0xFFE48047);


  //error
  static const error300 = Color(0xff710e21);
  static const error200 = Color(0xff96132c);
  static const error100 = Color(0xffdf1c41);
  static const error50 = Color(0xffed8296);
  static const error25 = Color(0xfffadbe1);
  static const error0 = Color(0xfffff0f3);

  // Transparent
  static const grey500_6 = Color(0x0FD5D6D3);
  static const grey0_92 = Color(0xEB262725);
  static const primary600_24 = Color(0x3D70BA32);
  static const backgroundBlur88 = Color(0xE0262725);

  // Gradient
  static const gradientLight = Color(0xFF6CB231);
  static const gradientDark = Color(0xFF6CB231);

  // Base
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF202120);

  // Semantic (dark)
  // Background
  static const backgroundPrimary = primary600;
  static const backgroundSecondary = primary100;
  static const backgroundDanger = red;
  static const backgroundLightRed = error25;
  static const backgroundGrey = grey400;
  static const backgroundDisabled = grey200;

  static const surfaceBackground = grey0;
  static const elementBackground = grey50;
  static const layer1Background = grey50;
  static const layer2Background = grey100;
  static const layer3Background = grey200;

  static const backgroundBlur = backgroundBlur88;
  static const transparentNav = grey0_92;
  static const darkModeDarkest = black;

  // Typography
  static const textHeading = typography500;
  static const textParagraph = typography400;
  static const textLightGrey = typography300;
  static const textInactive = typography200;
  static const textDisabled = typography100;
  static const textPrimary = primary600;
  static const textPrimary700 = primary700;
  static const typographyWhite = white;
  static const typographyDanger = red;

  // Icon
  static const iconDefault = typography400;
  static const iconLight = typography200;
  static const iconDisabled = typography100;
  static const iconPrimary = primary600;
  static const iconWhite = white;
  static const iconRed = red;
  static const iconYellow = yellow;
  static const iconBlue = blue;
  static const iconOrange = orange;
  static const iconDark = black;

  // Border
  static const borderDefault = grey200;
  static const borderLight = grey100;
  static const borderPrimary = primary600;
  static const borderDark = typography400;
  static const borderLink = blue;
  static const borderWhite = white;
  static const borderRed = red;
  static const borderTransparentGrey = grey500_6;
  static const borderTransparentPrimary = primary600_24;

  // Illustration
  static const illustrationGreyLightest = grey100;
  static const illustrationGrey = grey200;
  static const illustrationGreyDark = grey300;

  // Logo
  static const logoPrimary = primary600;
  static const logoBlack = black;
}
