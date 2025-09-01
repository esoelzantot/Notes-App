part of 'get_notes_cubit.dart';

sealed class GetNotesState extends Equatable {
  const GetNotesState();
}

final class GetNotesInitial extends GetNotesState {
  @override
  List<Object> get props => [];
}

final class GetNotesLoading extends GetNotesState {
  @override
  List<Object> get props => [];
}

final class GetNotesSuccess extends GetNotesState {
  const GetNotesSuccess();
  @override
  List<Object> get props => [];
}

final class GetNotesFailure extends GetNotesState {
  final String error;
  const GetNotesFailure({required this.error});
  @override
  List<Object> get props => [];
}
