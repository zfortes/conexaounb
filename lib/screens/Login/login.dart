//import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:conexaounb/configs/configs.dart';
import 'package:conexaounb/modals/usuario.dart';
import 'package:conexaounb/screens/Cadastro/cadastro.dart';
import 'package:conexaounb/screens/relato/addImage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:tinder_dev/bloc/userBloc.dart';
//import 'package:tinder_dev/model/user.dart';
import 'dart:convert';


class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);


  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final UserBloc bloc = BlocProvider.getBloc<UserBloc>();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final buttonController = TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  final _senhaKey = GlobalKey<FormState>();
  final _buttonKey = GlobalKey<FormState>();


  
  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('assets/UNB.png'),
              width: 170.0,
              height: 120.0,
            ),
            SizedBox(height: 10,),            
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
                        return 'Digite um email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Informe um e-email',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets
                        .symmetric(vertical: 15.0, horizontal: 15),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
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
                      hintText: 'Informe a senha',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets
                        .symmetric(vertical: 15.0, horizontal: 15),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4,),
            Container( // Entrar
              width: 300.0,
              height: 50,
              child: RaisedButton(
                elevation: 3,
                color: Colors.blue,  //TODO SABER QUAL A COR PRA ALTERAR DEPOIS
                child: Text(
                  'Entrar',
                  style: TextStyle(fontSize: 20, color: Colors.white)
                ),
                onPressed: () {
                   if (_emailKey.currentState.validate() && _senhaKey.currentState.validate()) {
                      login();
                     //Navigator.pop(context);
                   }
                },
              )
            ),
            SizedBox(height: 20,),
            Container( // Cadastre-se
              width: 300.0,
              height: 50,
              child: RaisedButton(
                elevation: 3,
                color: Colors.blue,  //TODO SABER QUAL A COR PRA ALTERAR DEPOIS
                child: Text(
                  'Cadastre-se',
                  style: TextStyle(fontSize: 20, color: Colors.white)
                ),
                onPressed: () {
//                  if (_emailKey.currentState.validate() && _senhaKey.currentState.validate()) {
//                    //getUser(emailController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => 
                    Cadastro() ));      
                    //Navigator.pop(context);
//                  }
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


  void login() async{
    final response = await http.post(Configs.ipServer + "/login",
       headers: {'Content-type': 'application/json'},
        body: json.encoder.convert(
            {
              "email": emailController.text,
              "senha": senhaController.text
            }));

    if (response.statusCode == 200) {
      var j = json.decode(response.body);
      Usuario usuario = Usuario.fromJson(j);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          AddImage(usuario: usuario)));
    }

  }

//  void getUser(String emailName) async {
//     //final response = await http.post("http://10.0.2.2:3333/devs",
//     final response = await http.post("http://127.0.0.1:3333/devs",
//       headers: {'Content-type': 'application/json'},
//        body: json.encoder.convert({"username": emailName}));
//     var j = json.decode(response.body);
//     //User user = User.fromJson(j);
//     //bloc.setUser(user);
//     //print("J = " +  j);
//   }
}