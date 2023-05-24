// ignore_for_file: camel_case_types

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:interview/utils/colors.dart';
import 'package:interview/widgets/widgets.dart';

import '../../blocs/post/post_bloc.dart';
import '../../blocs/post/post_state.dart';
import '../../models/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> postList = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Desencadena el evento FetchPosts cuando se construye el widget

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 55,
        elevation: 0,
        title: const Text(
          'Posts',
          style: TextStyle(
            color: MyColors.colorPrimary1,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).go('/addPost');
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.colorPrimary2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: MyColors.colorPrimary1,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Search(size: size),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child:
                    BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                  if (state is PostLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PostLoaded) {
                    final posts = state.posts;

                    return ListView.builder(
                        //mostrar de abajo hacia arriba
                        reverse: true,
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          if (posts.isEmpty) {
                            return const Center(
                              child: Text('No hay posts'),
                            );
                          }
                          return Contenedor_Post_widget(
                              size: size, posts: posts[index]);
                        });
                  } else if (state is PostError) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  }
                  return Container(); // Estado inicial
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
