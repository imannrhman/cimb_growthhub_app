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