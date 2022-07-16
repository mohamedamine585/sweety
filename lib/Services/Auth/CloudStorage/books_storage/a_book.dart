import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/bookconst.dart';

class book {
  final String? publisherfirstname;
  final String? publisherlastname;
  final String? publisheremail;
  final String docid;
  final String name;
  final String dateofeddition;
  final String authorname;
  final String Edition;
  final String type;
  final String description;
  final int price;
  final int sold;
  final int readtimes;
  final int downloads;
  final int? publicevaluation;
  const book(
    this.publisherfirstname,
    this.publisherlastname,
    this.publisheremail,
    this.docid,
    this.name,
    this.dateofeddition,
    this.authorname,
    this.Edition,
    this.type,
    this.description,
    this.price,
    this.sold,
    this.readtimes,
    this.downloads,
    this.publicevaluation,
  );
  book.fromsnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : docid = snapshot.id,
        publisherfirstname = snapshot.data()[Publisherfirstname] as String?,
        publisherlastname = snapshot.data()[Publisherlastname] as String?,
        publisheremail = snapshot.data()[Publisheremail] as String?,
        name = snapshot.data()[bookname] as String,
        authorname = snapshot.data()[author_name] as String,
        dateofeddition = snapshot.data()[date_of_edition] as String,
        Edition = snapshot.data()[edition] as String,
        type = snapshot.data()[Type] as String,
        description = snapshot.data()[Description] as String,
        price = snapshot.data()[Price] as int,
        sold = snapshot.data()[Sold] as int,
        readtimes = snapshot.data()[Readtimes] as int,
        downloads = snapshot.data()[Downloads] as int,
        publicevaluation = snapshot.data()[Publicevalution] as int?;
}
