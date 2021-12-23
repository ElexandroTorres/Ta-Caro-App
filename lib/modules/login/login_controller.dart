import 'package:flutter/material.dart';
import 'package:ta_caro/shared/utilities/app_state.dart';

class LoginController extends ChangeNotifier {
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  void login() {
    if (validate()) {
      try {
        update(AppState.loading());
        //CHAMAR O BACKEND
        update(AppState.sucess<String>('Usuario está logado'));
      } on Exception catch (e) {
        update(AppState.error('Deu ruim', e: e));
      }
    }
  }
}
