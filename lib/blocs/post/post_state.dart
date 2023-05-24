import '../../models/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;

  PostLoaded(this.posts);
}

class PostUploading extends PostState {}

class PostUploaded extends PostState {}

class PostError extends PostState {
  final String errorMessage;

  PostError(this.errorMessage);
}
// 