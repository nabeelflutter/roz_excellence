import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel{
  FirebaseAuth? authentication;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> loginWithEmailAndPassword({required String email,required String password})async{
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return Future(() => user);
  }
  Future logout() {
    authentication!.signOut();
    return Future.delayed(Duration.zero);
  }
}