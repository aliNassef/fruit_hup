import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/cart/data/model/cart_model.dart';
import 'package:fruit_hup/features/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;
  // total button calculation

  int total = 0;
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
        (cartItems) {
          calcTotal(cartItems);
          emit(CartLoaded(cartItems: cartItems));
        },
        (failure) => emit(CartFailure(errMessage: failure.errMessage)),
      );
    });
  }

  calcTotal(List<CartModel> cartItems) {
    total = 0;
    for (var item in cartItems) {
      total += item.price.toInt() * item.quantity;
    }
  }

  increaseQuantity() {
    emit(IncreaseQuantitySucess());
  }

  decreaseQuantity() {
    emit(DecreaseQuantitySucess());
  }
  // remove product from cart

  Future<void> removeProductFromCart({required int index}) async {
    await cartRepo.removeProductFromCart(index: index);
    emit(RemoveProductFromCart());
  }
}
