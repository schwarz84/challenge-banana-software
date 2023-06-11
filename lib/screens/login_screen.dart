import 'package:flutter/material.dart';
import 'package:flutter_challenge_2023/services/services.dart';
import 'package:provider/provider.dart';
import '../ui/inputs.dart';
import '../widgets/widgets.dart';
import 'package:flutter_challenge_2023/data/pattern_validator.dart';
import 'package:flutter_challenge_2023/providers/login_form_provider.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Background(
        card: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 400,
              ),
              FormCard(
                form: Column(
                  children: [
                    SizedBox( height: 10),
                    Text('Bienvenido', style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox( height: 30),
                    ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      child: _LoginForm(),
                    ),
                  ],
                )
              ),
            ],
          )
        )
      )
    );
  }
}
class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecorations(
                labelText: 'Usuario',
                prefixIcon: Icons.person
              ),
              onChanged: (value) => loginForm.username = value,
              validator: (input) {
                return input != null
                ? PatternValidator.inputPatternValidator(input: input)
                : null;
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: InputDecorations.authInputDecorations(
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outlined
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (input) {
                return input != null
                    ? PatternValidator.inputPatternValidator(input: input)
                    : null;
              },
            ),
            SizedBox(height: 50),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              disabledColor: Colors.grey,
              color: Color(0xFF9E007E),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                child: Text(
                  loginForm.isLoading
                    ? 'Espere...'
                    : 'Ingresar',
                  style: TextStyle(color: Colors.white, fontSize: 30)
                )
              ),
              onPressed: loginForm.isLoading ? null : () async {
                FocusScope.of(context).unfocus();
                final authService = Provider.of<AuthService>(context, listen: false);
                if (!loginForm.isValidForm()) return;

                loginForm.isLoading = true;

                final String? errorLogin = await authService.login(loginForm.username, loginForm.password);
                if (errorLogin == null) {
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                  NotificationService.showSnackbar('El nombre de usuario y/o la contraseña son invalidos.');
                }
                loginForm.isLoading = false;
              }
            )
          ],
        ),
      )
    );
  }
}
