import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDzKqBClK0zaXBse52RsAMnZNUs6fo3j5M",
            authDomain: "cakeschool-971b3.firebaseapp.com",
            projectId: "cakeschool-971b3",
            storageBucket: "cakeschool-971b3.appspot.com",
            messagingSenderId: "7701995260",
            appId: "1:7701995260:web:f493732411a7e9436e0179",
            measurementId: "G-KPM76DFHL9"));
  } else {
    await Firebase.initializeApp();
  }
}
