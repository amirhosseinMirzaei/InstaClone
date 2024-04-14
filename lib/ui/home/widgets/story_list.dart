import 'package:flutter/material.dart';
import 'package:untitled1/data/data.dart';
import 'package:untitled1/theme.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 2),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed() : _profileImageNormal(),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            story.name,
            style: TextStyle(color: DarktThemeColor.secondaryTextColor),
          )
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [Color(0xffED78B7), Color(0xffF37381), Color(0xffF0A616)]),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        padding: EdgeInsets.all(4),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      height: 68,
      width: 68,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset('assets/img/stories/${story.imageFileName}'));
  }
}
