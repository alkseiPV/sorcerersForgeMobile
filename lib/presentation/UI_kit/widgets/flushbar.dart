// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';

///виджет, позволяющий делать попапы из любого места прлиожения
class Flushbar extends StatelessWidget {
  String title;

  Widget? leading;

  bool? isPayment;

  Color bg = AppColors.textfieldColor;
  Function()? ontap;

  Flushbar({required this.title, this.leading, super.key});

  Flushbar.success({super.key, required this.title, this.leading}) {
    leading ??= SvgPicture.asset(
      'assets/svg/sneckbarIcons/success.svg',
      color: Colors.green,
    );
  }

  Flushbar.error({super.key, required this.title, this.leading}) {
    leading ??= SvgPicture.asset(
      'assets/svg/sneckbarIcons/error.svg',
    );
  }
  Flushbar.warning({super.key, required this.title, this.leading}) {
    leading ??= SvgPicture.asset(
      'assets/svg/sneckbarIcons/warning.svg',
    );
  }

  bool widgets = false;
/*   Flushbar.discleimer(
      {Key? key, required this.title, this.leading, this.ontap, this.isPayment})
      : super(key: key) {
    bg = NewAppColors.bgMenuButton;
    widgets = true;
  }
 */
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(top: 600.h, right: 8, left: 8, bottom: 85.h),
      child: Material(
        color: Colors.transparent,
        child: Theme(
          data: Theme.of(context),
          child: Container(
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: widgets ? const EdgeInsets.all(16) : null,
              leading: leading,
              minLeadingWidth: 5,
              trailing: IconButton(
                  onPressed: () {
                    OverlaySupportEntry.of(context)?.dismiss(animate: false);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.activeColor,
                  )),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 3, style: AppText.title),
                  widgets && isPayment == null
                      ? const SizedBox(
                          height: 15,
                        )
                      : Container(),
                  widgets && isPayment == null
                      ? TextButton(
                          onPressed: () {
                            ontap!.call();
                            OverlaySupportEntry.of(context)
                                ?.dismiss(animate: false);
                          },
                          child: Text('отправить посылку',
                              style: AppText.buttonText))
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  OverlaySupportEntry show(
          [Duration duration = const Duration(seconds: 3),
          NotificationPosition notificationPosition =
              NotificationPosition.bottom]) =>
      showOverlayNotification((context) {
        return this;
      }, duration: duration, position: notificationPosition);
}
