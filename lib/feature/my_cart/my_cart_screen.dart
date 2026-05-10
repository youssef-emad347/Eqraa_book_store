import 'package:eqraa_book_store/core/widgets/book_card.dart';
import 'package:eqraa_book_store/core/widgets/main_button.dart';
import 'package:eqraa_book_store/core/widgets/separate_text.dart';
import 'package:eqraa_book_store/feature/my_cart/cubit/cart_cubit.dart';
import 'package:eqraa_book_store/feature/my_cart/cubit/cart_states.dart';
import 'package:eqraa_book_store/feature/my_cart/widget/cart_item_widget.dart';
import 'package:eqraa_book_store/feature/my_cart/widget/order_summary_widget.dart';
import 'package:eqraa_book_store/feature/my_cart/widget/promo_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          var items = cubit.cartItems;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (items.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      var item = items[index];
                      return CartItemWidget(
                        id: item.id,
                        title: item.title,
                        author: item.author,
                        imageUrl: item.imageUrl,
                        price: item.price,
                        quantity: item.quantity,
                      );
                    },
                  )
                else
                  SizedBox(
                    height: screenHeight * 0.2,
                    child: const Center(
                      child: Text("Your cart is empty"),
                    ),
                  ),
                
                const SizedBox(height: 20),
                
                // Similar Books Section directly here
                const SeparateTextCustomWidget(
                  text1: "Similar Books",
                  text2: "See All",
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: screenHeight * 0.3,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) => const SizedBox(width: 15),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: screenWidth * 0.4,
                        child: const BookCard(
                          title: "The Morac Book 1",
                          author: "Adam Smith",
                          imageUrl: "https://covers.openlibrary.org/b/id/14627227-L.jpg",
                          price: 60.00,
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 25),
                const PromoCodeWidget(),
                const SizedBox(height: 25),
                OrderSummaryWidget(
                  itemTotal: cubit.totalAmount,
                  discount: items.isNotEmpty ? 15.00 : 0.00,
                  grandTotal: items.isNotEmpty ? cubit.totalAmount - 15.00 : 0.00,
                ),
                const SizedBox(height: 30),
                MainButton(
                  title: "Proceed to Checkout",
                  isEnabled: items.isNotEmpty,
                  onPressedFunction: () {},
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
