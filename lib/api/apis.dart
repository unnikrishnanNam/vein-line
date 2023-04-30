import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/patient_model.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

  handleGoogleButtonClick() {
    _signInWithGoogle().then((user) async {
      PatientModel patient = PatientModel(
        id: user.user?.uid,
        phone: user.user?.phoneNumber,
        photoUrl: user.user?.photoURL,
        email: user.user?.email,
        name: user.user?.displayName,
      );

      await firestore
          .collection('Patients')
          .doc(patient.id)
          .set(patient.toMap());

      // await service.addPatient(patient);

      // goes to the homepage
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }

// sign out
// ignore: non_constant_identifier_names
  SignOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  static Future<bool> userExists() async {
    return (await firestore.collection('Patients').doc(user.uid).get()).exists;
  }
}
