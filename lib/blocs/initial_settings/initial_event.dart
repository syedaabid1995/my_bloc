part of 'initial_bloc.dart';

abstract class InitialEvent extends Equatable {
  const InitialEvent();
}

class GetInitialSettings extends InitialEvent {
  final Box? _userBox;
  const GetInitialSettings(this._userBox);

  @override
  List<Object> get props => [];
}
