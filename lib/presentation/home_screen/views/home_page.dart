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
import 'package:sourcerers_forge/presentation/UI_kit/widgets/info_card_widget.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';
import 'package:sourcerers_forge/presentation/home_screen/views/favorite_page.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';
import 'package:visibility_detector/visibility_detector.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ProductsForYouBloc>().add(LoadProductEvent());
    super.initState();
  }

  late List<ProductModel> actualProducts;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('HomeScreen'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1.0) {}
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.favorite),
              color: AppColors.textPrimary,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoritePage()));
              },
            ),
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
                      style: AppText.infoText.copyWith(
                          fontSize: 14.sp, color: AppColors.textPrimary),
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
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadedProductsForYouState) {
                  actualProducts = context
                      .read<HomeProvider>()
                      .getActualList(state.products!);
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                            maxCrossAxisExtent: 300,
                            childAspectRatio: (1 / 2.15)),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state
                        .products?.length, // Используем количество категорий
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final ProductModel product = actualProducts[index];
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
                } else if (state is ErrorProductsForYouState) {
                  return Center(child: Text(state.error));
                } else
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
              }, listener: (context, state) {
                if (state is LoadedProductsForYouState) {
                  context.read<HomeProvider>().allProducts =
                      List.from(state.defoltProducts);
                }
              })
            ]),
          ),
        ),
      ),
    );
  }
}
