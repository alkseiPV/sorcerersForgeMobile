import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/models/order_model.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/profile_screen/provider/profile_provider.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class OrderInfoPage extends StatelessWidget {
  final OrderModel order;
  const OrderInfoPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ProfileProvider>();
    List<ProductModel> models =
        read.returnModels(order.products.map((e) => e.product_id).toList());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Заказ №${order.id}",
          style: AppText.heading,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: ListView.separated(
            itemBuilder: ((context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${models[index].name}',
                      style: AppText.title,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.network(
                          'http://95.165.64.208:6565${models[index].photo}',
                          width: 150.w,
                          height: 150.h,
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Цена: ${models[index].price} руб.',
                              style: AppText.infoText,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Количество: ${order.products[index].count}',
                              style: AppText.infoText,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                        ontap: () {
                          AutoRouter.of(context)
                              .push(SendCommentRoute(model: models[index]));
                        },
                        title: 'Оставить Отзыв',
                        width: MediaQuery.of(context).size.width)
                  ],
                )),
            separatorBuilder: (context, indx) => SizedBox(
                  height: 10.h,
                ),
            itemCount: models.length),
      ),
    );
  }
}
