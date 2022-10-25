import 'package:app_test/data/blocs/post/post_bloc.dart';
import 'package:app_test/data/blocs/post/post_event.dart';
import 'package:app_test/data/repositories/post_repository.dart';
import 'package:app_test/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bloc Statement',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => PostBloc(PostRepositoryImp())..add(FetchPosts()),
          child: const Home(),
        ));
  }
}
