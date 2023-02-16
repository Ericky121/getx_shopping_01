import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_01/controller/shopping_controller.dart';

import '../controller/cart_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final ShoppingController controller = Get.put(ShoppingController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(12),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller.products[index].productName,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                    Text(
                                      controller.products[index].productDescription,
                                    )
                                  ],
                                ),
                                Text(
                                    '\$${controller.products[index].price}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController.addToItem(controller.products[index]);
                              },
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )
                              ),
                            )
                          ],
                        )
                      ),
                    );
                  }
                );
              }
            ),
          ),
          SizedBox(height: 30,),
          GetX<CartController>(
            builder: (controller) {
              return Text(
                'Total amount \$ ${controller.totalPrice}',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                )
              );
            }
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              '${controller.count}',
              style: TextStyle(
                fontSize: 20
              )
            );
          }
        ),
        icon: Icon(Icons.add_shopping_cart),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
