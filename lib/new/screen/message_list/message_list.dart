import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:myapp/constants/app_colors.dart';
import 'package:myapp/new/screen/message_list/widgets/header.dart';
import 'package:myapp/new/screen/message_list/widgets/status_bar.dart';

import '../../../device_utils.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils.dart';
import '../../../widgets/spacer/spacer_custom.dart';
import 'calls_View/call_view.dart';
import 'messages_view/message_view.dart';

class MessageListPage extends StatefulWidget {
  MessageListPage({
    Key? key,
  }) : super(key: key);

  @override
  _MessageListPageState createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  RxInt activeIndex = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: DeviceUtils.getScaledHeight(context, 1),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //header
                HeaderWithSearchBar(),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                  child: StatusBarWidget(
                    callback: (index) {
                      activeIndex.value = index;
                    },
                  ),
                ),

                Obx(() => activeIndex.value == 1
                    ? const MessageViewWidget()
                    : const CallViewWidget()),

                // ,
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: Obx(() => activeIndex.value == 1
            ? SizedBox(
                width: 45,
                height: 45,
                child: FittedBox(
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: AppColors.green,
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                ),
              )
            : const SizedBox()));
  }
}
