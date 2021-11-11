// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../kitaro.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginPageRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    AddItemListPageRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AddItemListPage());
    },
    HistoryItemListPageRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HistoryItemListPage());
    },
    RecycleLocationPageRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RecycleLocationPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginPageRoute.name, path: '/'),
        _i1.RouteConfig(AddItemListPageRoute.name, path: '/add-item-list-page'),
        _i1.RouteConfig(HistoryItemListPageRoute.name,
            path: '/history-item-list-page'),
        _i1.RouteConfig(RecycleLocationPageRoute.name,
            path: '/recycle-location-page')
      ];
}

class LoginPageRoute extends _i1.PageRouteInfo<void> {
  const LoginPageRoute() : super(name, path: '/');

  static const String name = 'LoginPageRoute';
}

class AddItemListPageRoute extends _i1.PageRouteInfo<void> {
  const AddItemListPageRoute() : super(name, path: '/add-item-list-page');

  static const String name = 'AddItemListPageRoute';
}

class HistoryItemListPageRoute extends _i1.PageRouteInfo<void> {
  const HistoryItemListPageRoute()
      : super(name, path: '/history-item-list-page');

  static const String name = 'HistoryItemListPageRoute';
}

class RecycleLocationPageRoute extends _i1.PageRouteInfo<void> {
  const RecycleLocationPageRoute()
      : super(name, path: '/recycle-location-page');

  static const String name = 'RecycleLocationPageRoute';
}
