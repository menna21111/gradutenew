part of 'more_info_cubit.dart';

sealed class MoreInfoState {}

final class MoreInfoInitial extends MoreInfoState {}

class ShowBriefState extends MoreInfoState {}

class ShowFullTextState extends MoreInfoState {}
