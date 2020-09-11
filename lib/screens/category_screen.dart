import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loja2/data/product_data.dart';
import 'package:loja2/tiles/products_tile.dart';

class CaregoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CaregoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data['title']),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection('products')
                .document(snapshot.documentID)
                .collection('itens')
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GridView.builder(
                          padding: EdgeInsets.all(4.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.65,
                          ),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            ProductData data = ProductData.fromDoCument(
                                snapshot.data.documents[index]);
                            data.category = this.snapshot.documentID;
                            return ProductTile("grid", data);
                          }),
                      ListView.builder(
                        padding: EdgeInsets.all(4.0),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {

                          ProductData data = ProductData.fromDoCument(
                              snapshot.data.documents[index]);
                          data.category = this.snapshot.documentID;
                          return ProductTile(
                              "list",
                              data);
                        },
                      )
                    ]);
            }),
      ),
    );
  }
}
