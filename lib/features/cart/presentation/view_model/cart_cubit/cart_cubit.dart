import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/cart/data/model/cart_model.dart';
import 'package:fruit_hup/features/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;
  // add product to cart
  addProductToCart({
    required int index,
    required int quantity,
    required String img,
    required num price,
    required String name,
    required String measure,
  }) async {
    cartRepo.addProductToCart(
      img: img,
      name: name,
      price: price,
      quantity: quantity,
      measure: measure,
    );
    emit(AddedProductToCart(index: index));
  }

  void getCartItems() {
    emit(CartLoading());
    cartRepo.getCartitems().listen((event) {
      event.fold(
        (cartItems) => emit(CartLoaded(cartItems: cartItems)),
        (failure) => emit(CartFailure(errMessage: failure.errMessage)),
      );
    });
  }

  // remove product from cart
  // increase quantity
  // decrease quantity
}
