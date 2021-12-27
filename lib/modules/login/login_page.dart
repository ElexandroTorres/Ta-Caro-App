import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/login_controller.dart';
import 'package:ta_caro/modules/login/pages/create_account/create_account_page.dart';
import 'package:ta_caro/modules/login/repositories/login_repository_implementation.dart';
import 'package:ta_caro/shared/services/app_database.dart';
import 'package:ta_caro/shared/theme/app_theme.dart';
import 'package:ta_caro/shared/theme/app_text.dart';
import 'package:ta_caro/shared/widgets/custom_button.dart';
import 'package:ta_caro/shared/widgets/input_text.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;

  @override
  void initState() {
    controller = LoginController(
        repository: LoginRepository(database: AppDatabase.instance));
    controller.addListener(() {
      controller.state.when(
          sucess: (value) => print('Deu bom'),
          error: (message, _) => print(message),
          loading: () => print('loading...'),
          orElse: () {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                ),
              ),
              InputText(
                label: 'Email',
                hint: 'Digite o seu email',
                validator: (value) =>
                    isEmail(value) ? null : 'Digite um email valido',
                onChanged: (value) => controller.onChange(email: value),
              ),
              SizedBox(
                height: 16,
              ),
              InputText(
                label: 'Senha',
                hint: 'Digite a sua senha',
                obscure: true,
                validator: (value) =>
                    value.length >= 6 ? null : 'Digite uma senha maior',
                onChanged: (value) => controller.onChange(password: value),
              ),
              SizedBox(
                height: 16,
              ),
              CustomButton(
                label: 'Entrar',
                type: ButtonType.fill,
                onTap: () {
                  controller.login();
                },
              ),
              SizedBox(
                height: 8,
              ),
              CustomButton(
                label: 'Criar conta',
                type: ButtonType.outline,
                onTap: () {
                  Navigator.pushNamed(context, '/login/create-account');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
