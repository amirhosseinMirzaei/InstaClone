import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/data/data.dart';
import 'package:untitled1/theme.dart';
import 'package:untitled1/ui/home/widgets/BottomSheet.dart';

class PostList extends StatelessWidget {
  final List<PostData> posts;

  PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 517,
      width: 400,
      child: ListView.builder(
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final post = posts[index];
            return PostItem(post: post);
          }),
    );
  }
}

class PostItem extends StatelessWidget {
  final PostData post;

  const PostItem({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      padding: EdgeInsets.fromLTRB(16, 8, 8, 10),
      decoration: BoxDecoration(
          color: DarktThemeColor.secondaryColor,
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 2),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        colors: [
                          Color(0xffED78B7),
                          Color(0xffF37381),
                          Color(0xffF0A616)
                        ])),
                child: Container(
                  margin: const EdgeInsets.all(3),
                  child: SizedBox(
                    height: 36,
                    width: 36,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: Image.asset(
                            'assets/img/stories/${post.profileImage}',
                            width: 36,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.personName,
                    style: const TextStyle(
                        color: DarktThemeColor.primaryTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        post.userName,
                        style: TextStyle(
                            color: DarktThemeColor.secondaryTextColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: DarktThemeColor.secondaryTextColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '5m',
                        style: TextStyle(
                            color: DarktThemeColor.secondaryTextColor),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Container(),
              ),
              const Icon(
                CupertinoIcons.ellipsis_vertical,
                color: DarktThemeColor.secondaryTextColor,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            post.caption,
            style: TextStyle(color: DarktThemeColor.primaryTextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/img/posts/${post.imageFileName}'),
          ),
          const SizedBox(
            height: 12,
          ),
          _StatusBar(post: post),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              height: 1,
              color: Color(0xffF8F8F8).withOpacity(0.5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Created ${DateFormat.yMMMd().format(post.dateTime)}',
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: DarktThemeColor.secondaryTextColor),
              ),
              InkWell(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollUpdateNotification &&
                              scrollNotification.metrics.axisDirection ==
                                  AxisDirection.down) {
                            // Check if the user is scrolling down
                            Navigator.of(context).pop();
                            return true; // Consume the notification to prevent it from bubbling up
                          }
                          return false; // Let other listeners handle the notification
                        },
                        child: const BidBottomSheet(),
                      );
                    },
                  );
                },
                child: Container(
                  width: 59,
                  height: 30,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [
                            DarktThemeColor.begGradientColor,
                            DarktThemeColor.toGradientColor,
                            DarktThemeColor.endGradientColor,
                          ]),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text('Bid',
                        style:
                            TextStyle(color: DarktThemeColor.primaryTextColor)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          CupertinoIcons.heart,
          color: DarktThemeColor.primaryTextColor,
          size: 24,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          post.likes,
          style: const TextStyle(color: DarktThemeColor.secondaryTextColor),
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.metrics.axisDirection ==
                            AxisDirection.down) {
                      // Check if the user is scrolling down
                      Navigator.of(context).pop();
                      return true; // Consume the notification to prevent it from bubbling up
                    }
                    return false; // Let other listeners handle the notification
                  },
                  child: const BottomSheetComment(),
                );
              },
            );
          },
          child: const Icon(
            CupertinoIcons.chat_bubble,
            color: DarktThemeColor.secondaryTextColor,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        const Text(
          '12',
          style: TextStyle(color: DarktThemeColor.secondaryTextColor),
        ),
        const SizedBox(
          width: 15,
        ),
        Image.asset(
          'assets/img/icons/interaction.png',
          color: DarktThemeColor.primaryTextColor,
          width: 24,
          height: 24,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          post.interaction,
          style: const TextStyle(color: DarktThemeColor.secondaryTextColor),
        ),
        const SizedBox(
          width: 15,
        ),
        Image.asset(
          'assets/img/icons/forward.png',
          color: DarktThemeColor.primaryTextColor,
          width: 24,
          height: 24,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/img/icons/statistic.png',
          color: DarktThemeColor.primaryTextColor,
          width: 28,
          height: 28,
        ),
        Text(
          post.view,
          style: const TextStyle(color: DarktThemeColor.secondaryTextColor),
        ),
        const Text(
          'View',
          style: TextStyle(color: DarktThemeColor.secondaryTextColor),
        ),
      ],
    );
  }
}
