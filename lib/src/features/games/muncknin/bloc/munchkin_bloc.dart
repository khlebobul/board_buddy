import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'munchkin_event.dart';
part 'munchkin_state.dart';

class MunchkinBloc extends Bloc<MunchkinEvent, MunchkinState> {
  MunchkinBloc() : super(MunchkinInitial()) {
    on<MunchkinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
