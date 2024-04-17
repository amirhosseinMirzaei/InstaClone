import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/common/Buttons.dart';
import 'package:untitled1/data/data.dart';
import 'package:untitled1/theme.dart';

class BidBottomSheet extends StatelessWidget {
  final PostData post;
  const BidBottomSheet({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: 450,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: DarktThemeColor.BottomSheetColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            width: 131,
            height: 5,
            decoration: BoxDecoration(
              color: Color(0xff1A1A1A),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Place a Bid',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: DarktThemeColor.primaryTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Place a Bid',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: DarktThemeColor.primaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/img/stories/${post.profileImage}',
                    width: 44,
                    height: 44,
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          post.personName,
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              color: DarktThemeColor.primaryTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Image.asset(
                          'assets/img/icons/verified.png',
                          width: 24,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text('Ayemnut.moseiki.app',
                            style: themeData.textTheme.titleSmall),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                              color: DarktThemeColor.secondaryTextColor,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                            'Created ${DateFormat.yMMMd().format(post.dateTime)}',
                            style: themeData.textTheme.titleSmall),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              width: 400,
              height: 44,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xff0D1333),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '0.05 ETH',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xff0D1333),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 400,
            height: 44,
            child: CupertinoTextField(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              placeholder: 'New Price',
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xffF6F6F6),
              ),
              suffix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  width: 88,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xff3C3D41)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/icons/ETH.png'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'ETH',
                        style: themeData.textTheme.bodyLarge!
                            .copyWith(fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          PinkButton(
            text: 'submit Bid',
            callback: () {
              Navigator.of(context).pop();
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return BottomSheetSuccess();
                  });
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(14, 16, 8, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.exclamationmark_circle,
                  color: DarktThemeColor.secondaryTextColor,
                  size: 18,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'You can hide this NFT',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: DarktThemeColor.secondaryTextColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomSheetSuccess extends StatelessWidget {
  const BottomSheetSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 405,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: DarktThemeColor.BottomSheetColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            width: 131,
            height: 5,
            decoration: BoxDecoration(
              color: Color(0xff1A1A1A),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Bid placed sccessfully!',
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: DarktThemeColor.primaryTextColor),
          ),
          const SizedBox(
            height: 25,
          ),
          Image.asset('assets/img/icons/success.png'),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.check_mark,
                  size: 28,
                  color: DarktThemeColor.primaryTextColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Approve asset',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: DarktThemeColor.primaryTextColor),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'This transaction is conducted only once per asset type',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: DarktThemeColor.primaryTextColor),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          PinkButton(
            text: 'Back Home Screen',
            callback: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class BottomSheetComment extends StatefulWidget {
  const BottomSheetComment({super.key});

  @override
  State<BottomSheetComment> createState() => _BottomSheetCommentState();
}

class _BottomSheetCommentState extends State<BottomSheetComment> {
  FocusNode comment_focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: 360,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: DarktThemeColor.BottomSheetColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          Center(
            child: Container(
              width: 131,
              height: 5,
              decoration: BoxDecoration(
                color: Color(0xff1A1A1A),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              'Comments',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: DarktThemeColor.primaryTextColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/img/icons/Image.png',
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Nicole',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: DarktThemeColor.primaryTextColor),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: DarktThemeColor.secondaryTextColor,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              '5m',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: DarktThemeColor.primaryTextColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'Nice content, thank you!',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: DarktThemeColor.primaryTextColor),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.heart,
                      size: 26,
                      color: DarktThemeColor.secondaryTextColor,
                    )),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(70, 0, 69, 0),
            child: Text(
              'Reply',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: DarktThemeColor.primaryTextColor),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Reaction',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: DarktThemeColor.primaryTextColor),
                ),
                EmojiButton(emoji: '😊'),
                EmojiButton(emoji: '😂'),
                EmojiButton(emoji: '😍'),
                EmojiButton(emoji: '👍'),
                EmojiButton(emoji: '👎'),
                EmojiButton(emoji: '😢'),
                Container(
                  width: 1,
                  height: 25,
                  decoration: const BoxDecoration(
                      color: DarktThemeColor.secondaryTextColor),
                ),
                Image.asset('assets/img/icons/smile.png'),
                Image.asset('assets/img/icons/Gif.png'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 44,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
              child: Row(
                children: [
                  Image.asset('assets/img/icons/Image.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: CupertinoTextField(
                      focusNode: comment_focus,
                      autofocus: true,
                      padding: EdgeInsets.fromLTRB(20, 0, 8, 0),
                      placeholder: 'Add comment',
                      placeholderStyle: const TextStyle(
                          color: DarktThemeColor.secondaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      decoration: BoxDecoration(
                        color: DarktThemeColor.BottomSheetColor,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: const Color(0xffFFFFFF).withOpacity(0.3),
                            width: 1.0),
                      ),
                      // prefix: Padding(
                      //   padding: EdgeInsets.only(left: 8.0),
                      //   child: Text(
                      //     'Label:',
                      //     style: TextStyle(
                      //         color: Colors.grey[600], fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      suffix: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffF37381),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('post')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmojiButton extends StatelessWidget {
  final String emoji;

  const EmojiButton({
    super.key,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        emoji,
        style: TextStyle(fontSize: 24.0, decoration: TextDecoration.none),
      ),
    );
  }
}
