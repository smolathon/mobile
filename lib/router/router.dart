import 'package:auto_route/auto_route.dart';
import 'package:smolathon_mobile/view/view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SecondRoute.page,
          path: '/second',
        ),
        AutoRoute(
          page: SignInRoute.page,
          path: '/signin',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/signup',
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: '/profile',
          initial: true,
        ),
      ];
}
