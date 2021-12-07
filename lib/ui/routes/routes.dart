import 'package:auto_route/auto_route.dart';
import 'package:kitaro/kitaro.dart';

export 'routes.gr.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      page: LoginPage,
    ),
    AutoRoute(
      page: AddItemListPage,
    ),
    AutoRoute(
      page: HistoryItemListPage,
    ),
    AutoRoute(
      page: RecycleLocationPage,
    ),
  ],
)
class $AppRouter {}
