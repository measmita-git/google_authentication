import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/cart_items.dart';
import '../../home/models/home_product_data_models.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>((cartInitialEvent));
    on<CartRemovefromCartEvent>((cartRemovefromCartEvent));
  }
}

FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit){
  emit(CartSuccessState(cartItems: cartItems));
  emit(CartRemovedActionState());
  
}

FutureOr<void> cartRemovefromCartEvent(CartRemovefromCartEvent event, Emitter<CartState> emit){
  
  cartItems.remove(event.productDataModel);
  emit(CartSuccessState(cartItems: cartItems));

}

