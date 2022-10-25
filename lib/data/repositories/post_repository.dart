import 'dart:convert';
import 'dart:developer';

import 'package:app_test/data/models/post_mdl.dart';
import 'package:http/http.dart' as http;

abstract class PostRepository {
  Future<List<PostMdl>> getAllPostsData();
}

class PostRepositoryImp extends PostRepository {
  @override
  Future<List<PostMdl>> getAllPostsData() async {
    log('inside getAllPostsData');
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    log('responce: $response');
    if (response.statusCode == 200) {
      log('inside 200');
      final parsed = jsonDecode(response.body);
      log('parsed: $parsed');
      final List<PostMdl> list = [];
      for (var post in parsed) {
        list.add(PostMdl.fromJson(post));
      }
      return list;
    } else {
      log('inside fail');
      return [
        PostMdl.fromJson({
          'id': 0,
          'userId': 0,
          'title': 'empty title',
          'body': 'empty body'
        })
      ];
    }
  }
}
