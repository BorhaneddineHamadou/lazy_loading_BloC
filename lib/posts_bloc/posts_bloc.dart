import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lazyloadingproject/api/posts_api.dart';
import 'package:meta/meta.dart';

import '../models/post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<PostsEvent>((event, emit) async{
      if(state.hasReachedMax) return;
      if(event is GetPostsEvent){
        try{
            if(state.status == PostStatus.loading){
              final posts = await PostsAPI.getPosts();
              posts.isEmpty ?
              emit(state.copyWith(hasReachedMax: true)) :
              emit(state.copyWith(
                  status: PostStatus.success,
                  posts: posts,
                  hasReachedMax: false
              ));
            }else{
              final posts = await PostsAPI.getPosts(state.posts.length);
              posts.isEmpty ?
                  emit(state.copyWith(hasReachedMax: true))
              : emit(state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false
              ));
            }
        }catch(e){
          emit(state.copyWith(
              errorMessage: "Failed to fetch posts",
              status: PostStatus.error,
          )
          );
        }
      }
    }, transformer: droppable());
  }
}
