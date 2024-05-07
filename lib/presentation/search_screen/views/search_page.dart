import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/models/product_model.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/catalog_card.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/info_card_widget.dart';
import 'package:sourcerers_forge/presentation/search_screen/provider/search_page_provider.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<SearchPageProvider>().searchFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    final searchProvider = locator<SearchPageProvider>();
    searchProvider.filteredProducts.clear();
    searchProvider.searchController.clear();
    searchProvider.searchFocusNode.unfocus();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<SearchPageProvider>();
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            focusNode: read.searchFocusNode,
            maxLines: 1, // Sets the maximum number of lines.
            controller: read.searchController,
            onChanged: (val) {
              read.filterFunc(val);
            },
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
          padding: EdgeInsets.all(20.sp),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                maxCrossAxisExtent: 200,
                childAspectRatio: (1 / 2)),

            itemCount: context
                .watch<SearchPageProvider>()
                .filteredProducts
                .length, // Используем количество категорий
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final ProductModel product = read.filteredProducts[index];
              return SizedBox(
                  child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              InfoCardWidget(model: product))).then((value) {
                    setState(() {});
                  });
                },
                child: Catalogcard(
                  productModel: product,
                ),
              ));
            },
          ),
        ));
  }
}
