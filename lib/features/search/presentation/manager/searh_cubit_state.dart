//part of 'search_cubit.dart';
import 'package:graduation/features/categories/data/model/landmark_on_cat_model/landmark_on_cat_model.dart';

sealed class searchstate {
   const searchstate();

  @override
  List<Object> get props => [];
}
final class SearchResultInitialState extends searchstate {}
class searchloading extends searchstate{}
class searchsuccess extends searchstate{
  final List<LandmarkOnCatModel> landmark;

  const searchsuccess(this.landmark);
}
class searchfailure extends searchstate{
   final String errorMessage;

  const  searchfailure(this.errorMessage);
}
