import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/core/utils/api_service.dart';
import 'package:graduation/features/categories/data/model/categories_model.dart';
import 'package:graduation/features/categories/data/repos/categoriesrepo_impl.dart';
import 'package:graduation/features/categories/presentation/manger/landmarks_cubit/landmarks_cubit_cubit.dart';
import 'package:graduation/features/categories/presentation/views/widgets/landmarks_view_body.dart';

class LandMarksView extends StatelessWidget {
  const LandMarksView({super.key, required this.categorymodel});
  final CategoriesModel categorymodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          LandmarksCubitCubit(CategoriesRepoImpl(ApiService(Dio())))
            ..fetchlandmarks(categoryId: categorymodel.id!),
      child: const LandmarksBody(),
    ));
  }
}
