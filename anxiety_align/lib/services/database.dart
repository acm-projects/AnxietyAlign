import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:anxiety_align/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class DatabaseService {
  final String userID;
  DatabaseService({this.userID = ''});
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future setUserID(String newUserID) async => await usersCollection.doc(userID)
  .set({'userID': newUserID}, SetOptions(merge: true));

  Future setEmail(String email) async => await usersCollection.doc(userID)
  .set({'email': email}, SetOptions(merge: true));

  Future setUsername(String username) async => await usersCollection.doc(userID)
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

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Future<int> getDaysWithoutAttack() async {
    List<String> timestamps = <String>[];
    QuerySnapshot snapshot = await usersCollection
        .doc(userID)
        .collection('ratings')
        .orderBy('timestamp', descending: true)
        .get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      timestamps.add(doc.id);
    }
    if(timestamps.length == 0)
      {
        return 0;
      }
    timestamps.sort((a, b) => a.compareTo(b));
    int difference = daysBetween(
        DateTime.parse(timestamps[timestamps.length - 1]),
        DateTime.now());
    return difference;
  }

  Future<List<int>?> getGraphData(String document) async {
    List<int> count = List.filled(5, 0);
    QuerySnapshot snapshot =
        await usersCollection.doc(userID).collection(document).get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      if (document == 'triggers') {
        switch (doc.id) {
          case 'loved_one':
            count[0] = doc.get('count');
            break;
          case 'social_event':
            count[1] = doc.get('count');
            break;
          case 'academic_stress':
            count[2] = doc.get('count');
            break;
          case 'financial_distress':
            count[3] = doc.get('count');
            break;
          case 'other':
            count[4] = doc.get('count');
            break;
        }
      } else {
        switch (doc.id) {
          case 'breathing_exercises':
            count[0] = doc.get('count');
            break;
          case 'focus_object':
            count[1] = doc.get('count');
            break;
          case 'light_exercise':
            count[2] = doc.get('count');
            break;
          case 'leaving_environment':
            count[3] = doc.get('count');
            break;
          case 'other':
            count[4] = doc.get('count');
            break;
        }
      }
    }
    return count;
  }

  Future<List<num>?> getRatings() async {
    List<DateTime> timestamps = <DateTime>[];
    List<num> ratings = List.filled(6, 0);
    int cMonth = DateTime.now().month;
    QuerySnapshot snapshot = await usersCollection
        .doc(userID)
        .collection('ratings')
        .orderBy('timestamp', descending: true)
        .get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      timestamps.add((doc.get('timestamp')).toDate());
    }
    timestamps.sort((a, b) => a.compareTo(b));
    for(int i= 0; i < timestamps.length; i++) {print(timestamps[i].month);}
    for (int i = 0; i < timestamps.length; i++) {
      if (cMonth == timestamps[i].month) {
        for (QueryDocumentSnapshot doc in snapshot.docs) {
          if (timestamps[i] == (doc.get('timestamp')).toDate()) {
            ratings[1]++;
            ratings[0] += doc.get('rating');
          }
        }
      }
      if ((DateTime.now().month - 6 >= timestamps[i].month - 6) ||
          (timestamps[i].month <= cMonth)) {
        for (QueryDocumentSnapshot doc in snapshot.docs) {
          if (timestamps[i] == (doc.get('timestamp')).toDate()) {
            ratings[3]++;
            ratings[2] += doc.get('rating');
          }
        }
      }
      if ((DateTime.now().year - 1 >= timestamps[i].year - 1) && (DateTime.now().month - 6 <= timestamps[i].month - 6)) {
        for (QueryDocumentSnapshot doc in snapshot.docs) {
          if (timestamps[i] == (doc.get('timestamp')).toDate()) {
            ratings[5]++;
            ratings[4] += doc.get('rating');
          }
        }
      }
    }
    if (ratings[1] == 0) {
      ratings[0] == 0;
    } else {
      ratings[0] = ratings[0] / ratings[1];
    }
    if (ratings[3] == 0) {
      ratings[2] == 0;
    } else {
      ratings[2] = ratings[2] / ratings[3];
    }
    if (ratings[5] == 0) {
      ratings[4] == 0;
    } else {
      ratings[4] = ratings[4] / ratings[5];
    }
    return ratings;
  }

  Future<List<int>?> getAttacksByMonth() async {
    List<int> months = List.filled(12, 0);
    List<DateTime> timestamps = <DateTime>[];
    String arg;
    QuerySnapshot snapshot = await usersCollection
        .doc(userID)
        .collection('ratings')
        .orderBy('timestamp', descending: true)
        .get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      timestamps.add((doc.get('timestamp')).toDate());
    }
    timestamps.sort((a, b) => a.compareTo(b));
    for (int i = 0; i < timestamps.length; i++) {
      switch (timestamps[i].month) {
        case 1:
          months[0]++;
          break;
        case 2:
          months[1]++;
          break;
        case 3:
          months[2]++;
          break;
        case 4:
          months[3]++;
          break;
        case 5:
          months[4]++;
          break;
        case 6:
          months[5]++;
          break;
        case 7:
          months[6]++;
          break;
        case 8:
          months[7]++;
          break;
        case 9:
          months[8]++;
          break;
        case 10:
          months[9]++;
          break;
        case 11:
          months[10]++;
          break;
        case 12:
          months[11]++;
          break;
      }
    }
    return months;
  }

  Future<List<String>> getMedicationName() async {
    List<String> names = <String>[];
    QuerySnapshot snapshot = await usersCollection
        .doc(userID)
        .collection('medications')
        .orderBy('timestamp', descending: true)
        .get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      names.add(doc.get('name'));
    }
    return names;
  }

  Future<List<String>> getDosage() async {
    List<String> dosages = <String>[];
    QuerySnapshot snapshot = await usersCollection
        .doc(userID)
        .collection('medications')
        .orderBy('timestamp', descending: true)
        .get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      dosages.add(doc.get('dosage'));
    }
    return dosages;
  }

  Future<List<int>> getFreq() async {
    List<int> times = [];
    QuerySnapshot snapshot = await usersCollection
        .doc(userID)
        .collection('medications')
        .orderBy('timestamp', descending: true)
        .get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      times.add(doc.get('times'));
    }
    return times;
  }

  Future<List<List<dynamic>>> getDays() async {
    List<List<dynamic>> days = [];
    QuerySnapshot snapshot = await usersCollection
        .doc(userID)
        .collection('medications')
        .orderBy('timestamp', descending: true)
        .get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      days.add(doc.get('days'));
    }
    return days;
  }

  Future<List<String>> getOthers(String section) async {
    List<String> values = <String>["entry1", "entry2", "entry3"];
    List<String> aValues = <String>[];
    Random random = new Random();
    QuerySnapshot snapshot = await usersCollection
        .doc(userID)
        .collection(section)
        .doc('other')
        .collection('other')
        .get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      aValues.add(doc.id);
    }
    if (aValues.length <= 3) {
      values[0] = aValues.length > 0 ? aValues[0] : "entry1";
      values[1] = aValues.length > 1 ? aValues[1] : "entry2";
      values[2] = aValues.length > 2 ? aValues[2] : "entry3";
    } else {
      for (int i = 0; i < values.length; i++) {
        values[i] = aValues[random.nextInt(aValues.length)];
        while (values[0] == values[1] ||
            values[1] == values[2] ||
            values[0] == values[2]) {
          values[i] = aValues[random.nextInt(aValues.length)];
        }
      }
    }
    return values;
  }

  Future<void> removeMed(String? name) async {
    String id = " ";
    QuerySnapshot snapshot =
        await usersCollection.doc(userID).collection('medications').get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      if (doc.get('name') == name) {
        id = doc.id;
      } else {
        continue;
      }
      return usersCollection
          .doc(userID)
          .collection("medications")
          .doc(id)
          .delete();
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
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      if (id == doc.id) return doc.get('text');
    }
    return null;
  }

  void logAttack(DateTime timestamp, int rating, List<List<bool>> options,
  List<String> others) {
    DocumentReference userRef = usersCollection.doc(userID);
    CollectionReference collection = userRef.collection('ratings');
    DocumentReference doc = collection.doc(timestamp.toString());
    doc.set({'timestamp': timestamp, 'rating': rating});
    collection = userRef.collection('symptoms');
    for (int i = 0; i < 5; i++) {
      if (!options[0][i]) continue;
      switch (i) {
        case 0: doc = collection.doc('rapid_breathing'); break;
        case 1: doc = collection.doc('heart_rate'); break;
        case 2: doc = collection.doc('shaking'); break;
        case 3: doc = collection.doc('dizziness'); break;
        case 4: doc = collection.doc('other'); break;
      }
      incrementCount(doc, others[0]);
    }
    collection = userRef.collection('triggers');
    for (int i = 0; i < 5; i++) {
      if (!options[1][i]) continue;
      switch (i) {
        case 0: doc = collection.doc('loved_one'); break;
        case 1: doc = collection.doc('social_event'); break;
        case 2: doc = collection.doc('academic_stress'); break;
        case 3: doc = collection.doc('financial_distress'); break;
        case 4: doc = collection.doc('other'); break;
      }
      incrementCount(doc, others[1]);
    }
    collection = userRef.collection('thoughts');
    for (int i = 0; i < 5; i++) {
      if (!options[2][i]) continue;
      switch (i) {
        case 0: doc = collection.doc('stressed'); break;
        case 1: doc = collection.doc('upset'); break;
        case 2: doc = collection.doc('exhausted'); break;
        case 3: doc = collection.doc('inadequate'); break;
        case 4: doc = collection.doc('other'); break;
      }
      incrementCount(doc, others[2]);
    }
    collection = userRef.collection('solution');
    for (int i = 0; i < 5; i++) {
      if (!options[3][i]) continue;
      switch (i) {
        case 0: doc = collection.doc('breathing_exercises'); break;
        case 1: doc = collection.doc('focus_object'); break;
        case 2: doc = collection.doc('light_exercise'); break;
        case 3: doc = collection.doc('leaving_environment'); break;
        case 4: doc = collection.doc('other'); break;
      }
      incrementCount(doc, others[3]);
    }
  }

  Future<void> incrementCount(DocumentReference doc, String other) async {
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
    await usersCollection.doc(userID).collection('journals').doc(journalID).set(
      {
        'timestamp': journalID,
        'text': text
      },
      SetOptions(merge: true)
    );
  }

  Future setJournalAudio(String journalID, List<int> audio) async {
    await usersCollection.doc(userID).collection('journals').doc(journalID).set(
      {
        'timestamp': journalID,
        'audio': audio
      },
      SetOptions(merge: true)
    );
  }

  Future setMedications(String id, String name, String dosage,
      List<String> days, int frequency) async {
    await usersCollection.doc(userID).collection('medications').doc(id).set({
      'timestamp': id,
      'name': name,
      'dosage': dosage,
      'days': days,
      'times': frequency
    }, SetOptions(merge: true));
  }

  List<MyUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MyUser(
          userID: doc.get('userID'),
          email: doc.get('email'),
          username: doc.get('username'));
    }).toList();
  }

  Future<int?> getCount() async {
    int? count = await usersCollection
        .doc(userID)
        .collection('medications')
        .get()
        .then((value) => value.size);
    //print(count);
    return count;
  }

  Stream<List<MyUser>> get users =>
      usersCollection.snapshots().map(_userListFromSnapshot);
}
