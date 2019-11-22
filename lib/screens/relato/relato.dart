import 'dart:convert';
import 'dart:io';

import 'package:conexaounb/configs/configs.dart';
import 'package:conexaounb/modals/servico.dart';
import 'package:conexaounb/modals/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Relato extends StatefulWidget {
    final File image;
    final Usuario usuario;
  Relato({Key key, @required this.image, @required this.usuario}) : super(key: key);


  @override
  _RelatoState createState() => _RelatoState();
}


class _RelatoState extends State<Relato> {
  File image;
  List<DropdownMenuItem<String>> servicos;


  var servicoSelecionado;
  final _descricaoController = TextEditingController();
  final _tituloController = TextEditingController();


  final _tituloKey = GlobalKey<FormState>();


  final _descricaoKey = GlobalKey<FormState>();

  initState() {
    super.initState();
    getServicos();
    image = widget.image;
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
        child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10,),
                Container(
                  width: 308.0,
                  height: 60.0,
                  child: Card(
                    elevation: 3,
                    child: Form(
                      key: _tituloKey,
                      child: TextFormField(
                        autofocus: false,
                        controller: _tituloController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite um titulo';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Titulo',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets
                              .symmetric(vertical: 15.0, horizontal: 15),
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 308.0,
                  height: 60.0,
                  child: Card(
                    elevation: 3,
                    child: Form(
                      key: _descricaoKey,
                      child: TextFormField(
                        autofocus: false,
                        controller: _descricaoController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite uma descrição';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Descrição',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets
                              .symmetric(vertical: 15.0, horizontal: 15),
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 308.0,
                  height: 60.0,
                  child: Card(
                      elevation: 3,
                      child: DropdownButton <String>(
                        items: servicos,
                        onChanged: (String selectedType) {
                          setState(() {
                            this.servicoSelecionado = selectedType;
                          });
                        },
                        value: servicoSelecionado,
                        isExpanded: true,
                        hint: Text(
                          'Selecione o tipo de serviço',
                          style: TextStyle(color: Colors.black),
                        ),
                        isDense: true,
                      )
                    ),
                ),
                SizedBox(height: 10,),
                Container(
                    width: 300.0,
                    height: 50,
                    child: RaisedButton(
                      elevation: 3,
                      color: Configs.colorButton,
                      child: Text(
                          'Enviar',
                          style: TextStyle(fontSize: 20, color: Colors.white)
                      ),
                      onPressed: () {
                        if (_tituloKey.currentState.validate()) {
                          enviarRelato();
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
    _tituloController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }




  void getUser(String userName) async {
    //final response = await http.post("http://10.0.2.2:3333/devs",
//    final response = await http.post("http://127.0.0.1:3333/devs",
//        headers: {'Content-type': 'application/json'},
//        body: json.encoder.convert({"username": userName}));
//    var j = json.decode(response.body);
//    User user = User.fromJson(j);
//    bloc.setUser(user);
    //print("J = " +  j);
  }

  Future enviarRelato() async {
    String imagem = base64Encode(image.readAsBytesSync());
    final response = await http.post(Configs.ipServer + "/relato",
        headers: {'Content-type': 'application/json'},
        body: json.encoder.convert(
            {
                "titulo": _tituloController.text,
                "descricao" : _descricaoController.text,
                "nome" : servicoSelecionado,
                "local": "UnB",
                "feedback" : 1,
                "email" : widget.usuario.getEmail(),
                "imagem" : imagem
            }));
        if (response.statusCode == 200){
          Navigator.pop(context);
        }
  }

  Future<void> getServicos() async {
    final response = await http.get(Configs.ipServer + "/servico");
    var j = json.decode(response.body);
    List<Servico> servicos = new List<Servico>.from(
        j.map((i) => Servico.fromJsonString(i)).toList());

    setState(() {
      this.servicos = getDropDownMenuItems(servicos);
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems(List<Servico> servicos) {
    List<DropdownMenuItem<String>> items = new List();
    for (Servico s in servicos) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(
          value: s.getNome(),
          child: new Text(s.getNome(), style: TextStyle(color: Colors.black   ))
      ));
    }
    return items;
  }

  void changedDropDownItem(String servicoSelecionado) {
    setState(() {
      this.servicoSelecionado = servicoSelecionado;
    });
  }
}
