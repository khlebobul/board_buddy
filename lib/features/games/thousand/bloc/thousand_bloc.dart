import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'thousand_event.dart';
part 'thousand_state.dart';

class ThousandBloc extends Bloc<ThousandEvent, ThousandState> {
  ThousandBloc() : super(ThousandInitial()) {
    on<ThousandEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
