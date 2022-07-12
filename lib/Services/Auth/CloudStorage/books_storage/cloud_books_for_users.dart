import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/new_user.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/bookconst.dart';

import 'a_book.dart';

class FirebaseFirestoreforbooks$users {
  final books = FirebaseFirestore.instance.collection('books');
  Future<book> get_a_book(
      {required String Bookname, required String Edition}) async {
    return await books
        .where(bookname == Bookname && edition == Edition)
        .get()
        .then((value) => value as book);
  }

  Future<void> update_bookinfo(
      {required String bookname,
      required String Edition,
      String? type,
      String? description,
      String? dateofedition,
      String? authorname,
      int? sold}) async {
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

  Stream<Iterable<book>>? getbooks_byauthor({required String authorname}) {
    return books.snapshots().map((event) => event.docs
        .map((doc) => book.fromsnapshot(doc))
        .where((Book) => Book.authorname == authorname));
  }

  Stream<Iterable<book>>? getbooks_bytype({required String Bookname}) {
    return books.snapshots().map((event) => event.docs
        .map((doc) => book.fromsnapshot(doc))
        .where((Book) => Book.name == bookname));
  }

  Future<void> buyabook({required book Book, required User_cloud user}) async {
    await update_bookinfo(
        bookname: Book.name, Edition: Book.Edition, sold: Book.sold + 1);
  }
}
