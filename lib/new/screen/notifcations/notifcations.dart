import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/spacer/spacer_custom.dart';

import '../../../constants/app_colors.dart';
import '../../../device_utils.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils.dart';
import '../message_list/widgets/header.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({
    Key? key,
  }) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(1, (i) => 'Item ${i + 1}');
    return Container(
      height: DeviceUtils.getScaledHeight(context, 1),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backGroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            HeaderWithSearchBar(),

            Padding(
              padding: const EdgeInsets.only(left: 16.0,top: 16),
              child: Text(
                'Notifications',
                style: SafeGoogleFont(
                  'SF Pro Text',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.2575,
                  letterSpacing: 1,
                  color: Color(0xff1e2022),
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  key: Key(item),
                  onDismissed: (direction) {},
                  // Show a red background as the item is swiped away.
                  background: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:Image.asset(Assets.icons.icDelete.path,width: 50,height: 50,)
                    ),
                  ),
                  child: NotificationCardWidget(
                    name: 'Irussellsprout',
                    image: Assets.images.user7.path,
                    isOnline: false,
                    message: 'Vivamus varius nunc neque…',
                    unReadCount: '2',
                    isUnReadCountShow: true,
                    time: 'Yesterday',
                  ),
                );
              },
            ),
            CustomHeightSpacer(),
            NotificationCardWidget(
              name: 'jakeweary',
              image: Assets.images.user6.path,
              isOnline: true,
              message: 'Suspendisse nulla augue…',
              unReadCount: '4',
              isUnReadCountShow: true,
              time: 'Now Active',
            ),

            CustomHeightSpacer(),

            NotificationCardWidget(
              name: 'Ingredia Nutrisha',
              image: Assets.images.user5.path,
              isOnline: false,
              message: 'CQuisque urna augue, congue……',
              unReadCount: '6',
              isUnReadCountShow: true,
              time: 'Now Active',
            ),
            CustomHeightSpacer(),
            NotificationCardWidget(
              name: 'ingredianutrisha',
              image: Assets.images.user4.path,
              isOnline: false,
              message: 'Curabitur eget nunc eget felis…',
              unReadCount: '1',
              isUnReadCountShow: false,
              time: '1 min',
            ),
            CustomHeightSpacer(),
            NotificationCardWidget(
              name: 'Ingredia Nutrisha',
              image: Assets.images.user3.path,
              isOnline: false,
              message:
                  'Cras felis dui, facilisis sit amet dolor ac, tincidunt…',
              unReadCount: '1',
              isUnReadCountShow: false,
              time: '1 min',
            ),   CustomHeightSpacer(),
            NotificationCardWidget(
              name: 'Ingredia Nutrisha',
              image: Assets.images.user2.path,
              isOnline: false,
              message:
                  'Cras felis dui, facilisis sit amet dolor ac, tincidunt…',
              unReadCount: '1',
              isUnReadCountShow: false,
              time: '1 min',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    super.key,
    required this.name,
    required this.image,
    required this.isOnline,
    required this.message,
    required this.unReadCount,
    required this.isUnReadCountShow,
    required this.time,
  });

  final String name;
  final String image;
  final bool isOnline;
  final String message;
  final String unReadCount;
  final bool isUnReadCountShow;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0x21000000),
              offset: Offset(0, 2),
              blurRadius: 24,
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.fill),
                    shape: BoxShape.rectangle,
                  ),
                ),

                if(isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: AppColors.backGroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomWidthSpacer(
              size: 0.03,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: SafeGoogleFont(
                      'SF Pro Text',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2575,
                      letterSpacing: 0.6000000238,
                      color: Color(0xff1e2022),
                    ),
                  ),
                  CustomHeightSpacer(
                    size: 0.003,
                  ),
                  Text(
                    message,
                    style: SafeGoogleFont(
                      'SF Pro Text',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2575,
                      letterSpacing: 0.6000000238,
                      color: Color(0xff77838f),
                    ),
                  ),
                  CustomWidthSpacer(
                    size: 0.03,
                  ),
                  CustomHeightSpacer(
                    size: 0.003,
                  ),
                  Text(
                    time,
                    style: SafeGoogleFont(
                      'SF Pro Text',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2575,
                      letterSpacing: 0.6000000238,
                      color: Color(0xff77838f),
                    ),
                  ),
                ],
              ),
            ),
            CustomWidthSpacer(
              size: 0.03,
            ),
            isUnReadCountShow
                ? Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: Color(0xff166aff),
                      // borderRadius: BorderRadius.circular(11),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        unReadCount,
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'SF Pro Text',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.2575,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.done,
                      size: 14,
                      color: AppColors.backGroundColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
