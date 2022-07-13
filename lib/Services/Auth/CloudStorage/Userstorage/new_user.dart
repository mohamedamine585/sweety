import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/userconsts.dart';

class User_cloud {
  final String docid;
  final String email;
  final String firstname;
  final String lastname;
  final String occupation;
  final bool ispublisher;

  const User_cloud(
      {required this.docid,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.occupation,
      required this.ispublisher});
  User_cloud.fromsnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : docid = snapshot.id,
        email = snapshot.data()[user_email] as String,
        firstname = snapshot.data()[user_firstname] as String,
        lastname = snapshot.data()[user_lastname] as String,
        occupation = snapshot.data()[user_occupation] as String,
        ispublisher = snapshot.data()[Ispublisher] as bool;
}
