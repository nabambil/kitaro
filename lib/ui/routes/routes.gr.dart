// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
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
    AboutPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AboutPage());
    },
    OnBoardingPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnBoardingPage());
    },
    RegisterPageRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterPageRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.RegisterPage(
              isFirstTimeWithFacebookSignIn: args.isFirstTimeWithFacebookSignIn,
              isFirstTimeWithGoogleSignIn: args.isFirstTimeWithGoogleSignIn,
              userCredential: args.userCredential,
              key: args.key));
    },
    EditProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfilePageRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.EditProfilePage(
              user: args.user, userAddress: args.userAddress, key: args.key));
    },
    AddItemListPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddItemListPageRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i1.AddItemListPage(locationId: args.locationId, key: args.key));
    },
    HistoryItemListPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HistoryItemListPage());
    },
    RecycleLocationPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RecycleLocationPage());
    },
    LocatorMapPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LocatorMapPage());
    },
    AddLocationPageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AddLocationPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(SplashPageRoute.name, path: '/'),
        _i2.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i2.RouteConfig(AboutPageRoute.name, path: '/about-page'),
        _i2.RouteConfig(OnBoardingPageRoute.name, path: '/on-boarding-page'),
        _i2.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i2.RouteConfig(EditProfilePageRoute.name, path: '/edit-profile-page'),
        _i2.RouteConfig(AddItemListPageRoute.name, path: '/add-item-list-page'),
        _i2.RouteConfig(HistoryItemListPageRoute.name,
            path: '/history-item-list-page'),
        _i2.RouteConfig(RecycleLocationPageRoute.name,
            path: '/recycle-location-page'),
        _i2.RouteConfig(LocatorMapPageRoute.name, path: '/locator-map-page'),
        _i2.RouteConfig(AddLocationPageRoute.name, path: '/add-location-page')
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
/// [_i1.AboutPage]
class AboutPageRoute extends _i2.PageRouteInfo<void> {
  const AboutPageRoute() : super(AboutPageRoute.name, path: '/about-page');

  static const String name = 'AboutPageRoute';
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
class RegisterPageRoute extends _i2.PageRouteInfo<RegisterPageRouteArgs> {
  RegisterPageRoute(
      {required bool isFirstTimeWithFacebookSignIn,
      required bool isFirstTimeWithGoogleSignIn,
      _i4.UserCredential? userCredential,
      _i3.Key? key})
      : super(RegisterPageRoute.name,
            path: '/register-page',
            args: RegisterPageRouteArgs(
                isFirstTimeWithFacebookSignIn: isFirstTimeWithFacebookSignIn,
                isFirstTimeWithGoogleSignIn: isFirstTimeWithGoogleSignIn,
                userCredential: userCredential,
                key: key));

  static const String name = 'RegisterPageRoute';
}

class RegisterPageRouteArgs {
  const RegisterPageRouteArgs(
      {required this.isFirstTimeWithFacebookSignIn,
      required this.isFirstTimeWithGoogleSignIn,
      this.userCredential,
      this.key});

  final bool isFirstTimeWithFacebookSignIn;

  final bool isFirstTimeWithGoogleSignIn;

  final _i4.UserCredential? userCredential;

  final _i3.Key? key;

  @override
  String toString() {
    return 'RegisterPageRouteArgs{isFirstTimeWithFacebookSignIn: $isFirstTimeWithFacebookSignIn, isFirstTimeWithGoogleSignIn: $isFirstTimeWithGoogleSignIn, userCredential: $userCredential, key: $key}';
  }
}

/// generated route for
/// [_i1.EditProfilePage]
class EditProfilePageRoute extends _i2.PageRouteInfo<EditProfilePageRouteArgs> {
  EditProfilePageRoute(
      {required _i1.KitaroAccount user,
      required _i1.AddressModel userAddress,
      _i3.Key? key})
      : super(EditProfilePageRoute.name,
            path: '/edit-profile-page',
            args: EditProfilePageRouteArgs(
                user: user, userAddress: userAddress, key: key));

  static const String name = 'EditProfilePageRoute';
}

class EditProfilePageRouteArgs {
  const EditProfilePageRouteArgs(
      {required this.user, required this.userAddress, this.key});

  final _i1.KitaroAccount user;

  final _i1.AddressModel userAddress;

  final _i3.Key? key;

  @override
  String toString() {
    return 'EditProfilePageRouteArgs{user: $user, userAddress: $userAddress, key: $key}';
  }
}

/// generated route for
/// [_i1.AddItemListPage]
class AddItemListPageRoute extends _i2.PageRouteInfo<AddItemListPageRouteArgs> {
  AddItemListPageRoute({required String locationId, _i3.Key? key})
      : super(AddItemListPageRoute.name,
            path: '/add-item-list-page',
            args: AddItemListPageRouteArgs(locationId: locationId, key: key));

  static const String name = 'AddItemListPageRoute';
}

class AddItemListPageRouteArgs {
  const AddItemListPageRouteArgs({required this.locationId, this.key});

  final String locationId;

  final _i3.Key? key;

  @override
  String toString() {
    return 'AddItemListPageRouteArgs{locationId: $locationId, key: $key}';
  }
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

/// generated route for
/// [_i1.LocatorMapPage]
class LocatorMapPageRoute extends _i2.PageRouteInfo<void> {
  const LocatorMapPageRoute()
      : super(LocatorMapPageRoute.name, path: '/locator-map-page');

  static const String name = 'LocatorMapPageRoute';
}

/// generated route for
/// [_i1.AddLocationPage]
class AddLocationPageRoute extends _i2.PageRouteInfo<void> {
  const AddLocationPageRoute()
      : super(AddLocationPageRoute.name, path: '/add-location-page');

  static const String name = 'AddLocationPageRoute';
}
