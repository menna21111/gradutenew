import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/core/utils/api_service.dart';
import 'package:graduation/features/categories/data/repos/categoriesrepo_impl.dart';
import 'package:graduation/features/home/pres/manager/cubit/most_visited_cubit.dart';
import 'package:graduation/features/home/pres/views/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'secandpage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            MostVisitedCubit(CategoriesRepoImpl(ApiService(Dio())))
              ..fetchmostvisited(),
        child: const HomeViewBody());
  }
}
