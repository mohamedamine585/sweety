import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'pubs_const.dart';

class Publisher {
  final String email;
  final String firstname;
  final String lastname;
  final String docid;
  final List<String> pubbooks;
  Publisher(
      this.email, this.firstname, this.lastname, this.docid, this.pubbooks);

  Publisher.fromsnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : docid = snapshot.id,
        email = snapshot.data()[email_pub] as String,
        firstname = snapshot.data()[firstname_pub] as String,
        lastname = snapshot.data()[lastname_pub] as String,
        pubbooks = snapshot.data()[pubbooks_pub] as List<String>;
}
