import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/products/bloc/product_bloc.dart';
import 'package:mobile_me/core/products/bloc/product_event.dart';
import 'package:mobile_me/core/products/bloc/product_state.dart';
import 'package:mobile_me/core/products/widgets/product_item_widget.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';
import 'package:mobile_me/core/widgets/title_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is ProductLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ProductBloc>().add(ProductLoadEvent());
                },
                child: Column(
                  children: [
                    TitleWidget(title: 'Products', icon: Icons.shopping_bag),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return ProductItemWidget(
                              product: state.products[index],
                            );
                          },
                          separatorBuilder:
                              (context, index) => const SizedBox(height: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
