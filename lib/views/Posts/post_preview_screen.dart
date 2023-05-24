import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/blocs/post/post_event.dart';

import 'package:interview/utils/colors.dart';
import '../../blocs/post/post_bloc.dart';
import '../../blocs/post/post_state.dart';
import '../../models/post_model.dart';

class PostPreviewScreen extends StatefulWidget {
  final Post post;
  final File imgFile;

  const PostPreviewScreen(
      {super.key, required this.post, required this.imgFile});
  @override
  State<PostPreviewScreen> createState() => _PostPreviewScreenState();
}

class _PostPreviewScreenState extends State<PostPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final postBloc = BlocProvider.of<PostBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Post',
          style: TextStyle(
              color: MyColors.colorPrimary1,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: MyColors.colorPrimary1,
          ),
          onPressed: () => GoRouter.of(context).go('/addPost'),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(widget.post.img.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: size.width,
                    child: const Text(
                      'Information',
                      style: TextStyle(
                        color: MyColors.colorFunctional1,
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  //ponemos toda la informacion del post
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: SizedBox(
                      width: size.width,
                      child: Text(widget.post.information.toString(),
                          textAlign: TextAlign.justify),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: const Text(
                      'Location',
                      style: TextStyle(
                        color: MyColors.colorFunctional1,
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    // color: Colors.red,
                    width: size.width,
                    child: Text(
                      widget.post.location.toString(),
                      style: const TextStyle(
                        color: MyColors.colorPrimaryNegro,
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Divider(
                    color: MyColors.colorFunctional2,
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    width: size.width * 0.8,
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.post.hashtags!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyColors.colorSecondary2,
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Text(
                                    widget.post.hashtags![index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  //btn de preview
                  SizedBox(height: size.height * 0.05),
                  GestureDetector(
                    onTap: () {
                      postBloc.add(UploadPost(widget.imgFile, widget.post));
                      GoRouter.of(context).go('/');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyColors.colorPrimary1),
                        width: size.width * 0.87,
                        height: 40,
                        child: const Center(
                            child: Text(
                          'Publish',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ))),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
