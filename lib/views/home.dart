import 'package:app_test/data/blocs/post/post_bloc.dart';
import 'package:app_test/data/blocs/post/post_event.dart';
import 'package:app_test/data/blocs/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Statement: Posts'),
      ),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is LoadingPostState) {
              return const CircularProgressIndicator();
            } else // may be skip
            if (state is SuccessfulPostState) {
              return ListView.builder(
                  itemCount: state.post.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(state.post[index].title.toString()),
                        subtitle: Text(state.post[index].id.toString()),
                      ),
                    );
                  });
            } else if (state is ErrorPostState) {
              return const Text('We are sorry, try again');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
