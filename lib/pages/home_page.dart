import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/components/grocery_item_tile.dart';
import 'package:grocery_shop/model/cart_model.dart';
import 'package:grocery_shop/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CartPage();
        })),
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 4,
          ),
          // good morning
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Good mornning",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),

          // order fresh food
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Lets Order fresh item for you",
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          // divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 34),
            child: Divider(),
          ),

          // fresh item+ grid
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Fresh items",
              style: TextStyle(
                fontSize: 26,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Consumer<CartModel>(
              builder: (contex, vaule, child) {
                return GridView.builder(
                  itemCount: vaule.shopItems.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (contex, index) {
                    return GroceryItemTile(
                      itemName: vaule.shopItems[index][0],
                      itemPrice: vaule.shopItems[index][1],
                      imagePath: vaule.shopItems[index][2],
                      color: vaule.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
