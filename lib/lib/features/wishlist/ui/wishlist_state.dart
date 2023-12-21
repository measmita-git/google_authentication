part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}
abstract class WishlistActionState extends WishlistState{}

class WishlistInitial extends WishlistState {}

class WishlistRemovedActionState extends WishlistActionState{}

class WishlistSuccessState extends WishlistState{
  List<ProductDataModel> wishlistItems;
  WishlistSuccessState({required this.wishlistItems});
}
