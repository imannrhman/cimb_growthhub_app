part of 'my_training_bloc.dart';

sealed class MyTrainingState extends Equatable {
  const MyTrainingState();
}

final class MyTrainingInitial extends MyTrainingState {
  @override
  List<Object> get props => [];
}

final class MyTrainingLoading extends MyTrainingState {
  @override
  List<Object?> get props => [];
}

final class MyTrainingLoaded extends MyTrainingState {
  @override
  List<Object?> get props => [];

}

final class MyTrainingError extends MyTrainingState {
  final String error;

  const MyTrainingError({required this.error});
  @override
  List<Object?> get props => [];

}