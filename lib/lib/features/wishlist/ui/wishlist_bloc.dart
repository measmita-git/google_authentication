import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/wishlist_items.dart';
import '../../home/models/home_product_data_models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>((wishlistInitialEvent));
    on<WishlistRemoveEvent>((wishlistRemoveEvent));
  }
}

FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit){
  emit(WishlistSuccessState(wishlistItems: wishlistItems));
}

FutureOr<void> wishlistRemoveEvent(WishlistRemoveEvent event, Emitter<WishlistState> emit){
  wishlistItems.remove(event.productDataModel);
  emit(WishlistSuccessState(wishlistItems: wishlistItems));
  emit(WishlistRemovedActionState());
}


