import 'package:flutter/material.dart';

import '../models/post.dart';

class PostItemWidget extends StatelessWidget{

  final Post post;
  const PostItemWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: Text(post.id.toString()),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
      ),
    );
  }

}