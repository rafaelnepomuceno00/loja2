import 'package:flutter/material.dart';
import 'package:loja2/tiles/drawer_tiles.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 170 , 170, 170), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0, 16.6, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        'Loja de \nCamisetas',
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá,',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Entre ou Cadastre-se >',
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, 'Início', pageController, 0),
              DrawerTile(Icons.list, 'Produtos', pageController, 1),
              DrawerTile(Icons.location_on, 'Lojas', pageController, 2),
              DrawerTile(Icons.playlist_add_check, 'Meus Pedidos', pageController, 3),
            ],
          ),
        ],
      ),
    );
  }
}
