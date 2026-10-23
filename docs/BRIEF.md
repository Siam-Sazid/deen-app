# deen_app

A new Flutter project.

## Getting Started

Flutter Task Brief : Figma to App

Overview
Build the Android app from the provided Figma file as a pixel-perfect, fully dynamic Flutter
app with a feature-first, modular codebase. The goal is code that matches the design exactly
and that another developer can pick up and extend without asking questions.
Figma file:
https://www.figma.com/design/28AcQGReXlOHaE0UAE7o1A/Figmabasics?node-id=1669-1
62202&p=f&t=VMGU3WPxlkoQl6TO-0
API Doc: https://test.deenstep.com/docs/
Deadline: 22 Oct 2026 , Time: 11:59 PM
Before writing code, go through the whole Figma file, including prototype mode, and list any
questions about flow, animations or missing screens. Send them in one message so they
can be answered together.
Scope and platform
The app targets Android only. iOS, web and tablet layouts are out of scope unless agreed in
writing.
• Platform: Android only (state the minimum SDK you use in the README)
• Flutter: latest stable version; state the exact Flutter and Dart versions in the
README
• Screens: every screen and state in the Figma file
Before starting, send back a feature list that maps the Figma screens to features, for
example:
Feature Screens Notes
Onboarding Splash, Intro slides Animated transitions
Auth Login, Sign up, OTP Form validation
Home Home Data from repository
This list becomes the feature folders in the code and the branches in Git. Each feature is
reviewed and approved separately.
Design, animation and flow
The built app must look and move like the Figma file: same layout, spacing, colors, fonts,
flow and animations.
Flow and animation
• Follow the navigation flow exactly as in Figma prototype mode, including back
behavior.

Flutter Task Brief — Figma to App | Page 1

• Recreate every animation and transition (duration, easing, direction). If one is
unclear, ask before guessing.
• Animations must run smoothly at 60 fps on a mid-range Android phone.
Pixel-perfect UI
• Match spacing, sizes, radius, shadows, colors and typography to the Figma values.
• Put all design tokens in one theme layer: colors, text styles, spacing, radius,
shadows. No hardcoded hex colors or font sizes inside widgets.
• Register custom fonts in pubspec.yaml and use them through the theme.
Responsive
• Layouts must work on small phones (360 dp wide) up to large phones without
overflow, clipping or broken alignment.
• Use flexible layouts (Expanded, Flexible, LayoutBuilder, MediaQuery) rather than
fixed screen-sized values.
• Test both portrait sizes and with larger system font sizes.
Reusable widgets
• Build shared components once (buttons, inputs, cards, app bars, dialogs, loaders)
and reuse them everywhere.
• Shared widgets live in a common folder; feature-specific widgets stay inside their
feature.
Assets
• SVG is recommended for icons and illustrations (flutter_svg). PNG is acceptable
where SVG is not practical; provide 2x and 3x versions.
• Use clear, consistent file names (e.g. ic_home.svg, img_onboarding_1.png) and
reference assets through a constants file, not raw strings.
Architecture
Use a feature first, modular structure: each feature is a self-contained folder with its own
data, domain and presentation layers.
State management: any well-known solution is acceptable; Bloc / Cubit is recommended.
Whatever you choose, use it consistently across the whole app and state it in the README.
