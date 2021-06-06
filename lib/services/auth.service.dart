import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tcp_knowledge_sharing/models/userData.model.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User?> getUser() async {
    try {
      return _auth.currentUser;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    return true;
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    return true;
  }

  Future anonymousSignIn() async {
  }

  Future signInWithGoogle() async {
  }

  Future addRegisterInfo(UserData user) async {
  }

  Future signOut() async {
  }
}
