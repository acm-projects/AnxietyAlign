import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter/models/my_user.dart';

class DatabaseService {
  final String userID;
  DatabaseService({this.userID = ''});
  final CollectionReference usersCollection
    = FirebaseFirestore.instance.collection('users');

  Future setUserID(String newUserID) async => await usersCollection.doc(userID).set(
      {'userID': newUserID},
      SetOptions(merge: true)
  );
  Future setEmail(String email) async => await usersCollection.doc(userID).set(
      {'email': email},
      SetOptions(merge: true)
  );
  Future setUsername(String username) async => await usersCollection.doc(userID).set(
      {'username': username},
      SetOptions(merge: true)
  );

  void logAttack(List<int> options, List<String> others) {
    DocumentReference userRef = usersCollection.doc(userID);
    CollectionReference collection = userRef.collection('symptoms');
    DocumentReference? doc;
    switch(options[0]) {
      case 0: doc = collection.doc('rapid_breathing'); break;
      case 1: doc = collection.doc('heart_rate'); break;
      case 2: doc = collection.doc('shaking'); break;
      case 3: doc = collection.doc('dizziness'); break;
      case 4: doc = collection.doc('other'); break;
      default: doc = null;
    }
    incrementCount(doc, others[0]);
    collection = userRef.collection('triggers');
    switch(options[1]) {
      case 0: doc = collection.doc('loved_one'); break;
      case 1: doc = collection.doc('social_event'); break;
      case 2: doc = collection.doc('academic_stress'); break;
      case 3: doc = collection.doc('financial_distress'); break;
      case 4: doc = collection.doc('other'); break;
      default: doc = null;
    }
    incrementCount(doc, others[1]);
    collection = userRef.collection('thoughts');
    switch(options[2]) {
      case 0: doc = collection.doc('stressed'); break;
      case 1: doc = collection.doc('upset'); break;
      case 2: doc = collection.doc('exhausted'); break;
      case 3: doc = collection.doc('inadequate'); break;
      case 4: doc = collection.doc('other'); break;
      default: doc = null;
    }
    incrementCount(doc, others[2]);
    collection = userRef.collection('solution');
    switch(options[3]) {
      case 0: doc = collection.doc('breathing_exercises'); break;
      case 1: doc = collection.doc('focus_object'); break;
      case 2: doc = collection.doc('light_exercise'); break;
      case 3: doc = collection.doc('leaving_environment'); break;
      case 4: doc = collection.doc('other'); break;
      default: doc = null;
    }
    incrementCount(doc, others[3]);
  }
  Future<void> incrementCount(DocumentReference? doc, String other) async {
    if(doc == null) return;
    try {
      DocumentSnapshot snapshot = await doc.get();
      doc.set({'count': snapshot.get('count') + 1});
    } catch(e) {
      doc.set({'count': 1});
    }
    if(doc.id != 'other') return;
    DocumentReference? otherDoc = doc.collection('other').doc(other);
    try {
      DocumentSnapshot snapshot = await otherDoc.get();
      otherDoc.set({'count': snapshot.get('count') + 1});
    } catch(e) {
      otherDoc.set({'count': 1});
    }
  }

  Future setJournalText(String journalID, String text) async {
    await usersCollection.doc(userID).collection('journals').doc(journalID).set(
      {'text': text},
      SetOptions(merge: true)
    );
  }
  Future setJournalAudio(String journalID, List<int> audio) async {
    await usersCollection.doc(userID).collection('journals').doc(journalID).set(
      {'audio': audio},
      SetOptions(merge: true)
    );
  }

  List<MyUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MyUser(
          userID: doc.get('userID'),
          email: doc.get('email'),
          username: doc.get('username')
      );
    }).toList();
  }
  Stream<List<MyUser>> get users
    => usersCollection.snapshots().map(_userListFromSnapshot);
}
