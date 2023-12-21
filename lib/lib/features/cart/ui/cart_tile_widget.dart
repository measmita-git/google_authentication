
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/models/home_product_data_models.dart';
import '../../home/ui/home_bloc.dart';
import 'cart_bloc.dart';


class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productDataModel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(productDataModel.name),
          Text(productDataModel.category),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + productDataModel.price.toString()),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductWishListButtonClickedEvent(clickedProduct: productDataModel));

                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemovefromCartEvent(productDataModel: productDataModel));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Item remove from cart.')));
                      },
                      icon: const Icon(Icons.shopping_bag)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
