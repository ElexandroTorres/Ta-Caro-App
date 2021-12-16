import 'package:flutter/material.dart';
import 'package:ta_caro/shared/theme/app_theme.dart';
import 'package:ta_caro/shared/widgets/custom_button.dart';
import 'package:ta_caro/shared/widgets/input_text.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

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
              onTap: () {},
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
