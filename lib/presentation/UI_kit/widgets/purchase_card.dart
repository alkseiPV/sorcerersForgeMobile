import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/cart/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/cart/event.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/basket_screen/provider/basket_provider.dart';

class PurchaseCard extends StatefulWidget {
  final String title;
  final double price;
  final int count;
  final String? imgURL;
  final int id;
  final int productId;
  const PurchaseCard(
      {super.key,
      required this.count,
      required this.price,
      required this.title,
      required this.id,
      required this.productId,
      this.imgURL});

  @override
  State<PurchaseCard> createState() => _PurchaseCardState();
}

class _PurchaseCardState extends State<PurchaseCard> {
  int a = 0;
  int b = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        if (widget.imgURL!.contains('png'))
          Image.network(
            'http://95.165.64.208:6565${widget.imgURL}',
            width: 100.w,
            height: 100.h,
          ),
        if (!widget.imgURL!.contains('png'))
          Container(
            height: 100,
            width: 100,
            color: AppColors.activeColor,
          ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: AppText.title,
            ),
            const Spacer(),
            Text(
              '${widget.price} руб.',
              style: AppText.infoText.copyWith(fontSize: 14.sp),
            )
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      context
                          .read<BasketProvider>()
                          .updateCount(false, widget.id);
                      if (a == 0) {
                        Future.delayed(const Duration(seconds: 2), () {
                          context.read<CartBloc>().add(DeleterFromCartEvent(
                              productId: widget.productId));

                          context.read<CartBloc>().add(AddToCartEvent(
                              productId: widget.productId,
                              count: context
                                  .read<BasketProvider>()
                                  .products
                                  .firstWhere(
                                      (element) => element.id == widget.id)
                                  .count));

                          a = 0;
                        });
                      }
                      setState(() {
                        a += 1;
                      });
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: AppColors.textPrimary,
                    )),
                Text(
                  '${context.watch<BasketProvider>().products.firstWhere((element) => element.id == widget.id).count}',
                  style: AppText.infoText.copyWith(fontSize: 15),
                ),
                IconButton(
                    onPressed: () {
                      context
                          .read<BasketProvider>()
                          .updateCount(true, widget.id);
                      if (a == 0) {
                        Future.delayed(const Duration(seconds: 2), () {
                          context.read<CartBloc>().add(DeleterFromCartEvent(
                              productId: widget.productId));

                          context.read<CartBloc>().add(AddToCartEvent(
                              productId: widget.productId,
                              count: context
                                  .read<BasketProvider>()
                                  .products
                                  .firstWhere(
                                      (element) => element.id == widget.id)
                                  .count));
                          a = 0;
                        });
                      }
                      setState(() {
                        a += 1;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.textPrimary,
                    )),
              ],
            ),
            const Spacer(),
            CustomButton(
              ontap: () {
                context
                    .read<CartBloc>()
                    .add(DeleterFromCartEvent(productId: widget.productId));

                context.read<BasketProvider>().deleteProduct(widget.id);
              },
              title: 'удалить',
              width: 100,
              fs: 12,
            ),
          ],
        )
      ]),
    );
  }
}
