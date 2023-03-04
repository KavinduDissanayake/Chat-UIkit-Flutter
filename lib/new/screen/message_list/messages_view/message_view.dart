import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/new/screen/chat_room/chat_room.dart';

import '../../../../constants/app_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils.dart';
import '../../../../widgets/spacer/spacer_custom.dart';

class MessageViewWidget extends StatelessWidget {
  const MessageViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatUserListCardWidget(
          name: 'Fleece Marigold',
          image: Assets.images.user2.path,
          isOnline: true,
          message: 'Quisque blandit arcu quis turpis tincidunt facilisis…',
          unReadCount: '1',
          isUnReadCountShow: true,
          time: '15 min',
          onTap: () {
            Get.to(ChatRoomPage());
          },
        ),
        ChatUserListCardWidget(
          name: 'Gustav Purpleson',
          image: Assets.images.user3.path,
          isOnline: true,
          message: 'QSed ligula erat, dignissim sit at amet dictum id, iaculis… ',
          unReadCount: '2',
          isUnReadCountShow: true,
          time: '32 min',
          onTap: () {
            Get.to(ChatRoomPage());
          },
        ),


        ChatUserListCardWidget(
          name: 'Chauffina Car',
          image: Assets.images.user4.path,
          isOnline: true,
          message: 'Quisque blandit arcu quis turpis tincidunt facilisis…',
          unReadCount: '1',
          isUnReadCountShow: true,
          time: '15 min',
          onTap: () {
            Get.to(ChatRoomPage());
          },
        ),


        ChatUserListCardWidget(
          name: 'Piff Jenkins',
          image: Assets.images.user5.path,
          isOnline: false,
          message: 'Duis eget nibh tincidunt odio id venenatis ornare quis…',
          unReadCount: '1',
          isUnReadCountShow: false,
          time: '1 min',
          onTap: () {
            Get.to(ChatRoomPage());
          },
        ),


        ChatUserListCardWidget(
          name: 'Justin Case',
          image: Assets.images.user6.path,
          isOnline: false,
          message: 'Donec ut lorem tristique dui sit faucibus tincidunt….',
          unReadCount: '1',
          isUnReadCountShow: false,
          time: '1 min',
          onTap: () {
            Get.to(ChatRoomPage());
          },
        ),


        ChatUserListCardWidget(
          name: 'Ingredia Nutrisha',
          image: Assets.images.user7.path,
          isOnline: false,
          message: 'Cras felis dui, facilisis sit amet dolor ac, tincidunt…',
          unReadCount: '1',
          isUnReadCountShow: false,
          time: '1 min',
          onTap: () {
            Get.to(ChatRoomPage());
          },
        ),

      ],
    );
  }
}

class ChatUserListCardWidget extends StatelessWidget {
  const ChatUserListCardWidget({
    super.key,
    required this.name,
    required this.image,
    required this.isOnline,
    required this.message,
    required this.unReadCount,
    required this.isUnReadCountShow,
    required this.time, this.onTap,
  });

  final String name;
  final String image;
  final bool isOnline;

  final String message;
  final String unReadCount;
  final bool isUnReadCountShow;
  final String time;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.fill),
                    shape: BoxShape.circle,
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
            CustomWidthSpacer(size: 0.03,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: SafeGoogleFont(
                      'SF Pro Text',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.2575,
                      letterSpacing: 1,
                      color: Color(0xff1e2022),
                    ),
                  ),
                  Text(
                    message,
                    style: SafeGoogleFont(
                      'SF Pro Text',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.8333333333,
                      letterSpacing: 1,
                      color: Color(0xff77838f),
                    ),
                  )
                ],
              ),
            ),
            CustomWidthSpacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  textAlign: TextAlign.right,
                  style: SafeGoogleFont(
                    'SF Pro Text',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.2575,
                    letterSpacing: 1,
                    color: Color(0xff77838f),
                  ),
                ),
                CustomHeightSpacer(),

                if(isUnReadCountShow)
                  Container(
                    // notificationMxt (0:34)
                    width: 43,
                    height: 25,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        unReadCount,
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'SF Pro Text',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.2575,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}