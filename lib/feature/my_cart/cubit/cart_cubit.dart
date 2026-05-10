import 'package:eqraa_book_store/feature/my_cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  List<CartItemModel> cartItems = []; // تبدأ فاضية

  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addToCart(CartItemModel newItem) {
    int index = cartItems.indexWhere((item) => item.title == newItem.title);
    if (index != -1) {
      // لو الكتاب موجود فعلاً زود الكمية
      cartItems[index].quantity++;
    } else {
      // لو مش موجود ضيفه جديد
      cartItems.add(newItem);
    }
    emit(CartUpdatedState(items: List.from(cartItems), total: totalAmount));
  }

  void incrementQuantity(String id) {
    int index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      cartItems[index].quantity++;
      emit(CartUpdatedState(items: List.from(cartItems), total: totalAmount));
    }
  }

  void decrementQuantity(String id) {
    int index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      emit(CartUpdatedState(items: List.from(cartItems), total: totalAmount));
    }
  }

  void removeItem(String id) {
    cartItems.removeWhere((item) => item.id == id);
    emit(CartUpdatedState(items: List.from(cartItems), total: totalAmount));
  }
}
