import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sourcerers_forge/domains/blocs/product_for_you/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/product_for_you/event.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class NavigationPanel extends StatelessWidget {
  // Constructor for NavigationPanel
  const NavigationPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: AppColors.background,
      // Define routes for bottom navigation
      routes: const [
        HomeRoute(),
        CatalogRoute(),
        BasketRoute(),
        ProfileRoute()
      ],
      // Build bottom navigation bar
      bottomNavigationBuilder: (_, tabsrRouter) {
        return BottomNavigationBar(
          backgroundColor: AppColors.background,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: AppColors.textPrimary,
          selectedItemColor: AppColors.activeColor,
          currentIndex: tabsrRouter.activeIndex,
          onTap: (index) {
            _resetStackToRoot(context, tabsrRouter, index);
//            tabsrRouter.setActiveIndex(index);
            if (index == 0) {
              context.read<ProductsForYouBloc>().add(LoadProductEvent());
            }
          },
          items: [
            BottomNavigationBarItem(
                // Build home icon
                icon: _buildIcon(
                  tabsrRouter.activeIndex == 0,
                  'assets/svg/home.svg',
                ),
                label: ''),
            BottomNavigationBarItem(
                // Build services icon
                icon: _buildIcon(
                  tabsrRouter.activeIndex == 1,
                  'assets/svg/list-search.svg',
                ),
                label: ''),
            BottomNavigationBarItem(
                // Build rooms icon
                icon: _buildIcon(
                  tabsrRouter.activeIndex == 2,
                  'assets/svg/basket.svg',
                ),
                label: ''),
            BottomNavigationBarItem(
                // Build orders icon
                icon: _buildIcon(
                  tabsrRouter.activeIndex == 3,
                  'assets/svg/profile.svg',
                ),
                label: ''),
          ],
        );
      },
    );
  }

  void _resetStackToRoot(
      BuildContext context, TabsRouter tabsRouter, int index) {
    // Установка активного индекса для переключения на нужную вкладку
    tabsRouter.setActiveIndex(index);

    // Получение активного стека роутера и сброс его до корневого маршрута
    tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
  }

  // Function to build colored icon
  Widget _buildIcon(bool isActive, String assetName) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isActive ? AppColors.activeColor : AppColors.textPrimary,
        BlendMode.srcIn,
      ),
      child: SvgPicture.asset(assetName),
    );
  }
}
