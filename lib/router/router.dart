import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smolathon_mobile/features/empty/view/empty.dart';
import 'package:smolathon_mobile/features/maps/view/view.dart';
import 'package:smolathon_mobile/features/profile/view/view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
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
        ),
        AutoRoute(
          page: PointRoute.page,
          path: '/points',
        ),
        AutoRoute(
          page: RouteListRoute.page,
          initial: true,
          path: '/route_list',
        ),
        AutoRoute(
          page: AboutRouteRoute.page,
          path: "/about_route",
        ),
        AutoRoute(
          page: EmptyRoute.page,
          path: '/empty',
        )
      ];
}
