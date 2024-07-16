part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

// cart loading
// cart loaded
// cart error
final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartModel> cartItems;

  CartLoaded({required this.cartItems});
}

final class CartFailure extends CartState {
  final String errMessage;

  CartFailure({required this.errMessage});
}

final class AddedProductToCart extends CartState {
  final int index;

  AddedProductToCart({required this.index});
}
