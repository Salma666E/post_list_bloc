import 'package:app_test/data/models/post_mdl.dart';

abstract class PostState {}

class InitialPostState extends PostState {}

class LoadingPostState extends PostState {}

class SuccessfulPostState extends PostState {
  final List<PostMdl> post;
  SuccessfulPostState(this.post);
}

class ErrorPostState extends PostState {
  final String message;
  ErrorPostState(this.message);
}
