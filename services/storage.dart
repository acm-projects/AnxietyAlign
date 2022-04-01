import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final String userID;
  final Reference ref;
  StorageService(this.userID) :
    ref = FirebaseStorage.instance.ref().child(userID);
  UploadTask setJournalAudio(String journalID, List<int> audio) =>
    ref.child(userID).child('$journalID.txt').putString(audio.toString());
}
