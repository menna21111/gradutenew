import 'package:flutter_bloc/flutter_bloc.dart';
part 'more_info_state.dart';

class MoreInfoCubit extends Cubit<MoreInfoState> {
  MoreInfoCubit() : super(MoreInfoInitial());
  String? text;
  bool? showViewMoreDetails;
  Future<void> viewmore({required text, required bool showmore}) async {
    if (text != null && text.length > 580 && !showmore) {
      text = text.substring(0, 580);
      showViewMoreDetails = true;
      emit(ShowFullTextState());
    } else {
      text = text;
      showViewMoreDetails = false;
    }
    emit(ShowBriefState());
  }
}
