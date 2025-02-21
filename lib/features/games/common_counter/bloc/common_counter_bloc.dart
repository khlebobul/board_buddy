import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'common_counter_event.dart';
part 'common_counter_state.dart';

class CommonCounterBloc extends Bloc<CommonCounterEvent, CommonCounterState> {
  CommonCounterBloc() : super(CommonCounterInitial()) {
    on<CommonCounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
