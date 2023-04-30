import 'package:flutter/material.dart';
import 'package:veinline/api/apis.dart';
import 'package:veinline/models/patient_model.dart';
import 'package:veinline/pages/questionnaire.dart';
import 'package:veinline/styles/style_utils.dart';
import 'package:veinline/widgets/my_button.dart';
import 'package:veinline/widgets/my_icon_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _handleLoginPress() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => QuestionnairePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'lib/assets/images/image1.png',
              height: 320,
              width: 320,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                const Text(
                  'Welcome to \n VeinLine',
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: VeinLineColors.seconadary),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Text(
                    'Transforming the way you take care of your health with our efficient, secure, and user-friendly app.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: VeinLineColors.seconadary),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyIconButton(
                    text: 'Login with Google',
                    color: VeinLineColors.dark,
                    icon: 'lib/assets/icons/google.png',
                    onTap: _handleLoginPress,
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
