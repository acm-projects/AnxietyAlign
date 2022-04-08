import 'package:firebase_auth/firebase_auth.dart';
import 'package:counter/models/my_user.dart';
import 'package:counter/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? _userFromFirebaseUser(User? user) {
    if(user == null) {
      return null;
    }
    return MyUser(userID: user.uid);
  }
  String? get currUserID {
    if(_auth.currentUser == null) {
      print("There is no current user available");
      return null;
    }
    return _auth.currentUser!.uid;
  }
  Future register(String email, String username, String password) async {
    if(username.contains('@')) {
      print('Username cannot contain \'@\'');
      return null;
    }
    final List<MyUser> users = await DatabaseService().users.first;
    for(MyUser user in users) {
      if(user.username == username) {
        print('Username has already been taken');
        return null;
      }
    }
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      DatabaseService(userID: result.user!.uid).setUserID(result.user!.uid);
      DatabaseService(userID: result.user!.uid).setEmail(email);
      DatabaseService(userID: result.user!.uid).setUsername(username);
      return _userFromFirebaseUser(result.user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  Future signInWithUsernameAndPassword(String username, String password) async {
    // SIGNED IN WITH USERNAME
    if(!username.contains('@')) {
      final List<MyUser> users = await DatabaseService().users.first;
      final MyUser? user = users.isNotEmpty ? users.firstWhere((user) => user.username == username) : null;
      if(user == null) {
        print('User does not exist');
        return null;
      }
      username = user.email!;
    }
    // SIGNED IN WITH EMAIL
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: username, password: password);
      return _userFromFirebaseUser(result.user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      DatabaseService(userID: result.user!.uid).setUserID(result.user!.uid);
      DatabaseService(userID: result.user!.uid).setEmail('');
      DatabaseService(userID: result.user!.uid).setUsername('');
      return _userFromFirebaseUser(result.user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  Stream<MyUser?> get usersStream => _auth.authStateChanges().map(_userFromFirebaseUser);
}
