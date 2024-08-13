part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class bottomSheetIntial extends ProductState {}

final class bottomSheetFilter extends ProductState {}

final class chooseSortByDone extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  ProductLoaded({required this.products});
}

final class ProductFailure extends ProductState {
  final String errMessage;

  ProductFailure({required this.errMessage});
}
final class ProductFiltering extends ProductState {}