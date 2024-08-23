import 'dart:async';

import '../../exports.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, AppBar().preferredSize.height, 10, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CommonText("Messages", Assets.nunitoBold, 20),
              ImageIconButton(
                onTap: () {},
                image: Assets.addMessageIcon,
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<List<Messages>>(
              stream: periodicMessagesStream(),
              builder: (context, AsyncSnapshot<List<Messages>> snapshot) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          navigatorKey.currentState?.push(SlideRightRoute(page: ChatDetails(index: index,)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ColoredBox(
                            color: AppColors.messageTileColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomClipOval(
                                    radius: 35,
                                  ),
                                  10.wp,
                                   Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonText(Constants.chatsData[index].name??'', Assets.nunitoBold, 16),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20.0,bottom: 10),
                                          child: Constants.messages.last.messageType=='text'? CommonText(
                                            Constants.messages.last.message,
                                            Assets.nunitoRegular,
                                            14,
                                            lines: 1,
                                            color: AppColors.secondaryColor,
                                          ): const ImageIcon(AssetImage(Assets.galleryIcon),size: 16,),
                                        ),
                                        Row(
                                          children: [
                                             CommonText(Constants.chatsData[index].messages?.last.time??'', Assets.nunitoRegular, 12),
                                            const Spacer(),
                                            const CommonText("5", Assets.nunitoMedium, 12),
                                            5.wp,
                                            const ImageIcon(AssetImage(Assets.messageIcon,), size: 18,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return 10.hp;
                    },
                    itemCount: Constants.chatsData.length);
              }
            ),
          )
        ],
      ),
    );
  }

  Stream<List<Messages>> periodicMessagesStream() {
    return Stream<List<Messages>>.periodic(
        const Duration(seconds: 1),
            (int count) => Constants.messages
    );
  }
}
