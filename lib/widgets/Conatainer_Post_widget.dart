// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interview/utils/colors.dart';

import '../models/post_model.dart';
import 'widgets.dart';

class Contenedor_Post_widget extends StatefulWidget {
  final Post posts;
  const Contenedor_Post_widget({
    super.key,
    required this.size,
    required this.posts,
  });

  final Size size;
  @override
  State<Contenedor_Post_widget> createState() => _Contenedor_Post_widgetState();
}

class _Contenedor_Post_widgetState extends State<Contenedor_Post_widget> {
  bool _isComment = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.colorFunctional2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          //todo contendor superior
          InfouserBarra(
            size: widget.size,
          ),

          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: (Text(
              '${widget.posts.information}',
              style: const TextStyle(color: MyColors.colorPrimaryNegro),
              textAlign: TextAlign.justify,
            )),
          ),

          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: widget.size.width * 0.8,
            // color: Colors.red,
            child: Wrap(
              spacing: 0,
              runSpacing: 2.0,
              children: widget.posts.hashtags!
                  .map(
                    (e) => Text(
                      '#$e ',
                      style: const TextStyle(
                        color: MyColors.colorPrimary1,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          // ubicacion del post
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 15,
                color: MyColors.colorPrimary1,
              ),
              Text(
                widget.posts.location.toString(),
                style: const TextStyle(
                  color: MyColors.colorPrimary1,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: widget.posts.img.toString(),
              width: widget.size.width * 0.8,
              height: widget.size.height * 0.5,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(
                  width: widget.size.width * 0.5,
                  height: widget.size.height * 0.5,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        color: MyColors.colorPrimary1,
                      ),
                      Text(
                        ' 28',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isComment = !_isComment;
                      });
                    },
                    icon: Icon(
                      _isComment ? Icons.comment : Icons.comment_outlined,
                      color: MyColors.colorPrimary1,
                    ),
                  ),
                  const Text(
                    '7',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              //poner el icono de compartir a mano derecha
              const Spacer(),
              const Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.share_outlined,
                        color: MyColors.colorPrimary1,
                      ),
                      Text(
                        ' 2',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Visibility(
              visible: _isComment,
              child: SizedBox(
                  width: widget.size.width,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: widget.size.width,
                        child: const Text(
                          'Comments',
                          style: TextStyle(
                            color: MyColors.colorPrimary1,
                            fontSize: 19,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InfouserBarra(
                        size: widget.size,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 50),
                        child: const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget nunc vitae nunc aliquet ultricies. Sed eget nunc vitae nunc aliquet ultricies.',
                          style: TextStyle(color: MyColors.colorPrimaryNegro),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
