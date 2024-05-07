part of 'posts_bloc.dart';

enum PostStatus {loading, success, error}

class PostsState extends Equatable{
  final PostStatus status;
  final List<Post> posts;
  final String errorMessage;
  final bool hasReachedMax;

  const PostsState({
      this.status = PostStatus.loading,
      this.posts = const [],
      this.errorMessage = "",
      this.hasReachedMax = false
  });

  PostsState copyWith({
    PostStatus? status,
    List<Post>? posts,
    String? errorMessage,
    bool? hasReachedMax,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, posts, errorMessage, hasReachedMax];
}

