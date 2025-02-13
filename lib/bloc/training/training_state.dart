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
  final List<TrainingData> data;

  const TrainingLoaded({required this.data});

  @override
  List<Object?> get props => [data];

}

final class TrainingDetailLoaded extends TrainingState {
  final TrainingData data;

  const TrainingDetailLoaded({required this.data});
  
  @override
  List<Object?> get props => [data];

}

final class TrainingError extends TrainingState {
  final String error;

  const TrainingError({required this.error});

  @override
  List<Object?> get props => [error];

}