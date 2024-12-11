import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial(switchIndex: 0)) {
    on<MainEvent>((event, emit) {
      if (event is SwitchChangeEvent) {
        emit(MainInitial(switchIndex: event.switchIndex));
      }
    });
  }
}
