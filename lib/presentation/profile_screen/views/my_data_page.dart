import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';

@RoutePage()
class MyDataPage extends StatelessWidget {
  const MyDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Данные',
          style: AppText.heading,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Иванов Иван Иванович',
            style: AppText.heading,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Text(
                'Номер телефона:  ',
                style: AppText.priceText,
              ),
              Text(
                '+7999-999-99-99',
                style: AppText.heading,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Text(
                'дата регистрации:  ',
                style: AppText.priceText,
              ),
              Text(
                '12 декабря 2022',
                style: AppText.heading,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
