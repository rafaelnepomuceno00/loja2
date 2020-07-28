import 'package:flutter/material.dart';
import 'package:loja2/tabs/home_tab.dart';
import 'package:loja2/tabs/products_tab.dart';
import 'package:loja2/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            body: HomeTab(),
            drawer: CustomDrawer(_pageController),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text('Produtos'),
              centerTitle: true,

            ),
            drawer: CustomDrawer(_pageController),

            body: ProductsTab(),

          ),
          Scaffold(
            appBar: AppBar(
              title: Text('asda'),
            ),
            body: Container(
              color: Colors.red,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text('asda'),
            ),
            body: Container(
              color: Colors.red,
            ),
          ),
        ]);
  }
}
