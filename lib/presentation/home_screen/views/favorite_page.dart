import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/favorite/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/favorite/event.dart';
import 'package:sourcerers_forge/domains/blocs/favorite/state.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/catalog_card.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/info_card_widget.dart';
import 'package:sourcerers_forge/presentation/home_screen/provider/home_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: const Key('FavoriteScreen'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction == 1.0) {
            context.read<FavoriteBloc>().add(LoadFavoriteEvent());
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.all(15.sp),
            child: SingleChildScrollView(
              child: BlocConsumer<FavoriteBloc, FavoritesStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadingFavoriteState) {
                    return const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
                  }

                  if (state is LoadedFavoriteState) {
                    List<ProductModel> product = state.productsIds
                        .map((e) => ProductModel(id: e))
                        .toList();
                    List<ProductModel> actualProducts =
                        context.read<HomeProvider>().getActualList(product);

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                              maxCrossAxisExtent: 200,
                              childAspectRatio: (1 / 2)),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.productsIds
                          .length, // Используем количество категорий
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
                  }

                  return const Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
