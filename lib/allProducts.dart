import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapp/editProduct.dart';
import 'package:testapp/genWidgets.dart';

import 'package:testapp/productModel.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        child: StreamBuilder(
            stream: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: height * 0.03,
                              child: Text(snapshot.data![index].price)),
                          title: Text(snapshot.data![index].name),
                          subtitle: Text(snapshot.data![index].description),
                          trailing: Container(
                            width: width * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => EditProduct(
                                                  product:
                                                      snapshot.data![index])));
                                    }),
                                    child: Icon(Icons.edit)),
                                InkWell(
                                    onTap: (() {
                                      deleteProduct(snapshot.data![index].id);
                                    }),
                                    child: Icon(Icons.delete)),
                              ],
                            ),
                          ));
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  Stream<List<ProductClass>>? getProducts() {
    final productData = FirebaseFirestore.instance
        .collection("products")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ProductClass.fromJson(doc.data()))
            .toList());

    return productData;
  }

  void deleteProduct(String id) async {
    final prodUser = FirebaseFirestore.instance.collection("products").doc(id);
    prodUser.delete();
  }
}
