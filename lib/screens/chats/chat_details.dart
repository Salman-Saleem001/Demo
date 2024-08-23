import 'dart:io';

import '../../exports.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key, required this.index});

  final int index;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  String? textFieldVal;
  XFile? selectedFile;
  late bool send;
  @override
  void initState() {
    send= false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.pureWhiteColor,
        surfaceTintColor: AppColors.pureWhiteColor,
        title: CommonText(Constants.chatsData[widget.index].name ?? '',
            Assets.nunitoBold, 16),
        centerTitle: true,
        actions: [
          ImageIconButton(
            onTap: () {},
            image: Assets.settingIcon,
          ),
          10.wp,
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  reverse: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  itemBuilder: (_, subIndex) {
                    int newIndex = (Constants.messages.length) - 1 - subIndex;
                    var data = Constants.messages[newIndex];
                    return Column(
                      children: [
                        if (subIndex == 4) ...[
                          5.hp,
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const ColoredBox(
                                color: AppColors.secondaryColor,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: CommonText(
                                    "Today",
                                    Assets.nunitoBold,
                                    10,
                                    color: AppColors.pureWhiteColor,
                                  ),
                                ),
                              )),
                          7.hp,
                        ],
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: data.id == 1
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            if (data.id == 2) ...[
                              const CustomClipOval(),
                              5.wp,
                            ],
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: data.id != 2
                                    ? const Radius.circular(8.0)
                                    : Radius.zero,
                                bottomRight: data.id != 1
                                    ? const Radius.circular(8.0)
                                    : Radius.zero,
                                topRight: const Radius.circular(8.0),
                                topLeft: const Radius.circular(8.0),
                              ),
                              child: ColoredBox(
                                color: AppColors.messageTileColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      if (data.messageType == 'text') ...[
                                        CommonText(data.message ?? '',
                                            Assets.nunitoRegular, 14),
                                      ] else ...[
                                        data.message.toString().contains('http')
                                            ? Image.network(
                                                data.message,
                                                height: 100,
                                                fit: BoxFit.contain,
                                                scale: 4,
                                                loadingBuilder:
                                                    (_, child, chunk) {
                                                  if (chunk == null) {
                                                    return child;
                                                  }
                                                  return const CircularProgressIndicator(
                                                    color:
                                                        AppColors.primaryColor,
                                                  );
                                                },
                                              )
                                            : Image.file(
                                                File(data.message),
                                                height: 100,
                                                fit: BoxFit.contain,
                                                scale: 4,
                                              ),
                                      ],
                                      5.hp,
                                      const CommonText(
                                        '16:05',
                                        Assets.nunitoRegular,
                                        12,
                                        color: AppColors.secondaryColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (data.id == 1) ...[
                              5.wp,
                              const CustomClipOval(
                                image:
                                    "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
                              ),
                            ]
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (_, index) {
                    return 5.hp;
                  },
                  itemCount: Constants.messages.length)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: selectedFile?.path.isEmpty == true
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.end,
              children: [
                ImageIconButton(
                  onTap: () async {
                    await PermissionsHandler()
                        .cameraPermission(context: context)
                        .then((val) async {
                      if (val) {
                        selectedFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (selectedFile != null) {
                          setState(() {});
                        }
                      }
                    });
                  },
                  image: Assets.chatGalleryIcon,
                ),
                selectedFile== null
                    ? Expanded(
                        child: TextField(
                          key: Key(send.toString()),
                          onChanged: (val) {
                            textFieldVal = val;
                          },
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(5, 15,5,0 ),
                              border: InputBorder.none,
                              hintText: 'Type something',
                              helperStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: Assets.nunitoMedium,
                                color: AppColors.blackColor,
                              ),),
                        ),
                      )
                    : ImageWithCross(
                        onTap: () {
                          selectedFile = null;
                            setState(() {});
                        },
                        image: selectedFile?.path ?? "",
                        padding: EdgeInsets.zero,
                      ),
                InkWell(
                    onTap: () {
                      if (selectedFile?.path.isNotEmpty == true) {
                        Constants.messages.add(Messages(
                            id: 1,
                            messageType: 'image',
                            message: selectedFile?.path,
                            time: '16:05'));
                        selectedFile = null;
                        setState(() {});
                      }else{
                        debugPrint(textFieldVal);
                        if(textFieldVal?.isNotEmpty==true){
                          Constants.messages.add(Messages(
                              id: 1,
                              messageType: 'text',
                              message: textFieldVal,
                              time: '16:05'),
                          );
                          textFieldVal=null;
                          send= !send;
                          setState(() {});
                        }

                      }

                      // if()
                    },
                    child: const Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    selectedFile=null;
    textFieldVal= null;
    super.dispose();
  }
}
