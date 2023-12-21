
import 'package:bloc_demo_app/lib/features/wishlist/ui/wishlist_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/models/home_product_data_models.dart';
import '../../home/ui/home_bloc.dart';



class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;

  const  WishlistTileWidget({super.key, required this.productDataModel, required this.wishlistBloc});

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
                     wishlistBloc.add(WishlistRemoveEvent(productDataModel: productDataModel));
                     ScaffoldMessenger.of(context)
                         .showSnackBar(SnackBar(content: Text('Item remove from wishlist.')));

                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
