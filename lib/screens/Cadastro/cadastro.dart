//import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:conexaounb/screens/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:tinder_dev/bloc/userBloc.dart';
//import 'package:tinder_dev/model/user.dart';
import 'dart:convert';


class Cadastro extends StatefulWidget {
  Cadastro({Key key}) : super(key: key);
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  //final UserBloc bloc = BlocProvider.getBloc<UserBloc>();

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmasenhaController = TextEditingController();
  final cargoController = TextEditingController();
  final buttonController = TextEditingController();
  final _nomeKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _senhaKey = GlobalKey<FormState>();
  final _confirmasenhaKey = GlobalKey<FormState>();
  final _cargoKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            
            SizedBox(height: 90,),
            Container( // Container do Cadastro
              width: 90.0,
              height: 30,
              child: Text(
                  'Cadastro',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container( //Nome
              width: 308.0,
              height: 60.0,
              child: Card(
                elevation: 3,
                child: Form(
                  key: _nomeKey,
                  child: TextFormField(
                    autofocus: false,
                    controller: nomeController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Informe um nome';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets
                        .symmetric(vertical: 15.0, horizontal: 15),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            
            Container( //Email
            width: 308.0,
            height: 60.0,
            child: Card(
              elevation: 3,
              child: Form(
                key: _emailKey,
                child: TextFormField(
                  autofocus: false,
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe um email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'e-mail',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets
                      .symmetric(vertical: 15.0, horizontal: 15),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),

          Container( //Senha
            width: 308.0,
            height: 60.0,
            child: Card(
              elevation: 3,
              child: Form(
                key: _senhaKey,
                child: TextFormField(
                  autofocus: false,
                  controller: senhaController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe uma senha';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets
                      .symmetric(vertical: 15.0, horizontal: 15),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),

          Container( //Confirma Senha
            width: 308.0,
            height: 60.0,
            child: Card(
              elevation: 3,
              child: Form(
                key: _confirmasenhaKey,
                child: TextFormField(
                  autofocus: false,
                  controller: confirmasenhaController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'É necessário confirmar a senha';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirmar Senha',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets
                      .symmetric(vertical: 15.0, horizontal: 15),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),

          Container( //Cargo
            width: 308.0,
            height: 60.0,
            child: Card(
              elevation: 3,
              child: Form(
                key: _cargoKey,
                child: TextFormField(
                  autofocus: false,
                  controller: cargoController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe um cargo';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Cargo',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets
                      .symmetric(vertical: 15.0, horizontal: 15),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          
            SizedBox(height: 40,),

            Container( // Botão Enviar
              width: 300.0,
              height: 50,
              child: RaisedButton(
                elevation: 3,
                color: Colors.blue,  //TODO SABER QUAL A COR PRA ALTERAR DEPOIS
                child: Text(
                  'Enviar',
                  style: TextStyle(fontSize: 18, 
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  )
                ),
                onPressed: () {
                  if (_emailKey.currentState.validate() && _senhaKey.currentState.validate()) {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => 
                     Login() ));
                    //getUser(emailController.text);
                    //Navigator.pop(context);
                  }
                },
              )
            ),
          ],
        )
      )
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }


  // void getUser(String emailName) async {
  //   //final response = await http.post("http://10.0.2.2:3333/devs",
  //   final response = await http.post("http://127.0.0.1:3333/devs",
  //     headers: {'Content-type': 'application/json'},
  //      body: json.encoder.convert({"username": emailName}));
  //   var j = json.decode(response.body);
  //   //User user = User.fromJson(j);
  //   //bloc.setUser(user);
  //   //print("J = " +  j);
  //}
}