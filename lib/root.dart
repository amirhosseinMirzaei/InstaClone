import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/theme.dart';
import 'package:untitled1/ui/home/Home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int discoverIndex = 1;
const int marketIndex = 2;
const int menuIndex = 3;
const int profileIndex = 4;
const double heightBottomNavigation = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _discoverKey = GlobalKey();
  GlobalKey<NavigatorState> _marketKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();
  GlobalKey<NavigatorState> _profileKey = GlobalKey();

  final List<int> _history = [];
  late final map = {
    homeIndex: _homeKey,
    discoverIndex: _discoverKey,
    marketIndex: _marketKey,
    menuIndex: _menuKey,
    profileIndex: _profileKey,
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
        body: Stack(
          children: [
            Positioned.fill(
              bottom: heightBottomNavigation,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
                  Navigator(
                    key: _discoverKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => Container(
                              color: Colors.black,
                            )),
                  ),
                  Navigator(
                    key: _marketKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => Container(
                              color: Colors.black,
                            )),
                  ),
                  Navigator(
                    key: _menuKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => Container(
                              color: Colors.black,
                            )),
                  ),
                  Navigator(
                    key: _profileKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => Container(
                              color: Colors.black,
                            )),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
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
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Screen',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const _BottomNavigation(
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(colors: [
                  DarktThemeColor.begGradientColor,
                  DarktThemeColor.toGradientColor,
                  DarktThemeColor.endGradientColor,
                ]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    iconFileName: 'Home.png',
                    activeIconFileName: 'Home.png',
                    title: 'Home',
                    onTap: () {
                      onTap(homeIndex);
                    },
                    isActive: selectedIndex == homeIndex,
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Discover.png',
                    activeIconFileName: 'Discover.png',
                    title: 'Discover',
                    onTap: () {
                      onTap(discoverIndex);
                    },
                    isActive: selectedIndex == discoverIndex,
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Market.png',
                    activeIconFileName: 'Market.png',
                    title: 'NFTmarket',
                    onTap: () {
                      onTap(marketIndex);
                    },
                    isActive: selectedIndex == marketIndex,
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'more.png',
                    activeIconFileName: 'more.png',
                    title: 'More',
                    onTap: () {
                      onTap(menuIndex);
                    },
                    isActive: selectedIndex == menuIndex,
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Profile.png',
                    activeIconFileName: 'Profile.png',
                    title: 'Profile',
                    onTap: () {
                      onTap(profileIndex);
                    },
                    isActive: selectedIndex == profileIndex,
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

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final bool isActive;
  final String title;
  final Function() onTap;

  const _BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.onTap,
      required this.activeIconFileName,
      required this.title,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 8, 4),
          child: Container(
            width: 80,
            height: 46,
            decoration: BoxDecoration(
                color: isActive ? Colors.white : null,
                borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/icons/${iconFileName}',
                  width: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: themeData.textTheme.caption!,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
