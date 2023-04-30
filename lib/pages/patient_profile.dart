import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:veinline/models/doctor_model.dart';
import 'package:veinline/models/patient_model.dart';
import 'package:veinline/pages/ai.dart';
import 'package:veinline/styles/style_utils.dart';
import 'package:veinline/widgets/doc_tile.dart';
import 'package:veinline/widgets/searchbox.dart';

class PatientProfilePage extends StatefulWidget {
  final PatientModel patient;
  const PatientProfilePage({super.key, required this.patient});

  @override
  State<PatientProfilePage> createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  List<DoctorModel> doctors = [
    DoctorModel(
        id: '1234567890',
        name: 'Dr Ajay Sathvik',
        email: 'ajaysathviksu@gmail.com',
        phone: '1234567890',
        experience: 10,
        photoUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN60hltTl23euwWq2kW7ymUvfy6s3E6mgaOQ&usqp=CAU',
        certificate:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZBHFcLDab7K2wKFgVcZ3ehxPAvbIgAjj1gA&usqp=CAU')
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: VeinLineColors.dark,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: HeaderCurvedContainer(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(widget.patient.photoUrl.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.patient.name.toString(),
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.patient.email.toString(),
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Divider(
                              thickness: 1,
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Recent Chats',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Divider(
                              thickness: 1,
                            ),
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: SearchBox(),
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          itemCount: doctors.length,
                          itemBuilder: (context, index) {
                            return DocTile(doctor: doctors[index]);
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = VeinLineColors.dark;
    Path path = Path()
      ..relativeLineTo(0, 120)
      ..quadraticBezierTo(size.width / 2, 225.0, size.width, 120)
      ..relativeLineTo(0, -150)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
