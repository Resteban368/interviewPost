// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview/blocs/post/post_state.dart';
import 'package:interview/models/post_model.dart';

import 'package:interview/theme/inputDecoations_theme.dart';
import 'package:interview/utils/colors.dart';

import '../../blocs/post/post_bloc.dart';
import '../../widgets/appBar_widget.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

List<String> hashtags = [];

class _AddPostScreenState extends State<AddPostScreen> {
  bool _isValueLocation = false;
  bool _isValueHashtag = false;
  File image = File('');
  final formKey = GlobalKey<FormState>();
  TextEditingController hashtagController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  //blogrepository
  @override
  void dispose() {
    locationController.dispose();
    descriptionController.dispose();
    hashtagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarTitle(context, 'Add Post', true),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      getImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.colorFunctional2,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColors.colorFunctional2),
                      ),
                      width: size.width,
                      height:
                          image.path != '' ? size.height : size.height * 0.2,
                      child: image.path != ''
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(image, fit: BoxFit.cover))
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 50,
                                  color: MyColors.colorFunctional1,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Add Post Photo',
                                  style: TextStyle(
                                      color: MyColors.colorFunctional1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: descriptionController,
                            maxLines: 5,
                            maxLength: 350,
                            decoration: inputDecorationForm('Type your post'),
                            style: const TextStyle(
                                color: MyColors.colorPrimaryNegro),
                            validator: (value) {
                              return value!.isEmpty
                                  ? 'Please enter a description'
                                  : null;
                            },
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: locationController,
                                  validator: (value) {
                                    return value!.isEmpty
                                        ? 'Please enter a location'
                                        : null;
                                  },
                                  decoration: inputDecorationForm('Location'),
                                  onChanged: (value) {
                                    setState(() {
                                      _isValueLocation = value.isNotEmpty;
                                    });
                                  },
                                  style: const TextStyle(
                                      color: MyColors.colorPrimaryNegro),
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: _isValueLocation
                                          ? MyColors.colorPrimary1
                                          : MyColors.colorFunctional2,
                                    ),
                                    width: 70,
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      'Add',
                                      style: TextStyle(
                                          color: _isValueLocation
                                              ? Colors.white
                                              : MyColors.colorFunctional1,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: hashtagController,
                                  onChanged: (value) {
                                    setState(() {
                                      _isValueHashtag = value.isNotEmpty;
                                    });
                                  },
                                  validator: (value) {
                                    //validamos que si la lista de hashtags esta vacia, no se pueda enviar el post
                                    return hashtags.isEmpty
                                        ? 'Please enter a hashtag'
                                        : null;
                                  },
                                  decoration: inputDecorationForm('Add Tags'),
                                  style: const TextStyle(
                                      color: MyColors.colorPrimaryNegro),
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {
                                  //agregamos el hashtag a la lista
                                  setState(() {
                                    hashtags.add(hashtagController.text);
                                  });
                                  //limpiamos el campo
                                  hashtagController.clear();
                                  _isValueHashtag = false;
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: _isValueHashtag
                                          ? MyColors.colorPrimary1
                                          : MyColors.colorFunctional2,
                                    ),
                                    width: 70,
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      'Add',
                                      style: TextStyle(
                                          color: _isValueHashtag
                                              ? Colors.white
                                              : MyColors.colorFunctional1,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                        ],
                      )),

                  Visibility(
                    visible: hashtags.isNotEmpty,
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hashtags.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Center(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: MyColors.colorSecondary2),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            hashtags.removeAt(index);
                                          });
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: MyColors.colorFunctional2,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        hashtags[index],
                                        style: const TextStyle(
                                            color: MyColors.colorSecondary2,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  // //btn de preview

                  const SizedBox(height: 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: hashtags.isEmpty
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceAround,
                    children: [
                      Visibility(
                        visible: hashtags.isNotEmpty,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              hashtags.clear();
                            });
                            descriptionController.clear();
                            locationController.clear();
                            image = File('');
                            _isValueLocation = false;
                            _isValueHashtag = false;
                            FocusScope.of(context).unfocus();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: MyColors.colorPrimary1),
                              ),
                              width: size.width * 0.35,
                              height: 40,
                              child: const Center(
                                  child: Text(
                                'Clear All',
                                style: TextStyle(
                                    color: MyColors.colorPrimary1,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (image.path.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select an image'),
                                  backgroundColor: MyColors.colorFunctional2,
                                ),
                              );
                              return;
                            }

                            DateTime now = DateTime.now();
                            final post = Post(
                              date: now.toString(),
                              information: descriptionController.text.trim(),
                              hashtags: hashtags,
                              location: locationController.text.trim(),
                              img: image.path,
                            );
                            GoRouter.of(context).go('/previewPost',
                                extra: {'post': post, 'imgFile': image});
                            // Aquí puedes enviar los datos a otra ventana o realizar cualquier otra acción
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: hashtags.isEmpty
                                    ? MyColors.colorFunctional2
                                    : MyColors.colorPrimary1),
                            width: hashtags.isEmpty
                                ? size.width * 0.87
                                : size.width * 0.35,
                            height: 40,
                            child: Center(
                                child: Text(
                              'Preview',
                              style: TextStyle(
                                  color: hashtags.isEmpty
                                      ? MyColors.colorFunctional1
                                      : Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }
}
