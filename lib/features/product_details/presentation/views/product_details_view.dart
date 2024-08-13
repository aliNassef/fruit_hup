import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service_locator.dart';
import '../../../cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import '../../../home/data/models/product_model.dart';

import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.instanceOfProduct, required this.index});
  final ProductModel instanceOfProduct;

  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: getIt<CartCubit>(),
          child: ProductDetailsViewBody(
            instanceOfProduct: instanceOfProduct, index: index,
          ),
        ),
      ),
    );
  }
}
