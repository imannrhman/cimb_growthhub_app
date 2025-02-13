import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_training_event.dart';
part 'my_training_state.dart';

class MyTrainingBloc extends Bloc<MyTrainingEvent, MyTrainingState> {
  MyTrainingBloc() : super(MyTrainingInitial()) {
    on<MyTrainingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
