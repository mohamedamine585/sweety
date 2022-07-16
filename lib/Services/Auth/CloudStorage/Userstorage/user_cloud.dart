import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/userconsts.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/new_user.dart';

class FirebaseCloudStorageforusers {
  final users = FirebaseFirestore.instance.collection('users');

  Future<User_cloud?> create_user(
      {required String email,
      required String firstname,
      required String lastname,
      required String occupation}) async {
    final document = await users.add({
      user_email: email,
      user_firstname: firstname,
      user_lastname: lastname,
      user_occupation: occupation
    });
    return User_cloud(
      docid: document.id,
      email: email,
      firstname: firstname,
      lastname: lastname,
      occupation: occupation,
    );
  }

  Future<Iterable<User_cloud?>?> get_user({required String? email}) async {
    try {
      return await users
          .where(
            user_email,
            isEqualTo: email,
          )
          .get()
          .then(
              (value) => value.docs.map((doc) => User_cloud.fromsnapshot(doc)));
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteuser({required String userid}) async {
    try {
      await users.doc(userid).delete();
    } catch (e) {}
  }

  Stream<Iterable<User_cloud>> get_all_users() {
    return users.snapshots().map((event) => event.docs
        .map((doc) => User_cloud.fromsnapshot(doc))
        .where((user) => user != null));
  }

  Future<void> delete_all_users() async {
    final allusers = await get_all_users().toList() as Iterable<User_cloud>;
    User_cloud user;
    try {
      for (user in allusers) {
        await deleteuser(userid: user.docid);
      }
    } catch (e) {}
  }

  Future<void> update_user(
      {required String docid,
      required String? firstname,
      required String? lastname,
      required String? occupation}) async {
    try {
      users.doc(docid).update({
        user_firstname: firstname,
        user_lastname: lastname,
        user_occupation: occupation
      });
    } catch (e) {}
  }
}
