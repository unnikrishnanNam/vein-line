import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:veinline/pages/home.dart';
import 'package:veinline/pages/patient_profile.dart';
import 'package:veinline/styles/style_utils.dart';
import 'package:veinline/widgets/my_button.dart';

import '../models/patient_model.dart';

class QuestionnairePage extends StatelessWidget {
  QuestionnairePage({super.key});

  List<PatientModel> patients = [
    PatientModel(
        id: '1234567890',
        name: 'Unnikrishnan',
        email: '9447unni9447@gmail.com',
        phone: '1234567890',
        photoUrl:
            'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
    PatientModel(
        id: '0987654321',
        name: 'Random Name',
        email: 'random@gmail.com',
        phone: '098761234567',
        photoUrl:
            'https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    void handleOnPatientClick() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => PatientProfilePage(patient: patients[0]),
      ));
    }

    void handleOnDoctorClick() {}

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'lib/assets/images/image2.png',
                height: 320,
                width: 320,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 28, horizontal: 18),
                child: Text(
                  'Are you a Patient or a Doctor ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: VeinLineColors.seconadary,
                      fontSize: 34,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    MyButton(
                      text: 'Patient',
                      color: VeinLineColors.primary,
                      onPress: handleOnPatientClick,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyButton(
                      text: 'Doctor',
                      color: VeinLineColors.seconadary,
                      onPress: handleOnDoctorClick,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
