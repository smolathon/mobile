// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutRouteRoute.name: (routeData) {
      final args = routeData.argsAs<AboutRouteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AboutRouteScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    EmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyScreen(),
      );
    },
    PointMapRoute.name: (routeData) {
      final args = routeData.argsAs<PointMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PointMapScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PointRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PointScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    RouteListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RouteListScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
  };
}

/// generated route for
/// [AboutRouteScreen]
class AboutRouteRoute extends PageRouteInfo<AboutRouteRouteArgs> {
  AboutRouteRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          AboutRouteRoute.name,
          args: AboutRouteRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'AboutRouteRoute';

  static const PageInfo<AboutRouteRouteArgs> page =
      PageInfo<AboutRouteRouteArgs>(name);
}

class AboutRouteRouteArgs {
  const AboutRouteRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'AboutRouteRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [EmptyScreen]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PointMapScreen]
class PointMapRoute extends PageRouteInfo<PointMapRouteArgs> {
  PointMapRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          PointMapRoute.name,
          args: PointMapRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PointMapRoute';

  static const PageInfo<PointMapRouteArgs> page =
      PageInfo<PointMapRouteArgs>(name);
}

class PointMapRouteArgs {
  const PointMapRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'PointMapRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [PointScreen]
class PointRoute extends PageRouteInfo<void> {
  const PointRoute({List<PageRouteInfo>? children})
      : super(
          PointRoute.name,
          initialChildren: children,
        );

  static const String name = 'PointRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RouteListScreen]
class RouteListRoute extends PageRouteInfo<void> {
  const RouteListRoute({List<PageRouteInfo>? children})
      : super(
          RouteListRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouteListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
