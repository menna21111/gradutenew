import 'package:dartz/dartz.dart';
import 'package:graduation/core/errors/failures.dart';
import 'package:graduation/core/utils/api_service.dart';
import 'package:graduation/features/categories/data/model/landmark_on_cat_model/landmark_on_cat_model.dart';
import 'package:graduation/features/search/data/repos/search_repo.dart';
import 'package:dio/dio.dart';
import 'package:graduation/features/search/presentation/manager/searh_cubit_state.dart';

class SearchRepoImp implements searchrepo {
  final ApiService apiService;

  SearchRepoImp({required this.apiService});

  @override
  Future<Either<Failure, List<LandmarkOnCatModel>>> fetchSearchResults(
      {required String name}) async {
    try {
      var data = await apiService.get(endpoint:'landmarks/:id');
      print(data['data']['landmarks'][name]);
      List<LandmarkOnCatModel> landmark = [];
      for (var match in data['items']) {
        landmark.add(LandmarkOnCatModel.fromJson(match));
      }
      return right(landmark);
    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure(''));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
