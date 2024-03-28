import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/upload_blog.dart';

part 'blog_event.dart';

part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog uploadBlog;

  BlogBloc(this.uploadBlog) : super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUploadEvent>(_onBlogUploadEvent);
  }

  void _onBlogUploadEvent(BlogUploadEvent event, Emitter<BlogState> emit) async {
    final res = await uploadBlog(UploadBlogsParams(
      posterId: event.posterId,
      title: event.title,
      content: event.content,
      image: event.image,
      topics: event.topics,
    ));
    res.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogSuccess()),
    );
  }
}
