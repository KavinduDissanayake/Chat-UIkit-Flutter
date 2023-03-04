import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/new/screen/chat_room/received_message.dart';
import 'package:myapp/new/screen/chat_room/sent_message.dart';
import 'package:myapp/new/screen/chat_room/widgets/chat_bubble.dart';
import 'package:myapp/widgets/spacer/spacer_custom.dart';

import '../../../constants/app_colors.dart';
import '../../../device_utils.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils.dart';
import 'bubble shape .dart';

// class ChatMessage {
//   String messageContent;
//   String messageType;
//   ChatMessage({required this.messageContent, required this.messageType});
// }

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({
    Key? key,
  }) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: DeviceUtils.getScaledHeight(context, 1),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backChatGroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChatRoomHeader(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: DeviceUtils.getScaledHeight(context, 0.87),
                width: DeviceUtils.getScaledWidth(context, 1),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 100,
                                  child: Stack(
                                      children: List.generate(2, (index) {
                                    return Positioned(
                                        left: index * 30,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: Colors.primaries[Random()
                                                  .nextInt(
                                                      Colors.primaries.length)],
                                              border: Border.all(
                                                  color: Colors.grey, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ));
                                  })),
                                ),
                                Column(
                                  children: [
                                    CustomHeightSpacer(),
                                    Text(
                                      'March 28, 2019 11:50',
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2575,
                                        letterSpacing: 0.8000000119,
                                        color: Color(0xff77838f),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView(
                      children: [
                        CustomHeightSpacer(
                          size: 0.06,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 1, // OK
                            decoration: BoxDecoration(
                              color: AppColors.backChatGroundColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                          ),
                        ),
                        CustomHeightSpacer(),
                        DateDevider(),
                        CustomHeightSpacer(),
                        SentMessage(
                          child: Text(
                            "Integer quis eros quis et, vestibulum lobortis tortor, eleifend eleifend arcu.",
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.6428571429,
                              letterSpacing: 0.5,
                              color: Color(0xffffffff),
                            ),
                          ),
                          time: "01:15 PM",
                        ),
                        ReceivedMessage(
                          child: Text(
                            "Morbi ullamcorper quis est et.",
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.6428571429,
                              letterSpacing: 0.5,
                              color: Color(0xff323643),
                            ),
                          ),
                          time: "01:15 PM",
                        ),
                        SentMessage(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //
                              DummyWaveWithPlayIcon(),
                              //       ),
                            ],
                          ),
                          time: "01:15 PM",
                        ),
                        ReceivedMessage(
                          child: Text(
                            "Pellentesque a lectus nulla, dapibus luctus arcu nec.",
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.64,
                              letterSpacing: 0.5,
                              color: Color(0xff323643),
                            ),
                          ),
                          time: "01:15 PM",
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                        height: 70,
                        // width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                Assets.icons.icCameraIcon.path,
                                width: 18,
                                height: 18,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width:
                                    DeviceUtils.getScaledWidth(context, 0.75),
                                decoration: BoxDecoration(
                                  color: AppColors.backChatGroundColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Type a Message',
                                        style: SafeGoogleFont(
                                          'SF Pro Text',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2575,
                                          letterSpacing: 0.174999997,
                                          color: Color(0xffc1c0c8),
                                        ),
                                      ),

                                      // Expanded(
                                      //   child: TextField(
                                      //       style: SafeGoogleFont(
                                      //         'SF Pro Text',
                                      //         fontSize: 14,
                                      //         fontWeight: FontWeight.w400,
                                      //         height: 1.2575,
                                      //         letterSpacing: 0.174999997,
                                      //         color: Color(0xffc1c0c8),
                                      //       ),
                                      //     decoration: InputDecoration(
                                      //         hintText: 'Enter Your Name',
                                      //       border: InputBorder.none,
                                      //
                                      //     )
                                      //
                                      //     ),
                                      // )

                                      Image.asset(
                                        Assets.icons.icMic.path,
                                        width: 18,
                                        height: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                Assets.icons.sendIcon.path,
                                width: 18,
                                height: 18,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DummyWaveWithPlayIcon extends StatelessWidget {
  const DummyWaveWithPlayIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // rectanglesHz (0:577)
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleoSY (0:592)
          width: 3,
          height: 12,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectanglejqz (0:578)
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangle5ex (0:581)
          width: 3,
          height: 16,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleRD2 (0:585)
          width: 3,
          height: 18,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        //     ],
        //   ),
        // ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectanglexye (0:590)
          width: 3,
          height: 26,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),

        SizedBox(
          width: 2,
        ),

        Container(
          // rectangleSP2 (0:587)
          width: 3,
          height: 18,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleyNx (0:582)
          width: 3,
          height: 16,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleJg8 (0:579)
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleEpg (0:593)
          width: 3,
          height: 12,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectanglez3A (0:586)
          width: 3,
          height: 18,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangle8QG (0:589)
          width: 3,
          height: 18,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleHHA (0:584)
          width: 3,
          height: 16,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangle2Ve (0:598)
          width: 3,
          height: 12,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),

        SizedBox(
          width: 2,
        ),
        Container(
          // rectanglenUp (0:591)
          width: 3,
          height: 26,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleGPz (0:588)
          width: 3,
          height: 18,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleoep (0:583)
          width: 3,
          height: 16,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),

        SizedBox(
          width: 2,
        ),
        Container(
          // rectangle9Tn (0:580)
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleHZz (0:594)
          width: 3,
          height: 12,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleRw6 (0:595)
          width: 3,
          height: 10,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectanglea3J (0:596)
          width: 3,
          height: 8,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          // rectangleifJ (0:597)
          width: 3,
          height: 6,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
        ),

        CustomWidthSpacer(
          size: 0.05,
        ),

        Text(
          '01:3',
          style: SafeGoogleFont(
            'SF Pro Text',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.2575,
            letterSpacing: 1,
            color: Color(0xffffffff),
          ),
        ),

        CustomWidthSpacer(
          size: 0.05,
        ),

        Image.asset(
          Assets.images.playIcon.path,
          width: 28,
          height: 28,
        )
      ],
    );
  }
}

class DateDevider extends StatelessWidget {
  const DateDevider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: 100, // OK
        height: 41, // OK
        decoration: BoxDecoration(
          color: Color(0xffF2F3F6),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Center(
            child: Text(
          'Today',
          style: SafeGoogleFont(
            'SF Pro Text',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.193359375,
            letterSpacing: 1,
            color: Color(0xff77838f),
          ),
        )),
      ),
    );
  }
}

class ChatRoomHeader extends StatelessWidget {
  const ChatRoomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 25),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Image.asset(
              Assets.icons.leftIcon.path,
              width: 16,
              height: 16,
            ),
          ),
          Spacer(),
          Text(
            'Message Detail',
            textAlign: TextAlign.center,
            style: SafeGoogleFont(
              'SF Pro Text',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.2575,
              letterSpacing: 1,
              color: Color(0xff3b566e),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 16,
            height: 16,
          )
        ],
      ),
    );
  }
}
