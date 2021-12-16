import 'package:flutter/material.dart';
import 'package:ta_caro/shared/theme/app_theme.dart';
import 'package:ta_caro/shared/widgets/custom_button.dart';
import 'package:ta_caro/shared/widgets/input_text.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputText(
              label: 'Nome',
              hint: 'Digite o seu nome',
            ),
            SizedBox(
              height: 16,
            ),
            InputText(
              label: 'Email',
              hint: 'Digite o seu email',
            ),
            SizedBox(
              height: 16,
            ),
            InputText(
              label: 'Senha',
              hint: 'Digite a sua senha',
            ),
            SizedBox(
              height: 16,
            ),
            CustomButton(
              label: 'Criar conta',
              type: ButtonType.fill,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Ja tem uma conta? faça login',
              style: TextStyle(
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
