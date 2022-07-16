import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweety/Services/Auth/CloudStorage/Publisherstorage/a_publisher.dart';
import 'package:sweety/Services/Auth/CloudStorage/Publisherstorage/pubs_const.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/book_cloud_for_pubs.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/bookconst.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/cloud_books_for_users.dart';
import '../books_storage/a_book.dart';

class FirebaseCloudStorageforpublisher {
  final publishers = FirebaseFirestore.instance.collection('publishers');
  Future<Publisher?> create_publisher({
    required String Email,
    required String Firstname,
    required String Lastname,
  }) async {
    final similarpubs =
        get_specific_publishers(fname: Firstname, lname: Lastname);
    if (await similarpubs.isEmpty) {
      final document = await publishers.add({
        email_pub: Email,
        firstname_pub: Firstname,
        lastname_pub: Lastname,
        pubbooks_pub: [],
      });
      return Publisher(Email, Firstname, Lastname, document.id, []);
    } else {
      print(similarpubs.first);
    }
  }

  Future<Publisher?> get_publisher(
      {required String firstname, required String lastname}) async {
    return await publishers
        .where(firstname_pub == firstname && lastname_pub == lastname)
        .get()
        .then((value) => value as Publisher);
  }

  Future<void> deletepublisher({required String publisherid}) async {
    try {
      await publishers.doc(publisherid).delete();
    } catch (e) {
      print(e);
    }
  }

  Stream<Iterable<Publisher>> get_all_publishers() {
    return publishers.snapshots().map((event) => event.docs
        .map((doc) => Publisher.fromsnapshot(doc))
        .where((pub) => pub != null));
  }

  Stream<Iterable<Publisher>> get_specific_publishers(
      {required String fname, required String lname}) {
    return publishers.snapshots().map((event) => event.docs
        .map((doc) => Publisher.fromsnapshot(doc))
        .where((pub) => pub.firstname == fname && pub.lastname == lname));
  }

  Future<void> publish_e_book(
      {required Publisher pub, required book Book}) async {
    pub.pubbooks.add(bookname);
    await publishers.doc(pub.docid).update({pubbooks_pub: pub.pubbooks});
  }
}
