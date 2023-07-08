import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/CustomField.dart';
import 'package:testapp/genWidgets.dart';
import 'package:testapp/productModel.dart';

class EditProduct extends StatefulWidget {
  EditProduct({super.key, required this.product});

  ProductClass product;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
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
  void initState() {
    name.controller.text = widget.product.name;
    category.controller.text = widget.product.category;
    desc.controller.text = widget.product.description;
    price.controller.text = widget.product.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
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
                  await editProduct(widget.product.id, context);
                },
                child: Text(
                  "Edit Product",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  editProduct(String id, BuildContext ctx) async {
    final prodUser = FirebaseFirestore.instance.collection("products").doc(id);
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
    AppAlerts.pop(ctx);
    name.controller.clear();
    category.controller.clear();
    desc.controller.clear();
    price.controller.clear();
    AppAlerts.showSnackBar(
        context: context, content: "Product Edited Successfully");
  }
}
