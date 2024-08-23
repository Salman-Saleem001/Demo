import 'package:demo/exports.dart';

class CustomDialogs{


  void showDialogs(
      String label,
      String description, {
        BuildContext? context,
        String? buttonLabel,
        required VoidCallback onPressed,
      }) {


    showDialog(
        context: context!,
        builder: (c) {
          return AlertDialog(
            surfaceTintColor: Theme.of(context).colorScheme.onSecondary,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onTertiary,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        color: Theme.of(context).colorScheme.shadow,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.warning,
                    size: 32,
                    color: AppColors.yellowColor,
                  ),
                ),
                10.hp,
                CommonText(label, Assets.manropeSemiBold, 16,
                    color: AppColors.secondaryColor),
                20.hp,
                CommonText(
                    description, Assets.manropeMedium, 12,
                    color: AppColors.secondaryColor,lines: 10,textAlign: TextAlign.center,),
                20.hp,
                CustomButton(
                    buttonText: buttonLabel?? "Ok",
                    width:  200 ,
                    onTap: onPressed)
              ],
            ),
          );
        });
  }
}