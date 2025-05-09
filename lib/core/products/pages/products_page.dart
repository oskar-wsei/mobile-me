import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/common/bloc/model_state.dart';
import 'package:mobile_me/core/products/bloc/product_bloc.dart';
import 'package:mobile_me/core/products/model/product_model.dart';
import 'package:mobile_me/core/products/widgets/product_item_widget.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';
import 'package:mobile_me/core/widgets/model_list_builder_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ModelState>(
          builder: (context, state) {
            return ModelListBuilderWidget<ProductModel, ProductBloc>(
              state: state,
              title: 'Products',
              icon: Icons.shopping_bag,
              itemBuilder: (context, model) {
                return ProductItemWidget(product: model);
              },
            );
          },
        ),
      ),
    );
  }
}
