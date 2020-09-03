import 'package:flutter/material.dart';
import 'package:loja2/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Criar Conta'),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Nome Completo'),
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty) return 'Digite um nome';
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'E-mail'),
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty || !text.contains('@'))
                      return 'E-mail Inválido';
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(hintText: 'Senha'),
                  obscureText: true,
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty || text.length < 6)
                      return 'Senha Inválido';
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(hintText: 'Endereço'),
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty) return 'Insira um Endereço';
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    child: Text(
                      'Criar Conta ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Map<String, dynamic> userData = {
                          'name': _nameController.text,
                          'email': _emailController.text,
                          'address': _addressController.text
                        };
                        model.signUp(
                            userData: userData,
                            pass: _passController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
          content: Text('Usuário criado com sucesso!'),
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).primaryColor),
    );
    Future.delayed(Duration (seconds:  2)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
          content: Text('Falha ao criar usuário!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red),
    );
    Future.delayed(Duration (seconds:  2)).then((_){
      Navigator.of(context).pop();
    });
  }
}
