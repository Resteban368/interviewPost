import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/blocs/post/post_state.dart';
import 'package:interview/repository/repository.dart';

import '../../models/post_model.dart';
import 'post_event.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsRepository repository;
  StreamSubscription<List<Post>>? postsSubscription;

  PostBloc(this.repository) : super(PostInitial()) {
    postsSubscription = repository.getPosts().listen((posts) {
      add(PostUpdated(posts));
    });

    on<PostUpdated>((event, emit) {
      emit(PostLoaded(event.posts));
    });

    on<UploadPost>((event, emit) async {
      emit(PostUploading());
      try {
        // final post =
        await repository.uploadImageAndSavePost(event.image, event.post);
        postsSubscription = repository.getPosts().listen((posts) {
          add(PostUpdated(posts));
        });
        // emit(PostUploaded());
      } catch (e) {
        emit(PostError('Error al subir el post'));
      }
    });
  }
  @override
  Future<void> close() {
    postsSubscription?.cancel();
    return super.close();
  }
}
