/// Asset paths. Reference assets through these constants, never raw strings.
///
/// Naming: `ic_<name>.svg` for icons, `img_<name>.png|svg` for illustrations.
/// PNGs need 2.0x/ and 3.0x/ variants next to the 1x file.
abstract final class AppIcons {
  static const String _base = 'assets/icons';

  // Example: static const String home = '$_base/ic_home.svg';
  static String path(String name) => '$_base/$name';
}

abstract final class AppImages {
  static const String _base = 'assets/images';

  // Example: static const String onboarding1 = '$_base/img_onboarding_1.png';
  static String path(String name) => '$_base/$name';
}
