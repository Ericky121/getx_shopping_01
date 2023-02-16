import 'package:get/get.dart';
import 'package:getx_shopping_01/model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    var productData = [
      Product(
        id: 1,
        price: 30,
        productDescription: 'some description about product',
        productName: 'Mouse'
      ),
      Product(
          id: 2,
          price: 30,
          productDescription: 'some description about product',
          productName: 'Keyboard'
      ),
      Product(
          id: 3,
          price: 30,
          productDescription: 'some description about product',
          productName: 'Monitor'
      ),
      Product(
          id: 4,
          price: 30,
          productDescription: 'some description about product',
          productName: 'RAM'
      ),
      Product(
          id: 5,
          price: 30,
          productDescription: 'some description about product',
          productName: 'CPU'
      )
    ];

    products.assignAll(productData);
  }
}