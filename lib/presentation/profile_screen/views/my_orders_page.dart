import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/orders/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/orders/event.dart';
import 'package:sourcerers_forge/domains/blocs/orders/state.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/profile_screen/provider/profile_provider.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  void initState() {
    context.read<OrdersBloc>().add(GetAllOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Мои заказы",
          style: AppText.heading,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<OrdersBloc, OrdersStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingOrdersState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: EdgeInsets.all(20.sp),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView.separated(
                  itemCount:
                      state is LoadedOrdersState ? state.orders.length : 0,
                  itemBuilder: (context, index) {
                    if (state is LoadedOrdersState) {
                      List<String> imgs = read.returbImginOrder(state
                          .orders[index].products
                          .map((e) => e.product_id)
                          .toList());
                      return InkWell(
                        onTap: () {
                          AutoRouter.of(context)
                              .push(OrderInfoRoute(order: state.orders[index]));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Заказ №${state.orders[index].id}',
                              style: AppText.title,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 110.h,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Image.network(
                                      'http://95.165.64.208:6565${imgs[index]}',
                                      width: 100.w,
                                      height: 100.h,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 10.w,
                                    );
                                  },
                                  itemCount: imgs.length),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Стоимость: ${state.orders[index].summ} руб.',
                              style: AppText.infoText,
                            )
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 25.h,
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}
