part of 'training_bloc.dart';

sealed class TrainingState extends Equatable {
  const TrainingState();
}

final class TrainingInitial extends TrainingState {
  @override
  List<Object> get props => [];
}

final class TrainingLoading extends TrainingState {
  @override
  List<Object?> get props => [];
}

final class TrainingLoaded extends TrainingState {
  @override
  List<Object?> get props => [];

}

final class TrainingError extends TrainingState {
  final String error;

  const TrainingError({required this.error});

  @override
  List<Object?> get props => [error];

}