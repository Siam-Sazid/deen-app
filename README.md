# Deen

Android app for the Deen-Step platform, built in Flutter from the Figma design.
The original task brief is in [docs/BRIEF.md](docs/BRIEF.md).

## Requirements

| | Version |
|---|---|
| Flutter | 3.41.6 (stable) |
| Dart | 3.11.4 |
| Android min SDK | 24 (Android 7.0) |
| Platform | Android only |

## Running

```sh
flutter pub get
flutter run
```

The API defaults to `https://test.deenstep.com/api/v1`. Point a build at another
server with `--dart-define=API_BASE_URL=https://.../api/v1`.

```sh
flutter analyze   # lints, must be clean
flutter test      # unit and widget tests
```

## Architecture

**State management: Bloc / Cubit** (`flutter_bloc`), used for every screen.
Other packages: `go_router` (navigation), `dio` (HTTP), `get_it` (dependency
injection), `flutter_secure_storage` (tokens), `flutter_svg` (icons).

```
lib/
  main.dart              entry point: DI, Bloc observer, runApp
  app/
    app.dart             MaterialApp.router, theme, text-scale clamp
    di/injection.dart    service locator; each feature registers itself here
    router/              route paths (app_routes.dart) and the GoRouter
  core/                  shared by every feature; no feature imports another
    config/              base URL, timeouts
    constants/           asset paths (app_assets.dart), shared UI copy
    theme/               design tokens: colors, text styles, spacing, radius,
                         sizes, shadows, motion, and the ThemeData built from them
    network/             ApiClient, auth interceptor, ApiException
    storage/             secure JWT storage
    error/result.dart    Result<T> = Success | Failure
    bloc/                RequestStatus enum, Bloc observer
    widgets/             AppButton, AppTextField, AppAppBar, AppCard,
                         AppDialog, AppLoader, AppErrorView, AppSvgIcon
  features/
    <feature>/
      data/              models (JSON), remote data source, repository impl
      domain/            entities, repository contract
      presentation/      cubit/, pages/, widgets/ (feature-only widgets)
      di/                <feature>_di.dart registering the above
```

### Conventions

- **No hardcoded design values in widgets.** Colors come from `AppColors`, text
  from `AppTextStyles`, and spacing, radius, sizes and shadows from
  `app_dimens.dart`. Animation timings come from `AppDurations` / `AppCurves`.
- **Assets** live in `assets/icons/` (`ic_*.svg`) and `assets/images/`
  (`img_*.svg|png`, with `2.0x/` and `3.0x/` variants for PNGs). Reference them
  only through `AppIcons` / `AppImages`.
- **Networking.** Remote data sources call `ApiClient`, which unwraps the
  `{status, code, data}` envelope and throws `ApiException` on failure.
  Repositories wrap calls with `guard()` and return `Result<T>`. Cubits
  `switch` on the result. Branch on `ApiException.code`, never on the message.
- **Auth.** The access token is attached automatically. A 401 triggers one
  refresh and a retry. If the refresh fails, the tokens are cleared and
  `SessionEvents.onExpired` fires. Use `Options(extra: {AuthInterceptor.skipAuth: true})`
  for requests that must not carry the JWT.
- **Responsive.** Layouts must fit 360 dp wide and up. System text scale is
  honoured up to `DeenApp.maxTextScale` (1.3). The app is portrait-only.

## Features

One folder under `lib/features/` and one Git branch (`feature/<name>`) per feature:

| Feature | Screens |
|---|---|
| onboarding | Splash, intro slides, location permission, community selection |
| auth | Login, sign up, OTP, guest, Google sign-in |
| forgot_password | Email, OTP, new password |
| home | Home dashboard |
| prayer | Prayer tab, reminders, history |
| reflect | Mood, journal and insight, gratitude, feed |
| community | Communities, feed, post detail, comments, reactions, report, saved, notifications |
| profile | Settings, edit profile, email change, prayer methods, monthly review, Hijri calendar, legal |
