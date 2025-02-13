import 'package:bloc/bloc.dart';
import 'package:cimb_growthhub_app/bloc/detail_training/detail_training_bloc.dart';
import 'package:cimb_growthhub_app/model/response/traning.dart';
import 'package:cimb_growthhub_app/repository/training_repository.dart';
import 'package:equatable/equatable.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final TrainingRepository _trainingRepository;

  TrainingBloc(this._trainingRepository) : super(TrainingInitial()) {
    on<GetTrainingData>(_getTraining);
    on<GetTrainingDataByID>(_getTrainingDetail);
  }


  Future<void> _getTraining(GetTrainingData event, Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    try {
      List<TrainingData> data = await _trainingRepository.getTraining();
      emit(TrainingLoaded(data: data));

    
    } catch (e) {
      emit(TrainingError(error: e.toString()));
    }

  }

  Future<void> _getTrainingDetail(GetTrainingDataByID event, Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    try {
      TrainingData data = await _trainingRepository.getTrainingById(event.id);
      emit(TrainingDetailLoaded(data: data));
    
    } catch (e) {
      emit(TrainingError(error: e.toString()));
    }

  }

}
