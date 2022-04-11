import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final String userID;
  final Reference ref;

  StorageService(this.userID)
      : ref = FirebaseStorage.instance.ref().child(userID);

  Future<List<int>?> getJournalAudioFromID(String id) async {
    return ref.child(id).child('audio.txt').getData().then((data) {
      if(data == null) return null;
      return json.decode(utf8.decode(data)).cast<int>();
    });
  }

  Future<List<double>?> getJournalDecibelsFromID(String id) async {
    return ref.child(id).child('decibels.txt').getData().then((data) {
      if(data == null) return null;
      return json.decode(utf8.decode(data)).cast<double>();
    });
  }

  UploadTask setJournalAudio(String id, List<int> audio)
<<<<<<< HEAD
  => ref.child(id).child('audio.txt').putString(audio.toString());

  UploadTask setJournalDecibels(String id, List<double> decibels)
  => ref.child(id).child('decibels.txt').putString(decibels.toString());
=======
    => ref.child(id).child('audio.txt').putString(audio.toString());

  UploadTask setJournalDecibels(String id, List<double> decibels)
    => ref.child(id).child('decibels.txt').putString(decibels.toString());
>>>>>>> bfa2aba369f663462aec40e973e678d0c6dfc692
}
