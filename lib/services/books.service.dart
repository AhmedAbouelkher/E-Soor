import 'dart:io' show File;

import 'package:E_Soor/models/BookModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter/services.dart' show PlatformException;

//! getting data
//! setting better recognition id

class BooksService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final String _booksCollectionData = "books";

  Future<dynamic> _getCurrentUser({bool getUID = false}) async {
    final user = await _firebaseAuth.currentUser();
    if (user == null) throw "User can't equal null";
    if (getUID) {
      return user.uid;
    }
    return user;
  }

  /*

  final String id;
  final String authorID;
  final String authorName;
  final String displayName;
  final String price;
  final String picUrl;
  final DateTime creationTime;
  final DateTime lastInfoUpdate;
  final String category;
  final String categoryID;

 */

  Future<void> uploadBook({
    String authorName,
    String bookName,
    String id,
    String authorID,
    String category,
    String categoryID,
    String price,
    bool uploadCoverPic = false,
    File imageFile,
  }) async {
    try {
      String coverPicDownloadLink;
      if (uploadCoverPic) {
        coverPicDownloadLink = await uploadBookCoverPic(
          authorID: authorID,
          id: id,
          imageFile: imageFile,
        );
      }
      final DateTime _creationTime = DateTime.now();
      DocumentReference _bookDoc =
          _firestore.collection(_booksCollectionData).document("$id-$authorID");

      await _bookDoc.setData(
        Book(
          id: id,
          displayName: bookName,
          creationTime: _creationTime,
          lastInfoUpdate: _creationTime,
          authorID: authorID,
          category: category,
          categoryID: categoryID,
          price: price,
          authorName: authorName,
          picUrl: coverPicDownloadLink,
        ).toJson(),
      );
    } catch (e) {
      debugPrint(e);
    }
  }

  Future<String> uploadBookCoverPic(
      {File imageFile, String id, String authorID}) async {
    try {
      StorageReference ref =
          FirebaseStorage(storageBucket: 'gs://e-soor-29d6c.appspot.com')
              .ref()
              .child("$id-$authorID/$id-$authorID-coverPic.jpg");
      StorageUploadTask uploadTask = ref.putFile(imageFile);
      String coverPicDownloadLink =
          (await (await uploadTask.onComplete).ref.getDownloadURL()).toString();
      return coverPicDownloadLink;
    } on PlatformException catch (coverProfilePicError) {
      throw PlatformException(
        code: "ERROR_COULDN'T_UPLOAD_COVER_PICTURE",
        message: 'three was an error while taking/uploading book cover picture',
        details:
            "Details --> code: ${coverProfilePicError.code}: message: ${coverProfilePicError.message}",
      );
    }
  }
}
