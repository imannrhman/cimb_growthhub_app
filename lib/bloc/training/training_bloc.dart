import 'package:bloc/bloc.dart';
import 'package:cimb_growthhub_app/bloc/detail_training/detail_training_bloc.dart';
import 'package:cimb_growthhub_app/model/response/enroll.dart';
import 'package:cimb_growthhub_app/model/response/traning.dart';
import 'package:cimb_growthhub_app/repository/training_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final TrainingRepository _trainingRepository;

  TrainingBloc(this._trainingRepository) : super(TrainingInitial()) {
    on<GetTrainingData>(_getTraining);
    on<GetTrainingDataByID>(_getTrainingDetail);
    on<GetEnrolledTraining>(_getEnrolledTraining);
    on<SearchEvent>(_onSearch);
    on<EnrollTraining>(_enrollTraining);
    on<CancelTraining>(_cancelTraining);
  }

  Future<void> _onSearch(SearchEvent event, Emitter<TrainingState> emit) async {

    emit(TrainingLoading());
     List<TrainingData> searchData = await _trainingRepository.getTraining();
     searchData = searchData.where((data) => data.nama?.toLowerCase().contains(event.query.toLowerCase())  ?? false).toList() ?? [];
    emit(TrainingLoaded(data: searchData));
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

  Future<void> _getEnrolledTraining(GetEnrolledTraining event, Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");


      if (token != null) {
        TrainingData data = await _trainingRepository.getTrainingById(event.trainingId);
        Enrollment enrollmentData = await _trainingRepository.getEnrolledTrainingDetail(token, event.id, event.trainingId);
        emit(TrainingEnrollLLoaded(trainingData: data, enrollmentData: enrollmentData));
      } else {
        emit(TrainingError(error: "Silahkan Login Kembali"));
      }
    } catch (e) {
      emit(TrainingError(error: e.toString()));
    }
  }

  Future<void> _enrollTraining(EnrollTraining event, Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");


      if (token != null) {
        EnrollmentData enrollmentData = await _trainingRepository.enrollTraining(token,event.trainingData.id ?? "");
        TrainingData data = await _trainingRepository.getTrainingById(event.trainingData.id ?? "");
        emit(TrainingEnrollLSuccess(trainingData: data.copyWith(kapasitasTersisa: (data.kapasitasTersisa ?? 0) + 1), enrollmentData: enrollmentData.enrollment));
      } else {
        emit(TrainingError(error: "Silahkan Login Kembali"));
      }
    } catch (e) {
      emit(TrainingError(error: e.toString()));
    }
  }

  Future<void> _cancelTraining(CancelTraining event, Emitter<TrainingState> emit) async {

    emit(TrainingLoading());
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");

      if (token != null) {
        String message = await _trainingRepository.cancelTraining(token,event.trainingId);
        emit(TrainingCancelSuccess(message, event.trainingId));
      } else {
        emit(TrainingError(error: "Silahkan Login Kembali"));
      }
    } catch (e) {
      emit(TrainingError(error: e.toString()));
    }
  }

}
