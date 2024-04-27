import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/features/search/data/repos/search_repo.dart';
import 'package:graduation/features/search/presentation/manager/searh_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepo) : super(SearchResultInitialState());
  final SearchRepo searchRepo;

  Future fetchSearchResult({required String name}) async {
    emit(SearchLoading());
    var resualt = await searchRepo.fetchSearchResults(name: name);
    resualt.fold((failure) {
      emit(SearchFailure(failure.message));
    }, (resualt) {
      emit(SearchSuccess(resualt));
    });
  }
}
