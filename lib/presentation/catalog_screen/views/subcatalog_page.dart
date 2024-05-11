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
import 'package:sourcerers_forge/presentation/UI_kit/widgets/info_card_widget.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class SubCatalogPage extends StatefulWidget {
  final String catalogName;
  final int idCategory;
  const SubCatalogPage(
      {super.key, required this.catalogName, required this.idCategory});

  @override
  State<SubCatalogPage> createState() => _SubCatalogPageState();
}

class _SubCatalogPageState extends State<SubCatalogPage> {
  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<CategoryProductsBloc>()
        .add(LoadProductsEvent(idCategory: widget.idCategory));
    return Scaffold(
      appBar: AppBar(
          title: ElevatedButton(
        onPressed: () {
          AutoRouter.of(context).push(SearchRoute());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.textfieldColor,
          padding: EdgeInsets.only(left: 15.w, right: 10.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.sp),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Поиск',
                style: AppText.infoText
                    .copyWith(fontSize: 14.sp, color: AppColors.textPrimary),
              ),
            ),
            Icon(
              Icons.search,
              color: AppColors.textPrimary,
            ),
          ],
        ),
      )),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.catalogName,
                style: AppText.heading,
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocConsumer<CategoryProductsBloc, CategoryProductsStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadedCategoryProductsState) {
                    List<ProductModel> actualProducts = context
                        .read<HomeProvider>()
                        .getActualList(state.products!);
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
                        final ProductModel product = actualProducts[index];
                        print(product.isCart);
                        return SizedBox(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InfoCardWidget(model: product)))
                                .then((value) {
                              setState(() {});
                            });
                          },
                          child: Catalogcard(
                            productModel: product,
                          ),
                        ));
                      },
                    );
                  } else if (state is LoadingCategoryProductsState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ErrorCategoryProductsState) {
                    return Center(child: Text(state.error));
                  } else
                    return const Center(
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
