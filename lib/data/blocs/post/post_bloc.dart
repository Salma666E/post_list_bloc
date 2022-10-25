import 'package:app_test/data/blocs/post/post_event.dart';
import 'package:app_test/data/blocs/post/post_state.dart';
import 'package:app_test/data/repositories/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  PostBloc(this.postRepository) : super(InitialPostState()) {
    on<FetchPosts>((event, emit) async {
      emit(LoadingPostState());
      try {
        final post = await postRepository.getAllPostsData();
        emit(SuccessfulPostState(post));
      } catch (e) {
        emit(ErrorPostState(e.toString()));
      }
    });
  }
}
