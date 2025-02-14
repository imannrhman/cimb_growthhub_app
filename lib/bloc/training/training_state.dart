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

final class TrainingEnrollLLoaded extends TrainingState {
  final TrainingData trainingData;
  final Enrollment enrollmentData;

  const TrainingEnrollLLoaded({required this.trainingData, required this.enrollmentData});


  @override
  List<Object?> get props => [trainingData, enrollmentData];

}

final class TrainingEnrollLSuccess extends TrainingState {
  final TrainingData trainingData;
  final Enrollment enrollmentData;

  const TrainingEnrollLSuccess({required this.trainingData, required this.enrollmentData});


  @override
  List<Object?> get props => [trainingData, enrollmentData];

}

final class TrainingCancelSuccess extends TrainingState {
  final String id;
  final String message;

  const TrainingCancelSuccess(this.message, this.id);


  @override
  List<Object?> get props => [message];

}

final class TrainingError extends TrainingState {
  final String error;

  const TrainingError({required this.error});

  @override
  List<Object?> get props => [error];

}