import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/features/categories/data/model/categories_model.dart';
import 'package:graduation/features/categories/data/repos/categories_repo.dart';

part 'categories_cubit_state.dart';

class CategoriesCubitCubit extends Cubit<CategoriesCubitState> {
  CategoriesCubitCubit(this.catrepo) : super(CategoriesCubitInitial());
  final CategoriesRepo catrepo;
  Future<void> fetchCategories() async {
    emit(CategoriesCubitLoading());
    var result = await catrepo.fetchCategories();
    result.fold((failure) {
      emit(CategoriesCubitFailure(failure.message));
    }, (categories) {
      emit(CategoriesCubitSuccess(categories));
    });
  }
}
