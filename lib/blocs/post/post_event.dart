import 'dart:io';

import '../../models/post_model.dart';

abstract class PostEvent {}

// class FetchPosts extends PostEvent {}

class UploadPost extends PostEvent {
  final File image;
  final Post post;

  UploadPost(this.image, this.post);
}

class PostUpdated extends PostEvent {
  final List<Post> posts;

  PostUpdated(this.posts);

  List<Object> get props => [posts];
}
