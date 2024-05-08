// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/usecases/profile_usecases.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_textfield.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/flushbar.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class SendCommentPage extends StatefulWidget {
  final ProductModel model;

  SendCommentPage({super.key, required this.model});

  @override
  State<SendCommentPage> createState() => _SendCommentPageState();
}

class _SendCommentPageState extends State<SendCommentPage> {
  final TextEditingController controller = TextEditingController();

  int stars = 0;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Оставить отзыв",
            style: AppText.heading,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'http://95.165.64.208:6565${widget.model.photo}',
                  width: 200.w,
                  height: 200.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < stars
                            ? Icons.star
                            : Icons
                                .star_border, // Заполненная или пустая звезда
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          stars = index + 1; // Установка рейтинга
                        });
                      },
                    );
                  }),
                ),
                Text(
                  'Отзыв:',
                  style: AppText.heading,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  maxlines: 4,
                  controller: controller,
                  hintText: 'Ваш отзыв',
                  validator: (val) {
                    if (val!.length < 4 || val.isEmpty) {
                      return 'Отзыв слишком короткий!';
                    } else {
                      return null;
                    }
                  },
                )
              ],
            ),
          ),
        ),
        bottomSheet: Container(
            color: AppColors.background,
            height: 120.h,
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                child: CustomButton(
                  ontap: () async {
                    if (stars == 0) {
                      Flushbar.warning(title: 'Вы не поставили оценку!');
                      return;
                    }
                    if (_formkey.currentState!.validate()) {
                      bool ans = await locator<ProfileUseCases>().sendComment(
                          stars, controller.text, widget.model.id!);
                      if (ans) {
                        AutoRouter.of(context).replace(NavigationPanel());
                      }
                    }
                  },
                  title: 'Оставить отзыв',
                  width: 175,
                ))),
      ),
    );
  }
}
