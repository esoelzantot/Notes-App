part of 'add_note_cubit.dart';

sealed class AddNoteState extends Equatable {
  const AddNoteState();
}

final class AddNoteInitial extends AddNoteState {
  @override
  List<Object> get props => [];
}

final class AddNoteLoading extends AddNoteState {
  @override
  List<Object> get props => [];
}

final class AddNoteSuccess extends AddNoteState {
  @override
  List<Object> get props => [];
}

final class AddNoteFailure extends AddNoteState {
  final String error;
  const AddNoteFailure({required this.error});
  @override
  List<Object> get props => [];
}
