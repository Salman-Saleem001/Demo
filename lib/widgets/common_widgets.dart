import 'dart:io';

import '../exports.dart';

class CustomClipOval extends StatelessWidget {
  const CustomClipOval({
    super.key,
    this.radius,
    this.image,
  });

  final double? radius;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 30),
      child: Image.network(
        image ??
            'https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg',
        height: radius ?? 30,
        width: radius ?? 30,
        fit: BoxFit.cover,
        loadingBuilder: (_, Widget child, chunk) {
          if(chunk==null){
            return child;
          }
          return CustomShimmer(
              child: SizedBox(
            height: (radius ?? 30)-15,
            width: (radius ?? 30)-15,
          ));
        },
        errorBuilder: (_, trace, error) {
          return Icon(
            Icons.account_circle,
            size: (radius ?? 0) - 10.0,
            color: AppColors.secondaryColor,
          );
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.buttonText,
    this.backGroundColor,
    required this.onTap,
  });

  final double? height;
  final double? width;
  final String? buttonText;
  final Color? backGroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.blackColor,
      borderRadius: BorderRadius.circular(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          height: height ?? 30,
          width: width ?? 80,
          child: ColoredBox(
            color: backGroundColor ?? AppColors.primaryColor,
            child: Center(
              child: CommonText(
                buttonText ?? "Post",
                Assets.nunitoBold,
                16,
                color: AppColors.pureWhiteColor,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectionTile extends StatelessWidget {
  const SelectionTile({
    super.key,
    this.tileText,
    this.padding,
    required this.selected,
    required this.onTap,
  });

  final String? tileText;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryColor : AppColors.pureWhiteColor,
          borderRadius: BorderRadius.circular(20),
          border: selected ? null : Border.all(color: AppColors.secondaryColor),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 4.0),
          child: Center(
            child: CommonText(tileText ?? "Public", Assets.nunitoBold, 16,
                textAlign: TextAlign.center,
                color: selected ? AppColors.pureWhiteColor : null),
          ),
        ),
      ),
    );
  }
}

class ImageIconButton extends StatelessWidget {
  const ImageIconButton({
    super.key,
    this.image,
    required this.onTap,
    this.splashRadius,
  });

  final String? image;
  final VoidCallback onTap;
  final double? splashRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.messageTileColor,
      borderRadius: BorderRadius.circular(splashRadius ?? 20),
      child: ImageIcon(
        AssetImage(image ?? Assets.filterIcon),
        size: 30,
      ),
    );
  }
}

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: AppColors.shimmerColor,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
        Positioned.fill(
            child: LinearProgressIndicator(
          backgroundColor: AppColors.transparentColor,
          color: AppColors.pureWhiteColor.withOpacity(0.2),
        ))
      ],
    );
  }
}

class ImageWithCross extends StatelessWidget {
  const ImageWithCross({super.key, required this.onTap, required this.image, this.padding});

  final VoidCallback onTap;
  final String image;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: padding?? const EdgeInsets.fromLTRB(15, 20, 0, 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              width: 150,
              height: 100,
              File(image),
              fit: BoxFit.cover,
              scale: 10,
            ),
          ),
        ),
        Positioned(
          top: padding ==null? 20: 2,
          child: GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.cancel_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
