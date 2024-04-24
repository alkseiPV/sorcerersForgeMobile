import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/product_for_you/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/product_for_you/event.dart';
import 'package:sourcerers_forge/domains/blocs/product_for_you/state.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/catalog_card.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeProvider>();
    context.read<ProductsForYouBloc>().add(LoadProductEvent());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.notifications_outlined),
          color: AppColors.textPrimary,
          onPressed: () {},
        ),
        title: TextField(
          maxLines: 1, // Sets the maximum number of lines.
          controller: read.searchController,

          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 15.w), // Padding inside the text field.
            filled: true, // Enables the fill color.
            fillColor: AppColors.textfieldColor,
            hintText: 'Поиск', // Placeholder text.
            hintStyle: AppText.infoText.copyWith(fontSize: 14.sp),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: const Icon(
              Icons.search,
              color: AppColors.textPrimary,
            ), // Displays the trailing icon if provided.
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Подобрано для вас',
              style: AppText.heading,
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<ProductsForYouBloc, ProductsForYouStates>(
                builder: (context, state) {
                  if (state is LoadingProductsForYouState) {
                    return const Center(
                      child: SingleChildScrollView(),
                    );
                  } else if (state is LoadedProductsForYouState) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                              maxCrossAxisExtent: 200,
                              childAspectRatio: (1 / 2)),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state
                          .products?.length, // Используем количество категорий
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final ProductModel product = state.products![index];
                        return SizedBox(
                          child: Catalogcard(
                            count: product.quantity,
                            countFeedBacks: product.reviews_count?.toInt(),
                            imgURL: product.photo,
                            price: product.price,
                            raiting: product.reviews_mid,
                            title: product.name,
                          ),
                        );
                      },
                    );
                  } else if (state is ErrorProductsForYouState) {
                    return Center(child: Text(state.error));
                  } else
                    return Center(
                      child: Text("Ошибка загрузки"),
                    );
                },
                listener: (context, state) {})
          ]),
        ),
      ),
    );
  }
}
