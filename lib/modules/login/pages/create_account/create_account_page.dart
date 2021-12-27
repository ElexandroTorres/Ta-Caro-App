import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/login_controller.dart';
import 'package:ta_caro/modules/login/pages/create_account/create_account_controller.dart';
import 'package:ta_caro/modules/login/repositories/login_repository_implementation.dart';
import 'package:ta_caro/shared/theme/app_theme.dart';
import 'package:ta_caro/shared/widgets/custom_button.dart';
import 'package:ta_caro/shared/widgets/input_text.dart';
import 'package:validators/validators.dart';
import 'package:ta_caro/shared/services/app_database.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final CreateAccountController controller;

  @override
  void initState() {
    controller = CreateAccountController(
        repository: LoginRepository(database: AppDatabase.instance));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        leading: BackButton(
          color: AppTheme.colors.backButton,
        ),
        elevation: 0,
      ),
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Criando uma conta',
                style: AppTheme.textStyles.title,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Mantenha seus gastos em dia',
                style: AppTheme.textStyles.subtitle,
              ),
              SizedBox(
                height: 16,
              ),
              InputText(
                label: 'Nome',
                hint: 'Digite o seu nome',
                validator: (value) =>
                    value.isNotEmpty ? null : 'Insira um nome',
                onChanged: (value) => controller.onChange(name: value),
              ),
              SizedBox(
                height: 16,
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
                validator: (value) =>
                    value.length >= 6 ? null : "Digite uma senha maior",
                onChanged: (value) => controller.onChange(password: value),
              ),
              SizedBox(
                height: 16,
              ),
              CustomButton(
                label: 'Criar conta',
                type: ButtonType.fill,
                onTap: () {
                  controller.createAccount();
                },
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
