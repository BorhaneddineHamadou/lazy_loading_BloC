import 'dart:convert';

import 'package:http/http.dart';
import 'package:lazyloadingproject/models/post.dart';

class PostsAPI{
  static Future<List<Post>> getPosts([int startIndex=0, int endIndex=20]) async{
    try{
      String url = "https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$endIndex";
      final response = await get(Uri.parse(url));
      List<Post> posts = (jsonDecode(response.body))
          .map<Post>((jsonPost) => Post.fromJson(jsonPost)).toList();
      return posts;
    }catch(e){
      rethrow;
    }
  }
}