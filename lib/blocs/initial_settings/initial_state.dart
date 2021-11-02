part of 'initial_bloc.dart';

abstract class PostEventState extends Equatable {
  const PostEventState();
}

class InitialState extends PostEventState {
  const InitialState();

  @override
  List<Object> get props => [];
}

class Loading extends PostEventState {
  const Loading();

  @override
  List<Object> get props => [];
}

class Loaded extends PostEventState {

  const Loaded();

  @override
  List<Object> get props => [];
}

class Error extends PostEventState {

  const Error();

  @override
  List<Object> get props => [];
}
