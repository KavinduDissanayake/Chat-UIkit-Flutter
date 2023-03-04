import 'package:flutter/material.dart';
import 'package:myapp/widgets/spacer/spacer_custom.dart';

import '../../../../constants/app_colors.dart';
import '../../../../device_utils.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils.dart';

class HeaderWithSearchBar extends StatelessWidget {
  const HeaderWithSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 25),
      width: double.infinity,
      height: 113,
      decoration: BoxDecoration(
        color: Color(0xff166aff),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: double.infinity,
            width: DeviceUtils.getScaledWidth(context, 0.8),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomWidthSpacer(size: 0.03,),

                Image.asset(
                  Assets.icons.icSerach.path,
                  width: 15,
                  height: 15,
                ),

                CustomWidthSpacer(size: 0.03,),

                Text(
                  'Search',
                  style: SafeGoogleFont(
                    'SF Pro Text',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.2575,
                    letterSpacing: 1,
                    color: AppColors.gray,
                  ),
                ),
                //Spacer()
              ],
            ),
          ),

          Spacer(),

          Image.asset(
            Assets.images.cameraIpx.path,
            width: 32,
            height: 32,
          ),
        ],
      ),
    );
  }
}