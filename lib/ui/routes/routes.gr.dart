// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../../kitaro.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    OnBoardingPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnBoardingPage());
    },
    RegisterPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RegisterPage());
    },
    AddItemListPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AddItemListPage());
    },
    HistoryItemListPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HistoryItemListPage());
    },
    RecycleLocationPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RecycleLocationPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(SplashPageRoute.name, path: '/'),
        _i2.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i2.RouteConfig(OnBoardingPageRoute.name, path: '/on-boarding-page'),
        _i2.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i2.RouteConfig(AddItemListPageRoute.name, path: '/add-item-list-page'),
        _i2.RouteConfig(HistoryItemListPageRoute.name,
            path: '/history-item-list-page'),
        _i2.RouteConfig(RecycleLocationPageRoute.name,
            path: '/recycle-location-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i2.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i1.LoginPage]
class LoginPageRoute extends _i2.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i1.OnBoardingPage]
class OnBoardingPageRoute extends _i2.PageRouteInfo<void> {
  const OnBoardingPageRoute()
      : super(OnBoardingPageRoute.name, path: '/on-boarding-page');

  static const String name = 'OnBoardingPageRoute';
}

/// generated route for
/// [_i1.RegisterPage]
class RegisterPageRoute extends _i2.PageRouteInfo<void> {
  const RegisterPageRoute()
      : super(RegisterPageRoute.name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}

/// generated route for
/// [_i1.AddItemListPage]
class AddItemListPageRoute extends _i2.PageRouteInfo<void> {
  const AddItemListPageRoute()
      : super(AddItemListPageRoute.name, path: '/add-item-list-page');

  static const String name = 'AddItemListPageRoute';
}

/// generated route for
/// [_i1.HistoryItemListPage]
class HistoryItemListPageRoute extends _i2.PageRouteInfo<void> {
  const HistoryItemListPageRoute()
      : super(HistoryItemListPageRoute.name, path: '/history-item-list-page');

  static const String name = 'HistoryItemListPageRoute';
}

/// generated route for
/// [_i1.RecycleLocationPage]
class RecycleLocationPageRoute extends _i2.PageRouteInfo<void> {
  const RecycleLocationPageRoute()
      : super(RecycleLocationPageRoute.name, path: '/recycle-location-page');

  static const String name = 'RecycleLocationPageRoute';
}
