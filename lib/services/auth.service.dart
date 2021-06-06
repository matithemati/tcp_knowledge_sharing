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
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await addRegisterInfo(UserData(
          uid: user.user!.uid,
          email: user.user!.email.toString(),
          registerDate: Timestamp.now(),
          isAdmin: false));
    } catch (e) {
      return false;
    }
    return true;
  }

  Future anonymousSignIn() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  Future signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      print(e);
    }
  }

  Future addRegisterInfo(UserData user) async {
    try {
      await _db.collection('users').doc(user.email).set(user.toMap());
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
