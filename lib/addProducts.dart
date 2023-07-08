import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/CustomField.dart';
import 'package:testapp/allProducts.dart';
import 'package:testapp/genWidgets.dart';
import 'package:testapp/productModel.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var name = newTextField(
    controller: TextEditingController(),
    labelText: "name",
  );

  var category = newTextField(
    controller: TextEditingController(),
    labelText: "category",
  );

  var desc = newTextField(
    controller: TextEditingController(),
    labelText: "description",
  );

  var price = newTextField(
    controller: TextEditingController(),
    labelText: "price",
  );

  @override
  void dispose() {
    name.controller.clear();
    category.controller.clear();
    desc.controller.clear();
    price.controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            name,
            SizedBox(height: height * 0.02),
            category,
            SizedBox(height: height * 0.02),
            desc,
            SizedBox(height: height * 0.02),
            price,
            SizedBox(height: height * 0.02),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  await addProduct(context);
                },
                child: Text(
                  "Add Product",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        label: Text(
          "show Products",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Products()));
        }),
      ),
    );
  }

  Future addProduct(BuildContext ctx) async {
    final prodUser = FirebaseFirestore.instance.collection("products").doc();
    Product item = Product(
        product: ProductClass(
            id: prodUser.id,
            name: name.controller.text,
            category: category.controller.text,
            description: desc.controller.text,
            price: price.controller.text));
    AppAlerts.showLoadingProgressIndicator(ctx);
    await prodUser.set(item.product.toJson());
    AppAlerts.pop(ctx);
    AppAlerts.showSnackBar(context: context, content: "Product Added");
    name.controller.clear();
    category.controller.clear();
    desc.controller.clear();
    price.controller.clear();
  }
}
