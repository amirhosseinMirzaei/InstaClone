import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/common/Buttons.dart';
import 'package:untitled1/theme.dart';

class BidBottomSheet extends StatelessWidget {
  const BidBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
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
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/img/stories/story_1.jpg',
                      width: 44,
                      height: 44,
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Damla',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: DarktThemeColor.primaryTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Ayemnut.moseiki.app',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: DarktThemeColor.secondaryTextColor),
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
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
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
                placeholder: '     New Price',
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xffF6F6F6),
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
          ],
        ),
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
