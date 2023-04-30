import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:veinline/models/patient_model.dart';
import 'package:veinline/pages/patient_profile.dart';

import '../styles/style_utils.dart';

class AiPage extends StatelessWidget {
  final PatientModel patient;
  const AiPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GNav(
              color: Colors.white,
              activeColor: VeinLineColors.primary,
              backgroundColor: VeinLineColors.dark,
              tabs: [
                const GButton(
                  icon: Icons.medical_information,
                  gap: 10,
                  text: 'AI',
                  textSize: 48,
                  iconSize: 32,
                ),
                GButton(
                  icon: Icons.person_rounded,
                  gap: 10,
                  text: 'Profile',
                  textSize: 48,
                  iconSize: 32,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientProfilePage(
                            patient: patient,
                          ),
                        ));
                  },
                ),
                GButton(
                  icon: Icons.search,
                  gap: 10,
                  text: 'Doctors',
                  textSize: 48,
                  iconSize: 32,
                )
              ]),
        ),
      ),
      body: Center(child: Text('AI PAGE')),
    );
  }
}
