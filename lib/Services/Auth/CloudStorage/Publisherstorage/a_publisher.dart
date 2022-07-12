import 'package:cloud_firestore/cloud_firestore.dart';
import 'pubs_const.dart';

class Publisher {
  final String email;
  final String firstname;
  final String lastname;
  final String docid;

  Publisher(this.email, this.firstname, this.lastname, this.docid);

  Publisher.fromsnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : docid = snapshot.id,
        email = snapshot.data()[Email] as String,
        firstname = snapshot.data()[Firstname] as String,
        lastname = snapshot.data()[Lastname] as String;
}
