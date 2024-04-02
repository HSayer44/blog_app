import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/format_date.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/calculte_reading_time.dart';

class BlogViewerPage extends StatelessWidget {
  static route(Blog blog) => MaterialPageRoute(builder: (context) => BlogViewerPage(blog: blog));
  final Blog blog;

  const BlogViewerPage({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  'By ${blog.posterName}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                Text('Published at ${formatDateBydMMMYYYY(blog.updatedAt)} ', style: const TextStyle(color: AppPallete.greyColor, fontSize: 14, fontWeight: FontWeight.w500),),
                Text('Reading time: ${calculatingReadingTime(blog.content)} min', style: const TextStyle(color: AppPallete.greyColor),),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(blog.imageUrl),
                ),
                const SizedBox(height: 20),
                Text(blog.content, style: const TextStyle(fontSize: 16, height: 2),)
              ],
            ),
          ),
        ));
  }
}