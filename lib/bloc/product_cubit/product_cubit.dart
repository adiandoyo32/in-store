import 'package:bloc/bloc.dart';
import 'package:in_store_flutter/api_services/api_services.dart';
import 'package:in_store_flutter/models/models.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> getProducts() async {
    try {
      emit(ProductLoading());
      final products = await ProductApiService().getProducts();
      emit(ProductLoaded(products));
    } catch (error) {
      emit(ProductError(error.toString()));
    }
  }
}
