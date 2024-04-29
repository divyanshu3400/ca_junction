import 'package:ca_junction/components/admin/admin_profile.dart';
import 'package:ca_junction/components/admin/more.dart';
import 'package:ca_junction/components/admin/my_client.dart';
import 'package:ca_junction/components/admin/support.dart';
import 'package:ca_junction/core/router/routers.dart';
import 'package:ca_junction/features/authentication/profile_and_password/presentation/pages/profile_and_password_page.dart';
import 'package:ca_junction/features/authentication/reset_password/presentation/pages/reset_password_page.dart';
import 'package:ca_junction/features/authentication/update_password/presentation/pages/update_password_page.dart';
import 'package:ca_junction/features/authentication/verification/presentation/pages/registration_verification_pages.dart';
import 'package:ca_junction/features/authentication/verification/presentation/pages/verification_page.dart';
import 'package:ca_junction/features/home/dashboard/root/presentation/pages/home_page.dart';
import 'package:ca_junction/features/home/dashboard/root/presentation/pages/main_page.dart';
import 'package:ca_junction/screens/accontcreated_screen.dart';
import 'package:ca_junction/screens/forgotPassword_screen.dart';
import 'package:ca_junction/screens/onboarding_screen1.dart';
import 'package:ca_junction/screens/phone_number.dart';
import 'package:ca_junction/screens/signin.dart';
import 'package:ca_junction/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screens/signup.dart';

final GlobalKey<NavigatorState> _rootState = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellState = GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/${Routers.splashScreen}',
    navigatorKey: _rootState,
    routes: [
      GoRoute(
        path: '/${Routers.splashScreen}',
        name: Routers.splashScreen,
        builder: (context, state) => SplashScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.signIn}',
        name: Routers.signIn,
        builder: (context, state) => SignInScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.reset}',
        name: Routers.reset,
        builder: (context, state) => ResetPasswordPage(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.forgetPass}',
        name: Routers.forgetPass,
        builder: (context, state) => ForgotPasswordScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.onBoarding}',
        name: Routers.onBoarding,
        builder: (context, state) =>const OnboardingScreen1(),
      ),
      GoRoute(
        path: '/${Routers.signUp}',
        name: Routers.signUp,
        builder: (context, state) => SignUpScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.phoneSignUp}',
        name: Routers.phoneSignUp,
        builder: (context, state) => PhoneNumberScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.welcomeScreen}',
        name: Routers.welcomeScreen,
        builder: (context, state) => AccountCreatedScreen(key: state.pageKey,),
      ),
      GoRoute(
        path: '/${Routers.myClients}',
        name: Routers.myClients,
        builder: (context, state) => MyClientScreen(key: state.pageKey,),
      ),
      GoRoute(
        path: '/${Routers.verification}/:name',
        name: Routers.verification,
        builder: (context, state) {
          final name = state.pathParameters['name']!;
          return VerificationPage(key: state.pageKey, userEmail: name);
        },
      ),
      GoRoute(
        path: '/${Routers.registrationVerification}/:email',
        name: Routers.registrationVerification,
        builder: (context, state) {
          final email = state.pathParameters['email']!;
          return RegistrationVerificationPage(
            key: state.pageKey,
            userEmail: email,
          );
        },
      ),
      GoRoute(
        path: '/${Routers.updateNewPassword}',
        name: Routers.updateNewPassword,
        builder: (context, state) {
          return UpdatePasswordPage(key: state.pageKey);
        },
      ),
      GoRoute(
        path: '/${Routers.profileAndPassword}',
        name: Routers.profileAndPassword,
        builder: (context, state) {
          return ProfileAndPassword(key: state.pageKey);
        },
      ),
      ShellRoute(
          navigatorKey: _shellState,
          builder: (context, state, child) =>
              MainPage(key: state.pageKey, child: child),
          routes: [
            GoRoute(
                name: Routers.homeShell,
                path: '/${Routers.home}',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: HomePage(
                    key: state.pageKey,
                  ),);
                },),
            GoRoute(
                name: Routers.support,
                path: '/${Routers.support}',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: AdminSupportScreen(
                    key: state.pageKey,
                  ),);
                },),
            GoRoute(
                name: Routers.profile,
                path: '/${Routers.profile}',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: AdminProfileScreen(
                    key: state.pageKey,
                  ),);
                },),
            GoRoute(
                name: Routers.more,
                path: '/${Routers.more}',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: AdminMoreScreen(
                    key: state.pageKey,
                  ),);
                },),
          ],),
    ],
  );
});
