part of 'my_training_bloc.dart';

sealed class MyTrainingEvent extends Equatable {
  const MyTrainingEvent();
}

final class GetMyTrainingData extends MyTrainingEvent {
  @override
  List<Object?> get props => [];

}