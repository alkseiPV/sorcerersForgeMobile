// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/cart/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/cart/event.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/event.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/state.dart';
import 'package:sourcerers_forge/domains/usecases/catalog_usecases.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/starr_widget.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';

class InfoCardWidget extends StatefulWidget {
  ProductModel model;
  InfoCardWidget({super.key, required this.model});

  @override
  State<InfoCardWidget> createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {
  CatalogBloc bloc = CatalogBloc(locator<CatalogUseCases>());

  @override
  void initState() {
    bloc.add(LoadReviewsEvent(idProduct: widget.model.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.model.name!,
          style: AppText.heading,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Image.network(
                'http://95.165.64.208:6565${widget.model.photo}',
                width: 300.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              StarDisplay(
                value: widget.model.reviews_mid!,
                count: widget.model.reviews_count?.toInt() ?? 0,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    border: Border.all(color: AppColors.activeColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.model.description!,
                    style: AppText.title,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              BlocConsumer<CatalogBloc, CatalogStates>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is LoadingCatalogState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is LoadedReviewState) {
                      return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.textfieldColor),
                                    borderRadius: BorderRadius.circular(10.sp)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        StarDisplay(
                                          value: state.reviews[index].stars
                                              .toDouble(),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          state.reviews[index].message,
                                          style: AppText.infoText,
                                        )
                                      ]),
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                          itemCount: state.reviews.length);
                    }
                    if (state is InitialCatalogState) {
                      return const SizedBox.shrink();
                    }
                    return const CircularProgressIndicator();
                  },
                  listener: (context, state) {}),
              SizedBox(
                height: 80.h,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 70,
        color: AppColors.background,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: CustomButton(
              ontap: () {
                if (widget.model.isCart!) {
                } else {
                  widget.model = widget.model.copyWith(isCart: true);
                  locator<CartBloc>().add(
                      AddToCartEvent(productId: widget.model.id!, count: 1));
                }
                context.read<HomeProvider>().updateProduct(widget.model);

                setState(() {});
              },
              color: widget.model.isCart! ? AppColors.textfieldColor : null,
              title: widget.model.isCart! ? "Уже добавлено" : 'В корзину',
              width: 350.w),
        ),
      ),
    );
  }
}
