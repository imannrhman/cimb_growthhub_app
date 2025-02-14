part of 'training_bloc.dart';

sealed class TrainingEvent extends Equatable {
  const TrainingEvent();
}

final class GetTrainingData extends TrainingEvent {
  @override
  List<Object?> get props => [];

}


final class GetTrainingDataByID extends TrainingEvent {
  final String id;

  const GetTrainingDataByID({required this.id});

  @override
  List<Object?> get props => [id];

}


final class SearchEvent extends TrainingEvent {
  final List<TrainingData>? training;
  final String query;

  const SearchEvent({this.training,this.query = ""});

  @override
  List<Object?> get props => [query];

}

final class GetEnrolledTraining extends TrainingEvent {
  final String id;
  final String trainingId;

  const GetEnrolledTraining({required this.id, required this.trainingId,});

  @override
  List<Object?> get props => [id];

}

final class EnrollTraining extends TrainingEvent {
  final TrainingData trainingData;


  const EnrollTraining(this.trainingData);

  @override
  List<Object?> get props => [trainingData];

}

final class CancelTraining extends TrainingEvent {
  final String trainingId;

  const CancelTraining(this.trainingId);

  @override
  List<Object?> get props => [trainingId];

}