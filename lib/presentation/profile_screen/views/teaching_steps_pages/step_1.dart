import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';

class Step1Teach extends StatelessWidget {
  const Step1Teach({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.activeColor)),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    children: [
                      Text(
                        'Этап 1: Введение и безопасность',
                        style: AppText.heading,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: 330.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColors.activeColor),
                              ),
                            ),
                            SizedBox(
                              width: 310.w,
                              child: Text(
                                ' Ученик будет представлен своему инструктору, который будет проводить его через все этапы обучения.',
                                style:
                                    AppText.infoText.copyWith(fontSize: 14.sp),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 330.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColors.activeColor),
                              ),
                            ),
                            SizedBox(
                              width: 310.w,
                              child: Text(
                                ' Освоение основных правил безопасности в кузнице, включая работу с огнем, режущими инструментами и оборудованием.',
                                style:
                                    AppText.infoText.copyWith(fontSize: 14.sp),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 10,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index == 0 ? AppColors.activeColor : null,
                        border: index == 0
                            ? null
                            : Border.all(color: AppColors.activeColor),
                      ))),
            )
          ]),
    );
  }
}
