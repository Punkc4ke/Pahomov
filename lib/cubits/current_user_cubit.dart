import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CurrentUserCubit extends Cubit<CurrentUserState> {
  CurrentUserCubit() : super(CurrentUserInitial());

  void onLoad(String userName) {
    emit(CurrentUser(userName));
  }
}

@immutable
abstract class CurrentUserState {}

class CurrentUserInitial extends CurrentUserState {}

class CurrentUser extends CurrentUserState {
  late String userName;

  CurrentUser(this.userName);
}