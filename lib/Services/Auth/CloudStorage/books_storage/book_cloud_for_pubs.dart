// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/a_book.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/bookconst.dart';

class Firebasecloudstorageforbooks$pubs {
  final books = FirebaseFirestore.instance.collection('books');

  Future<book?> create_book({
    required String pubfname,
    required String publnam,
    required String pubemail,
    required String name,
    required String authorname,
    required String description,
    required String Edition,
    required String dateofeddition,
    required String type,
    required int price,
  }) async {
    try {
      final createdBook = await books.add({
        bookname: name,
        author_name: authorname,
        Description: description,
        Type: type,
        date_of_edition: dateofeddition,
        edition: Edition,
        Downloads: 0,
        Publicevalution: null,
        Readtimes: 0,
        Price: price,
        Sold: 0,
        Publisheremail: pubemail,
        Publisherfirstname: pubfname,
        Publisherlastname: publnam,
      });

      return book(
          pubfname,
          publnam,
          pubemail,
          createdBook.id,
          name,
          dateofeddition,
          authorname,
          Edition,
          type,
          description,
          price,
          0,
          0,
          0,
          null);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<book> get_a_book(
      {required String Bookname, required String Edition}) async {
    return await books
        .where(bookname == Bookname && edition == Edition)
        .get()
        .then((value) => value as book);
  }

  Stream<Iterable<book>>? getbooks_byauthor({required String authorname}) {
    return books.snapshots().map((event) => event.docs
        .map((doc) => book.fromsnapshot(doc))
        .where((Book) => Book.authorname == authorname));
  }

  Future<void> delete_a_publishedbook(
      {required String Bookname, required String Edition}) async {
    final _book = await get_a_book(Bookname: Bookname, Edition: Edition);
    if (_book != null) {
      await books.doc(_book.docid).delete();
    }
  }

  Stream<Iterable<book>> getbooks_bypubs({required String email}) {
    return books.snapshots().map((event) => event.docs
        .map((doc) => book.fromsnapshot(doc))
        .toList()
        .where(((element) => element.publisheremail == email)));
  }

  Stream<Iterable<book>> getallbooks() =>
      books.snapshots().map((event) => event.docs
          .map((doc) => book.fromsnapshot(doc))
          .where((Book) => Book != null));

  Future<void> update_bookinfo(
      {required String bookname,
      required String Edition,
      String? type,
      String? description,
      String? dateofedition,
      String? authorname}) async {
    final _book = await get_a_book(Bookname: bookname, Edition: Edition);
    if (_book != null) {
      await books.doc(_book.docid).update({
        author_name: authorname,
        Description: description,
        Type: type,
        date_of_edition: dateofedition,
      });
    }
  }
}
