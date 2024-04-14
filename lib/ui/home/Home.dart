import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/common/item_appBar.dart';

import 'package:untitled1/data/data.dart';
import 'package:untitled1/theme.dart';
import 'package:untitled1/ui/home/widgets/post_list.dart';
import 'package:untitled1/ui/home/widgets/story_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: _buildAppbar(),
      backgroundColor: DarktThemeColor.primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(height: 90, child: AppbarNav()),
            StoryList(stories: stories),
            const SizedBox(
              height: 10,
            ),
            PostList(
              posts: posts,
            )
          ],
        ),
      )),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: DarktThemeColor.primaryColor,
      actions: [
        Image.asset(
          'assets/img/icons/appBar.png',
          width: 393,
        ),
      ],
    );
  }
}
