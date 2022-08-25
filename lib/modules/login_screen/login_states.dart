

import 'package:lavie/models/login_model/login_model.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginSwitchingDoneState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  UserModel model;
  LoginSuccessState(this.model);
}
class LoginErrorState extends LoginStates{
  String error;
  LoginErrorState(this.error);
}


class RegisterLoadingState extends LoginStates{}
class RegisterSuccessState extends LoginStates{
  UserModel model;
  RegisterSuccessState(this.model);
}
class RegisterErrorState extends LoginStates{
  String error;
  RegisterErrorState(this.error);
}
