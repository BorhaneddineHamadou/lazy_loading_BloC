part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class GetPostsEvent extends PostsEvent{}