import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAwxvfGQAlE9rikkRhwgLy7Eu-aghfyVY8",
            authDomain: "easynangora-81ad5.firebaseapp.com",
            projectId: "easynangora-81ad5",
            storageBucket: "easynangora-81ad5.appspot.com",
            messagingSenderId: "138985972364",
            appId: "1:138985972364:web:fcefa93757b7daf4a4d1a9",
            measurementId: "G-V6GP14QRFB"));
  } else {
    await Firebase.initializeApp();
  }
}
