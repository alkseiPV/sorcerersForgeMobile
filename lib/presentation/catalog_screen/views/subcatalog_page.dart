import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sourcerers_forge/domains/blocs/category_products/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/category_products/event.dart';
import 'package:sourcerers_forge/domains/blocs/category_products/state.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/catalog_card.dart';
import 'package:sourcerers_forge/presentation/catalog_screen/provider/catalog_provider.dart';

@RoutePage()
class SubCatalogPage extends StatelessWidget {
  final String catalogName;
  final int idCategory;
  const SubCatalogPage(
      {super.key, required this.catalogName, required this.idCategory});

  @override
  Widget build(BuildContext context) {
    final read = context.read<CatalogProvider>();
    context
        .read<CategoryProductsBloc>()
        .add(LoadProductsEvent(idCategory: idCategory));
    return Scaffold(
      appBar: AppBar(
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
            suffixIcon: Icon(
              Icons.search,
              color: AppColors.textPrimary,
            ), // Displays the trailing icon if provided.
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                catalogName,
                style: AppText.heading,
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocConsumer<CategoryProductsBloc, CategoryProductsStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadedCategoryProductsState) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                          maxCrossAxisExtent: 200,
                          childAspectRatio: (1 / 2)),
                      physics: NeverScrollableScrollPhysics(),
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
                  } else if (state is LoadingCategoryProductsState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ErrorCategoryProductsState) {
                    return Center(child: Text(state.error));
                  } else
                    return Center(
                      child: Text("Ошибка загрузки"),
                    );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
