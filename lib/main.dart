// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/repository/post_repository.dart';

import 'blocs/post/post_bloc.dart';
import 'models/post_model.dart';
import 'views/screens.dart';
import 'widgets/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => PostBloc(PostsRepository())),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int selectIndex = 0;
    final GoRouter router = GoRouter(
      routes: [
        ShellRoute(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const PostScreen(),
            ),
            GoRoute(
              path: '/addPost',
              builder: (context, state) => const AddPostScreen(),
            ),
            GoRoute(
                path: '/previewPost',
                builder: (context, state) {
                  final map = state.extra as Map?;
                  return PostPreviewScreen(
                    post: map!['post'] as Post,
                    imgFile: map['imgFile'] as File,
                  );
                }),
            GoRoute(
              path: '/shop',
              builder: (context, state) => const ShopScreen(),
            ),
            GoRoute(
              path: '/User',
              builder: (context, state) => const UserScreen(),
            ),
          ],
          builder: (context, state, child) {
            if (child is PostScreen) {
              selectIndex = 0;
            } else if (child is AddPostScreen) {
              selectIndex = 1;
            } else if (child is ShopScreen) {
              selectIndex = 2;
            } else if (child is UserScreen) {
              selectIndex = 3;
            }

            return MainNavigator(
              selectIndex: selectIndex,
              child: child,
            );
          },
        )
      ],
    );
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
