import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/cart/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/cart/event.dart';
import 'package:sourcerers_forge/domains/blocs/cart/state.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/purchase_card.dart';
import 'package:sourcerers_forge/presentation/basket_screen/provider/basket_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

@RoutePage()
class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    final read = context.read<BasketProvider>();

    return VisibilityDetector(
      key: const Key('BasketScreen'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1.0) {
          context.read<CartBloc>().add(LoadCartEvent());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Корзина'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocConsumer<CartBloc, CartStates>(
                    builder: (context, state) {
                      if (state is LoadingCartState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 300.h,
                          child: Center(
                            heightFactor: MediaQuery.of(context).size.height,
                            child: const CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (state is LoadedCartState) {
                        if (state.products.isEmpty) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - 300.h,
                            child: Center(
                              heightFactor: MediaQuery.of(context).size.height,
                              child: Text(
                                "Корзина пока пуста",
                                style: AppText.heading,
                              ),
                            ),
                          );
                        } else {
                          return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => PurchaseCard(
                                    productId: state.products[index].product_id,
                                    id: state.products[index].id,
                                    count: state.products[index].count,
                                    price: state.products[index].price,
                                    title: state.products[index].product_name,
                                    imgURL: state.products[index].photo,
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 25.h,
                                  ),
                              itemCount: state.products.length);
                        }
                      }

                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 300.h,
                        child: Center(
                          child: Text(
                            "Корзина пока пуста",
                            style: AppText.heading,
                          ),
                        ),
                      );
                    },
                    listener: (context, state) => {
                          if (state is LoadedCartState)
                            read.products = state.products
                        }),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: 100.h,
          color: AppColors.textfieldColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.h),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Товаров: ',
                        style: AppText.infoText.copyWith(fontSize: 15.sp),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '${context.watch<BasketProvider>().totalCount} шт.',
                        style: AppText.heading,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        'Всего: ',
                        style: AppText.infoText.copyWith(fontSize: 15.sp),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '${context.watch<BasketProvider>().totalPrice} руб.',
                        style: AppText.heading,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                ontap: () {
                  context.read<CartBloc>().add(CreateOrderEvent());
                  Future.delayed(const Duration(seconds: 1), () {
                    setState(() {});
                  });
                },
                title: 'Заказать',
                width: 120,
                fs: 13,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
