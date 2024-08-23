import '../exports.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  late int _bottomNavIndex;


  List<Widget> screens =[
    const Feed(),
    const Placeholder(),
    const ChatsScreen(),
    const Placeholder(),
  ];

  List bottomItems = [
    {
      "name": "Home",
      "activeIcon": Assets.selectedHomeIcon,
      "unActive": Assets.unselectedHomeIcon,
    },
    {
      "name": "Search",
      "activeIcon": Assets.searchIcon,
      "unActive": Assets.searchIcon,
    },
    {
      "name": "Create",
      "activeIcon": Assets.addIcon,
      "unActive": Assets.addIcon,
    },
    {
      "name": "Chats",
      "activeIcon": Assets.messageBottomSelectedIcon,
      "unActive": Assets.messageBottomIcon,
    },
    {
      "name": "Profile",
      "activeIcon": Assets.profileIcon,
      "unActive": Assets.profileIcon,
    },

  ];

  @override
  void initState() {
    _bottomNavIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhiteColor,
      body: screens[_bottomNavIndex>2? _bottomNavIndex-1: _bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.pureWhiteColor,
        currentIndex: _bottomNavIndex,
        useLegacyColorScheme: false,
        unselectedLabelStyle: const TextStyle(
          inherit: false,
          fontSize: 12,
          fontFamily: Assets.manropeSemiBold,
          color: AppColors.unselectedBottomNavItemColor,
        ),
        selectedLabelStyle: const TextStyle(
          inherit: false,
          fontSize: 12,
          fontFamily: Assets.manropeSemiBold,
          color: AppColors.primaryColor,
        ),
        onTap: (index) {
          if(index==2){
            navigatorKey.currentState?.push(SlideRightRoute(page: const CreatePost()));
          }else{
            _bottomNavIndex = index;
            setState(() {});
          }
        },
        items: bottomItems
            .map((element) => BottomNavigationBarItem(
                icon: Image.asset(
                  element['unActive'],
                  scale: 3,
                ),
                activeIcon: Image.asset(
                  element['activeIcon'],
                  scale: 3,
                  color: element['activeIcon'] == element['unActive']
                      ? AppColors.primaryColor
                      : null,
                  colorBlendMode: BlendMode.srcIn,
                ),
                label: element['name']))
            .toList(),
      ),
    );
  }
}
