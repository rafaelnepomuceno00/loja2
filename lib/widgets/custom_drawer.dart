import 'package:flutter/material.dart';
import 'package:loja2/models/user_model.dart';
import 'package:loja2/screens/login_screen.dart';
import 'package:loja2/tiles/drawer_tiles.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatefulWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 170, 170, 170), Colors.white],
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
                        child: ScopedModelDescendant<UserModel>(
                            builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Olá, ${!model.isLoggedIn() ? '' : model.userData['name']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  !model.isLoggedIn()
                                      ? 'Entre ou Cadastre-se >'
                                      : 'Sair',
                                  style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onTap: () {
                                  if (!model.isLoggedIn()) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    );
                                  } else
                                    model.signOut();
                                },
                              )
                            ],
                          );
                        })),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, 'Início', widget.pageController, 0),
              DrawerTile(Icons.list, 'Produtos', widget.pageController, 1),
              DrawerTile(Icons.location_on, 'Lojas', widget.pageController, 2),
              DrawerTile(Icons.playlist_add_check, 'Meus Pedidos',
                  widget.pageController, 3),
            ],
          ),
        ],
      ),
    );
  }
}
