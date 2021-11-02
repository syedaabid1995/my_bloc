import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'initial_event.dart';

part 'initial_state.dart';

class InitialBloc
    extends Bloc<InitialEvent, PostEventState> {

  InitialBloc() : super(InitialState());

  @override
  Stream<PostEventState> mapEventToState(
      InitialEvent event,
      ) async* {
    if (event is GetInitialSettings) {
    }
  }
}
