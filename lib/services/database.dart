import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:anxiety_align/models/user.dart';

class DatabaseService {
  final String userID;
  DatabaseService({this.userID = ''});
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future setUserID(String newUserID) async => await usersCollection
      .doc(userID)
      .set({'userID': newUserID}, SetOptions(merge: true));
  Future setEmail(String email) async => await usersCollection
      .doc(userID)
      .set({'email': email}, SetOptions(merge: true));
  Future setUsername(String username) async => await usersCollection
      .doc(userID)
      .set({'username': username}, SetOptions(merge: true));

  Future<String?> getUsernameFromID(String id) async {
    QuerySnapshot snapshot = await usersCollection.get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      if (doc.get('userID') != id)
        continue;
      else
        return doc.get('username');
    }
  }

  Future<String?> getMedicationName() async {
    QuerySnapshot snapshot =
        await usersCollection.doc(userID).collection('medications').get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
        return doc.get('name');
    }
  }
  Future<String?> getDosage() async {
    QuerySnapshot snapshot =
    await usersCollection.doc(userID).collection('medications').get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      return doc.get('dosage');
    }
  }
  Future<int?> getFreq() async {
    QuerySnapshot snapshot =
    await usersCollection.doc(userID).collection('medications').get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      return doc.get('times');
    }
  }
  Future<List<dynamic>?> getDays() async {
    QuerySnapshot snapshot =
    await usersCollection.doc(userID).collection('medications').get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      return doc.get('days');
    }
  }

  Future<List<String>> getJournalTimestamps() async {
    List<String> timestamps = <String>[];
    CollectionReference journals = usersCollection.doc(userID)
        .collection('journals');
    QuerySnapshot snapshot = await journals.orderBy(
        'timestamp',
        descending: true
    ).get();
    for(QueryDocumentSnapshot doc in snapshot.docs) {
      timestamps.add(doc.id);
    }
    return timestamps;
  }

  Future<String?> getJournalTextFromID(String id) async {
    CollectionReference journals = usersCollection.doc(userID)
        .collection('journals');
    QuerySnapshot snapshot = await journals.get();
    for(QueryDocumentSnapshot doc in snapshot.docs) {
      if(id == doc.id) return doc.get('text');
    }
    return null;
  }

  void logAttack(DateTime timestamp, int rating, List<int> options,
      List<String> others) {
    DocumentReference userRef = usersCollection.doc(userID);
    CollectionReference collection = userRef.collection('ratings');
    DocumentReference? doc = collection.doc(timestamp.toString());
    doc.set({
      'timestamp': timestamp,
      'rating': rating
    });
    collection = userRef.collection('symptoms');
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
    if (doc == null) return;
    try {
      DocumentSnapshot snapshot = await doc.get();
      doc.set({'count': snapshot.get('count') + 1});
    } catch (e) {
      doc.set({'count': 1});
    }
    if (doc.id != 'other') return;
    DocumentReference? otherDoc = doc.collection('other').doc(other);
    try {
      DocumentSnapshot snapshot = await otherDoc.get();
      otherDoc.set({'count': snapshot.get('count') + 1});
    } catch (e) {
      otherDoc.set({'count': 1});
    }
  }

  Future setJournalText(String journalID, String text) async {
    await usersCollection
        .doc(userID)
        .collection('journals')
        .doc(journalID)
        .set({'text': text}, SetOptions(merge: true));
  }

  Future setJournalAudio(String journalID, List<int> audio) async {
    await usersCollection
        .doc(userID)
        .collection('journals')
        .doc(journalID)
        .set({'audio': audio}, SetOptions(merge: true));
  }

  Future setMedications(String MedId, String name, String dosage,
      List<String> days, int times) async {
    await usersCollection
        .doc(userID)
        .collection('medications')
        .doc(MedId)
        .set({'name': name}, SetOptions(merge: true));
    await usersCollection
        .doc(userID)
        .collection('medications')
        .doc(MedId)
        .set({'dosage': dosage}, SetOptions(merge: true));
    await usersCollection
        .doc(userID)
        .collection('medications')
        .doc(MedId)
        .set({'days': days}, SetOptions(merge: true));
    await usersCollection
        .doc(userID)
        .collection('medications')
        .doc(MedId)
        .set({'times': times}, SetOptions(merge: true));
  }

  List<MyUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MyUser(
          userID: doc.get('userID'),
          email: doc.get('email'),
          username: doc.get('username'));
    }).toList();
  }

  Future<int> getCount() async {
    int count = await usersCollection
        .doc(userID)
        .collection('medications')
        .get()
        .then((value) => value.size);
    return count;
  }

  Stream<List<MyUser>> get users =>
      usersCollection.snapshots().map(_userListFromSnapshot);
}
