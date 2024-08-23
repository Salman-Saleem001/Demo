import 'package:demo/exports.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, AppBar().preferredSize.height, 20,
              AppBar().preferredSize.height / 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CommonText("Logo", Assets.manropeBold, 24),
              10.wp,
              Image.asset(
                Assets.verifyIcon,
                scale: 2,
              ),
              const Spacer(),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: const ImageIcon(
                    AssetImage(Assets.notificationsIcon),
                    size: 32,
                  )),
            ],
          ),
        ),
        TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: AppColors.primaryColor,
          labelStyle: const TextStyle(
              fontSize: 12,
              fontFamily: Assets.nunitoBold,
              color: AppColors.primaryColor),
          dividerColor: AppColors.transparentColor,
          tabs: const [
            Tab(text: 'Public Feed'),
            Tab(text: 'Business Feed'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              DailyFeeds(),
              DailyFeeds(),
            ],
          ),
        ),
      ],
    );
  }
}

class DailyFeeds extends StatelessWidget {
  const DailyFeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 10, right: 12.0),
          child: Row(
            children: [
              const CommonText("Feeds", Assets.nunitoBold, 20),
              const Spacer(),
              ImageIconButton(
                onTap: () {
                  ValueNotifier<int> selectedIndex = ValueNotifier(-1);
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.pureWhiteColor,
                      showDragHandle: true,
                      builder: (_) {
                        return TopicSelectionSheet(
                            selectedIndex: selectedIndex);
                      });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.messageTileColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomClipOval(
                            radius: 40,
                            image:
                                "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
                          ),
                          5.wp,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  const CommonText(
                                    "James",
                                    Assets.nunitoSemiBold,
                                    13,
                                  ),
                                  10.wp,
                                  Image.asset(
                                    Assets.verifyIcon,
                                    scale: 3,
                                  ),
                                  7.wp,
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: const SizedBox(
                                      height: 3,
                                      width: 3,
                                      child: ColoredBox(
                                          color: AppColors.blackColor),
                                    ),
                                  ),
                                  5.wp,
                                  const CommonText(
                                      "1 hour ago", Assets.manropeMedium, 10),
                                ],
                              ),
                              1.hp,
                              const CommonText(
                                  "Topic name", Assets.manropeMedium, 10),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.more_horiz),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 0.0, 20, 5),
                      child: CommonText(
                        "Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.",
                        Assets.manropeMedium,
                        10,
                        lines: 2,
                      ),
                    ),
                    if (index % 2 == 1)
                      Image.network(
                        'https://wallpapers.com/images/hd/cool-profile-picture-minion-13pu7815v42uvrsg.jpg',
                        fit: BoxFit.cover,
                        loadingBuilder: (_, child, chunk) {
                          if (chunk == null) {
                            return child;
                          }
                          return const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          );
                        },
                      ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Icon(Icons.favorite_border),
                          10.wp,
                          const ImageIcon(
                            AssetImage(Assets.commentIcon),
                          ),
                          10.wp,
                          const ImageIcon(
                            AssetImage(Assets.sendIcon),
                          ),
                          if (index % 2 == 1)...[
                            const Spacer(),
                            const ImageIcon(
                              AssetImage(Assets.saveIcon),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return 10.hp;
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

