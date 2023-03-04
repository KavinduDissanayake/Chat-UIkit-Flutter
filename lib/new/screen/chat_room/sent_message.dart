
import 'package:flutter/material.dart';
import 'package:myapp/device_utils.dart';
import 'package:myapp/new/screen/chat_room/widgets/chat_bubble.dart';

import '../../../constants/app_colors.dart';
import '../../../utils.dart';
import '../../../widgets/spacer/spacer_custom.dart';

class SentMessage extends StatelessWidget {
  final Widget child;
  final String time;
  const SentMessage({
    Key? key,
    required this.child, required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight , //Change this to Alignment.topRight or Alignment.topLeft
              child: Column(
                children: [
                  CustomPaint(
                    painter: ChatBubble(color: AppColors.primaryColor, alignment: Alignment.topRight ),
                    child: Container(
                      constraints: BoxConstraints(minWidth: 100, maxWidth: DeviceUtils.getScaledWidth(context, 0.6)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
                        child: child,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            CustomHeightSpacer(size: 0.005,),

            Row(children: [
              Spacer(),
              Text(
                time,
                textAlign: TextAlign.right,
                style: SafeGoogleFont (
                  'SF Pro Text',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.2575,
                  letterSpacing: 1,
                  color: Color(0xff77838f),
                ),
              ),
            ],)

          ],
        ));

    return Padding(
      padding: EdgeInsets.only(right: 10.0, left: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}
