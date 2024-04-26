 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/features/search/data/repos/search_repo.dart';
import 'package:graduation/features/search/presentation/manager/searh_cubit_state.dart';
//part 'search_cubit_state.dart';
class searchCubit extends Cubit<searchstate>{
  searchCubit(this.searchRepo): super(searchloading());
  final searchrepo searchRepo;

 Future fetchSearchResult({required String name}) async {
    emit(searchloading());
    var resualt = await searchRepo.fetchSearchResults(name: name);
    resualt.fold((failure) {
      emit(searchfailure(failure.message));
    }, (resualt) {
      emit(searchsuccess(resualt));
    });
  }}