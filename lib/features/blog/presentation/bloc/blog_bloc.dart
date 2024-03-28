import 'dart:async';
import 'dart:io';

import 'package:blog_app/core/usercase/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/blog.dart';
import '../../domain/usecases/get_all_blogs.dart';
import '../../domain/usecases/upload_blog.dart';

part 'blog_event.dart';

part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;

  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
  })  : _uploadBlog = uploadBlog,
        _getAllBlogs = getAllBlogs,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUploadEvent>(_onBlogUploadEvent);
    on<GetAllBlogsEvent>(_onGetAllBlogsEvent);
  }

  void _onBlogUploadEvent(BlogUploadEvent event, Emitter<BlogState> emit) async {
    final res = await _uploadBlog(UploadBlogsParams(
      posterId: event.posterId,
      title: event.title,
      content: event.content,
      image: event.image,
      topics: event.topics,
    ));
    res.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogUploadSuccess()),
    );
  }

  void _onGetAllBlogsEvent(GetAllBlogsEvent event, Emitter<BlogState> emit) async {
    final res = await _getAllBlogs(NoParams());
    res.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogGetSuccess(r)),
    );
  }
}
