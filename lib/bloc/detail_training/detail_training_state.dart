part of 'detail_training_bloc.dart';

sealed class DetailTrainingState extends Equatable {
  const DetailTrainingState();
}

final class DetailTrainingInitial extends DetailTrainingState {
  @override
  List<Object> get props => [];
}

final class DetailTrainingLoading extends DetailTrainingState {
  @override
  List<Object?> get props => [];
}

final class DetailTrainingLoaded extends DetailTrainingState {
  @override
  List<Object?> get props => [];
}

final class DetailTrainingError extends DetailTrainingState {
  final String error;

  const DetailTrainingError({required this.error});

  @override
  List<Object?> get props => [];

}