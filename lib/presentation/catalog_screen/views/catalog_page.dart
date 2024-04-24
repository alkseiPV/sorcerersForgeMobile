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
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      maxCrossAxisExtent: 200,
                      childAspectRatio: (3 / 1),
                    ),
                    physics: NeverScrollableScrollPhysics(),
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
