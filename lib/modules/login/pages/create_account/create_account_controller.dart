import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/repositories/login_repository_implementation.dart';
import 'package:ta_caro/shared/models/user_model.dart';
import 'package:ta_caro/shared/services/app_database.dart';
import 'package:ta_caro/shared/utilities/app_state.dart';

class CreateAccountController extends ChangeNotifier {
  final LoginRepository repository;

  AppState state = AppState.empty();

  final formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = '';

  CreateAccountController({required this.repository});

  void onChange({String? email, String? password, String? name}) {
    _email = email ?? _email;
    _password = password ?? _password;
    _name = name ?? _name;
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

  Future<void> createAccount() async {
    if (validate()) {
      try {
        update(AppState.loading());
        print('criando conta.');
        final response = await repository.createAccount(
            email: _email, password: _password, name: _name);
        print('contra criada');
        update(AppState.sucess<UserModel>(response));
      } catch (e) {
        print('deeuu ruim ${e.toString()}');
        update(AppState.error(e.toString()));
      }
    }
  }
}
