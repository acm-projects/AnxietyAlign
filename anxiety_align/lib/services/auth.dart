import 'package:anxiety_align/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:anxiety_align/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user) {
    if (user == null) {
      return null;
    }
    return MyUser(userID: user.uid);
  }
  // auth change user stream

  String? get currUserID {
    if (_auth.currentUser == null) {
      print("There is no current user available");
      return null;
    }
    return _auth.currentUser!.uid;
  }

  User? get currUser {
    if (_auth.currentUser == null) {
      print("There is no current user available");
      return null;
    }
    return _auth.currentUser!;
  }

  Future changePassword(String currentPass, String newPass) async {
    final user = await _auth.currentUser!;
    final cred =
        EmailAuthProvider.credential(email: user.email!, password: currentPass);
    try {
      user.reauthenticateWithCredential(cred);
      user.updatePassword(newPass);
      print("Successfully changed password");
      return user;
    } catch (e) {
      print("Password can't be changed" + e.toString());
      return null;
    }
  }

  //sign in for anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in for email password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password

  Future registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      DatabaseService(userID: result.user!.uid).setUserID(result.user!.uid);
      DatabaseService(userID: result.user!.uid).setEmail(email);
      DatabaseService(userID: result.user!.uid).setUsername(username);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<MyUser?> get usersStream =>
      _auth.authStateChanges().map(_userFromFirebaseUser);
}
