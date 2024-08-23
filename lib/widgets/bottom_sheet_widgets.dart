import 'package:demo/exports.dart';

class TopicSelectionSheet extends StatelessWidget {
  const TopicSelectionSheet({
    super.key,
    required this.selectedIndex,
  });

  final ValueNotifier<int> selectedIndex;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (val){
        selectedIndex.dispose();
        // debugPrint("Dispose is Called");
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.hp,
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
              shrinkWrap: true,
              itemBuilder: (_,index){
          return ValueListenableBuilder<int>(
            valueListenable: selectedIndex,
            builder: (BuildContext context, int value, Widget? child) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  selectedIndex.value= index;
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color:  value==index? AppColors.primaryColor: AppColors.transparentColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ImageIcon(const AssetImage(Assets.topicIcon), color: value==index? AppColors.pureWhiteColor: null,),
                        20.wp,
                        CommonText("Topic ${index+1}", Assets.nunitoBold, 16,color: value==index? AppColors.pureWhiteColor: null),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
                    }, separatorBuilder: (_,index){
          return 5.hp;
                    }, itemCount: 4),
          50.hp,
        ],
      ),
    );
  }
}