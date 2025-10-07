import 'package:go_router/go_router.dart';
import 'package:loyalty_app/features/splash/presentation/splash_page.dart';

import 'route_names.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const SplashPage(),
    ),
  ],
);
