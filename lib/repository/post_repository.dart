// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/post_model.dart';

class PostsRepository {
  final databaseReference = FirebaseFirestore.instance.collection('post');

  Stream<List<Post>> getPosts() {
    return databaseReference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Post.fromMap(doc.data())).toList();
    });
  }

  Future<void> uploadImageAndSavePost(File image, Post post) async {
    Reference reference = FirebaseStorage.instance.ref('posts');
    var timeKey = DateTime.now();
    final UploadTask uploadTask =
        reference.child("$timeKey.jpg").putFile(image);

    var imageUrl = await (await uploadTask).ref.getDownloadURL();
    var url = imageUrl.toString();

    CollectionReference postsRef =
        FirebaseFirestore.instance.collection('post');
    DocumentReference documentRef = await postsRef.add({
      'information': post.information,
      'location': post.location,
      'date': post.date,
      'img': url,
      'hashtags': post.hashtags,
    });

    print('Image uploaded and post saved with ID: ${documentRef.id}');
  }
}
