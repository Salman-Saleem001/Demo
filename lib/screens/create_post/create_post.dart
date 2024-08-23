import 'dart:io';
import 'package:demo/exports.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String? postData;
  int? selectedTopic;
  String? selectedPostType;
  XFile? selectedFile;

  @override
  void initState() {
    // TODO: implement initState
    selectedPostType = 'Public';
    selectedTopic = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: AppColors.pureWhiteColor,
        backgroundColor: AppColors.pureWhiteColor,
        title: const CommonText("Create Post", Assets.nunitoBold, 16),
        centerTitle: true,
        actions: [
          CustomButton(
            onTap: () {
              debugPrint(postData);
            },
          ),
          10.wp,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              15.wp,
              Expanded(
                child: SelectionTile(
                  selected: selectedPostType == 'Public',
                  onTap: () {
                    if (selectedPostType != 'Public') {
                      setState(() {
                        selectedPostType = 'Public';
                      });
                    }
                  },
                ),
              ),
              10.wp,
              Expanded(
                child: SelectionTile(
                  tileText: "Business",
                  selected: selectedPostType == 'Business',
                  onTap: () {
                    if (selectedPostType != 'Business') {
                      setState(() {
                        selectedPostType = 'Business';
                      });
                    }
                  },
                ),
              ),
              15.wp,
            ],
          ),
          Expanded(
            flex: MediaQuery.of(context).viewInsets.bottom == 0.0 ? 20 : 10,
            child: TextField(
              maxLines: 10,
              onChanged: (val) {
                postData = val;
              },
              style: const TextStyle(
                fontFamily: Assets.nunitoRegular,
                fontSize: 14,
              ),
              cursorColor: AppColors.blackColor,
              cursorWidth: 0.7,
              decoration: const InputDecoration(
                  hintText: "Type something",
                  hintStyle: TextStyle(
                    color: AppColors.blackColor,
                    fontFamily: Assets.nunitoRegular,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 20)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CommonText("Topic", Assets.nunitoRegular, 14),
          ),
          Expanded(
            flex: 1,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (_, index) {
                  return SelectionTile(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    tileText: Constants.topics[index],
                    selected: selectedTopic == index,
                    onTap: () {
                      setState(() {
                        selectedTopic = index;
                      });
                    },
                  );
                },
                separatorBuilder: (_, index) {
                  return 10.wp;
                },
                itemCount: Constants.topics.length),
          ),
          selectedFile == null
              ? Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      15.wp,
                      ImageIconButton(
                        onTap: () async {
                          if (await PermissionsHandler()
                              .cameraPermission(context: context)) {
                            final ImagePicker picker = ImagePicker();
                            selectedFile = await picker.pickImage(
                                    source: ImageSource.camera) ??
                                XFile('');
                            setState(() {});
                          }
                        },
                        image: Assets.cameraIcon,
                      ),
                      10.wp,
                      ImageIconButton(
                        onTap: () async {
                          if (await PermissionsHandler()
                              .cameraPermission(context: context)) {
                            final ImagePicker picker = ImagePicker();
                            selectedFile = await picker.pickImage(
                                    source: ImageSource.gallery) ??
                                XFile('');
                            setState(() {});
                          }
                        },
                        image: Assets.galleryIcon,
                      )
                    ],
                  ),
                )
              : ImageWithCross(onTap: () {
            selectedFile = null;
            setState(() {});
          }, image: selectedFile?.path ?? ''),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    postData=null;
    selectedTopic=null;
    selectedPostType=null;
    selectedFile= null;
    debugPrint("Disposed Called");
    super.dispose();
  }
}



