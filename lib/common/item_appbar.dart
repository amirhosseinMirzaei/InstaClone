import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/theme.dart';

class AppbarNav extends StatefulWidget {
  const AppbarNav({super.key});

  @override
  State<AppbarNav> createState() => _AppbarNavState();
}

const int followIndex = 0;
const int forYouIndex = 1;
const int trendIndex = 2;

const double heightBottomNavigation = 65;

class _AppbarNavState extends State<AppbarNav> {
  int selectedScreenIndex = followIndex;

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _ForYouKey = GlobalKey();
  GlobalKey<NavigatorState> _TrendKey = GlobalKey();

  final List<int> _history = [];
  late final map = {
    followIndex: _homeKey,
    forYouIndex: _ForYouKey,
    trendIndex: _TrendKey,
  };
  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  Positioned.fill(
                    bottom: heightBottomNavigation,
                    child: IndexedStack(
                      index: selectedScreenIndex,
                      children: [
                        Navigator(
                          key: _homeKey,
                          onGenerateRoute: (settings) => MaterialPageRoute(
                              builder: (context) => Container()),
                        ),
                        Navigator(
                          key: _ForYouKey,
                          onGenerateRoute: (settings) => MaterialPageRoute(
                              builder: (context) => Container()),
                        ),
                        Navigator(
                          key: _TrendKey,
                          onGenerateRoute: (settings) => MaterialPageRoute(
                              builder: (context) => Container()),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _AppBarNavigation(
                      onTap: (int index) {
                        setState(() {
                          _history.remove(selectedScreenIndex);
                          _history.add(selectedScreenIndex);
                          selectedScreenIndex = index;
                        });
                      },
                      selectedIndex: selectedScreenIndex,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class _AppBarNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const _AppBarNavigation(
      {super.key, required this.onTap, required this.selectedIndex});
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: Colors.black,
      height: 90,
      child: Stack(
        children: [
          Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: Container(
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarNavigationItem(
                    title: 'Following',
                    onTap: () {
                      onTap(followIndex);
                    },
                    isActive: selectedIndex == followIndex,
                  ),
                  _AppBarNavigationItem(
                    title: 'For You',
                    onTap: () {
                      onTap(forYouIndex);
                    },
                    isActive: selectedIndex == forYouIndex,
                  ),
                  _AppBarNavigationItem(
                    title: 'Trending',
                    onTap: () {
                      onTap(trendIndex);
                    },
                    isActive: selectedIndex == trendIndex,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarNavigationItem extends StatelessWidget {
  final bool isActive;
  final String title;
  final Function() onTap;

  const _AppBarNavigationItem(
      {super.key,
      required this.onTap,
      required this.title,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 8, 4),
          child: Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
                color: isActive ? DarktThemeColor.secondaryColor : null,
                borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(color: DarktThemeColor.primaryTextColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
