part of 'training_bloc.dart';

sealed class TrainingEvent extends Equatable {
  const TrainingEvent();
}

final class GetTrainingData extends TrainingEvent {
  @override
  List<Object?> get props => [];

}