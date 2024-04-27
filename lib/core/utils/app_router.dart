import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation/core/utils/api_service.dart';
import 'package:graduation/features/categories/data/model/categories_model.dart';
import 'package:graduation/features/categories/data/model/landmark_on_cat_model/landmark_on_cat_model.dart';
import 'package:graduation/features/categories/presentation/views/landmarks_view.dart';
import 'package:graduation/features/categories/presentation/views/categories_view.dart';
import 'package:graduation/features/categories/presentation/views/info_view.dart';
import 'package:graduation/features/home/data/models/most_visited_model/most_visited_model.dart';
import 'package:graduation/features/home/pres/views/home_view.dart';
import 'package:graduation/features/introduction_screen/presentation/views/introduction_screen_view.dart';
import 'package:graduation/features/search/data/repos/search_repo_imp.dart';
import 'package:graduation/features/search/presentation/manager/searh_cubit.dart';
import 'package:graduation/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:graduation/features/splachview/preslayer/views/widget/splahview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/bottom_app_bar/bottom_app_bar.dart';
import '../widgets/loading_widget.dart';

Future<bool> loadShowOnboarding() async {
  final prefs = await SharedPreferences.getInstance();
  debugPrint(prefs.getBool('ON_BOARDING').toString());
  return prefs.getBool('ON_BOARDING') ?? true;
}

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (context, state) {
            return FutureBuilder<bool>(
              future: loadShowOnboarding(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget();
                } else {
                  bool showOnboarding = snapshot.data ?? true;
                  return showOnboarding
                      ? const IntroductionScreenView()
                      : const BottomNavigation();
                }
              },
            );
          }),
      GoRoute(
          path: '/SplashView', builder: (context, state) => const SplashView()),
      GoRoute(path: '/homepage', builder: (context, state) => const HomeView()),
      GoRoute(
          path: '/CategoriesView',
          builder: (context, state) => const CategoriesView()),
      GoRoute(
          path: '/LandmarksBody',
          builder: (context, state) => LandMarksView(
                categorymodel: state.extra as CategoriesModel,
              )),
      GoRoute(
          path: '/Information',
          builder: (context, state) => Infoview(
                landmaroncatkmodel: state.extra as LandmarkOnCatModel,
              )),
      GoRoute(
          path: '/searchview',
          builder: (context, state) => BlocProvider(
                create: (context) =>
                    SearchCubit(SearchRepoImp(apiService: ApiService(Dio()))),
                child: const SearchViewBody(),
              )),
      GoRoute(
          path:
              '/lib/features/search/presentation/views/notfound_page_view.dart',
          builder: (context, state) => Infoview(
                landmaroncatkmodel: state.extra as LandmarkOnCatModel,
              )),
      GoRoute(
          path: '/mostvisitedInformation',
          builder: (context, state) => Infoview(
                mostVisitedModel: state.extra as MostVisitedModel,
              )),
    ],
  );
}
