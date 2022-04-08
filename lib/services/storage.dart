import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final String userID;
  final Reference ref;

  StorageService(this.userID)
    : ref = FirebaseStorage.instance.ref().child(userID);

  // TODO: :( I'm trying to read from Storage without touching the phone's files
  // https://stackoverflow.com/questions/41992202/read-value-content-of-a-file-from-firebase-storage
  Future<void> getJournalAudioFromID(String id) async {
    // ref.child(userID).child(id).child('audio.txt').getDownloadURL().then((url) {

    // });
    // print(await audioFile.readAsString());
  }

  UploadTask setJournalAudio(String journalID, List<int> audio)
    => ref.child(userID).child(journalID).child('audio.txt')
    .putString(audio.toString());
}
