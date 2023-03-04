import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../device_utils.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils.dart';
import '../../../../widgets/spacer/spacer_custom.dart';

class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    RxInt activeIndex = 1.obs;
    return Obx(() => (FittedBox(
      child: Container(
        padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0x0f000000),
                offset: Offset(0, 4),
                blurRadius: 2.5,
              ),
            ],
            borderRadius: BorderRadius.circular(16),
            color: AppColors.lightBack),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StatusBarItemWidget(
              title: 'Messages (2)',
              decoration: BoxDecoration(
                boxShadow: [
                  if (activeIndex.value == 1)
                    const BoxShadow(
                      color: Color(0x0f000000),
                      offset: Offset(0, 4),
                      blurRadius: 2.5,
                    ),
                ],
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(16), right: Radius.circular(16)),
                color: activeIndex.value == 1
                    ? Theme.of(context).cardColor
                    : Colors.transparent,
              ),
              tap: () {
                activeIndex.value = 1;
                callback(activeIndex.value);
              },
              titleColor: activeIndex.value == 1
                  ? AppColors.primaryColor
                  : AppColors.activeGray,
            ),

            StatusBarItemWidget(
              title: 'Calls (1)',
              decoration: BoxDecoration(
                boxShadow: [
                  if (activeIndex.value == 2)
                    const  BoxShadow(
                      color: Color(0x0f000000),
                      offset: Offset(0, 4),
                      blurRadius: 2.5,
                    ),
                ],
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(16), right: Radius.circular(16)),
                //  gradient:   activeIndex.value == 2 ?  Themes.gradient : null,
                color: activeIndex.value == 2
                    ? Theme.of(context).cardColor
                    : Colors.transparent,
              ),
              tap: () {
                activeIndex.value = 2;
                callback(activeIndex.value);
              },
              titleColor: activeIndex.value == 2
                  ? AppColors.primaryColor
                  : AppColors.activeGray,
            ),
            // const Gap(5),
          ],
        ),
      ),
    )));
  }
}

class StatusBarItemWidget extends StatelessWidget {
  const StatusBarItemWidget({
    super.key,
    required this.title,
    this.decoration,
    this.tap,
    required this.titleColor,
  });

  final String title;

  final Color titleColor;

  final Decoration? decoration;
  final Function()? tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: tap,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 45,
            width: DeviceUtils.getScaledWidth(context, 0.45),
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: decoration,
            child: Row(
              children: [
                const Spacer(),
                Text(
                  title,
                  style: SafeGoogleFont(
                    'SF Pro Text',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 1.2575,
                    letterSpacing: 1,
                    color: titleColor,
                  ),
                ),
                const CustomWidthSpacer(
                  size: 0.03,
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}