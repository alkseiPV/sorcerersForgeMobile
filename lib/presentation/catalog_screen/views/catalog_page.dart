import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/event.dart';
import 'package:sourcerers_forge/domains/blocs/catalogs/state.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/catalog_screen/provider/catalog_provider.dart';
import 'package:sourcerers_forge/presentation/home_screen/views/favorite_page.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<CatalogProvider>();
    context.read<CatalogBloc>().add(LoadCatalogEvent());
    return Scaffold(
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
          child: Column(children: [
            Text(
              'Категории:',
              style: AppText.heading,
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocConsumer<CatalogBloc, CatalogStates>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadingCatalogState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedCatalogState) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      maxCrossAxisExtent: 200,
                      childAspectRatio: (3 / 1),
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.categories!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SizedBox(
                      child: CustomButton(
                        ontap: () {
                          AutoRouter.of(context).push(
                            SubCatalogRoute(
                                idCategory: state.categories![index].id!,
                                catalogName:
                                    state.categories![index].name ?? 'pam pam'),
                          );
                        },
                        width: 150,
                        title: state.categories![index].name ?? '',
                      ),
                    ),
                  );
                } else if (state is ErrorCatalogState) {
                  return Text('Ошибка: ${state.error}');
                }
                return const Text('Нет данных');
              },
            )
          ]),
        ),
      ),
    );
  }
}
