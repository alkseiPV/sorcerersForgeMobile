import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sourcerers_forge/domains/blocs/cart/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/cart/event.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/event.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';

class Catalogcard extends StatefulWidget {
  final ProductModel productModel;

  const Catalogcard({
    super.key,
    required this.productModel,
  });

  @override
  State<Catalogcard> createState() => _CatalogcardState();
}

class _CatalogcardState extends State<Catalogcard> {
  late ProductModel product;

  @override
  void initState() {
    product = widget.productModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.productModel.photo!.contains('png'))
              Stack(
                children: [
                  Image.network(
                    'http://95.165.64.208:6565${widget.productModel.photo}',
                    width: 175.w,
                    height: 140.h,
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          context.read<CatalogBloc>().add(AddtoFavoriteEvent(
                              idProduct: product.id!,
                              added: !product.isFavorite!));
                          ProductModel pr = widget.productModel
                              .copyWith(isFavorite: !product.isFavorite!);
                          context.read<HomeProvider>().updateProduct(pr);
                          product = widget.productModel
                              .copyWith(isFavorite: !product.isFavorite!);
                          setState(() {});
                        },
                        icon: Icon(
                            product.isFavorite!
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.activeColor),
                      ))
                ],
              )
            else
              Container(
                width: 175.w,
                height: 140.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: AppColors.activeColor),
              ),
            SizedBox(height: 10.h),
            Text(
              '${widget.productModel.price} руб',
              style: AppText.priceText,
            ),
            SizedBox(height: 10.h),
            Text(
              'В наличии: ${widget.productModel.quantity} шт.',
              style: AppText.infoText,
            ),
            SizedBox(height: 12.h),
            Text(
              widget.productModel.name!,
              style: AppText.heading,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.activeColor),
                SizedBox(width: 6.h),
                Text(
                  '${widget.productModel.reviews_mid}',
                  style: AppText.infoText,
                ),
                SizedBox(width: 6.h),
                SvgPicture.asset(
                  'assets/svg/comment.svg',
                  colorFilter: const ColorFilter.mode(
                      AppColors.textSecondary, BlendMode.color),
                ),
                SizedBox(width: 6.h),
                Text(
                  '${widget.productModel.reviews_count} отзывов',
                  style: AppText.infoText,
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
        Positioned(
            bottom: 0,
            child: CustomButton(
                ontap: () {
                  if (product.isCart!) {
                  } else {
                    locator<CartBloc>().add(AddToCartEvent(
                        productId: widget.productModel.id!, count: 1));
                    ProductModel pr =
                        widget.productModel.copyWith(isCart: true);
                    context.read<HomeProvider>().updateProduct(pr);
                    product = widget.productModel.copyWith(isCart: true);
                    setState(() {});
                  }
                },
                color: product.isCart! ? AppColors.textfieldColor : null,
                title: product.isCart! ? "Уже добавлено" : 'В корзину',
                width: 175))
      ],
    );
  }
}
