import 'dart:io';
import 'package:conexaounb/screens/relato/relato.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddImage extends StatefulWidget {
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {

  File _image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.white,
      child: SafeArea(
          child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
    //                Image.asset('assets/logo.png'),
                      //SizedBox(height: 100,),
                      Container(

                          height: height/1.8,
                          child: Center(
                            child: _image == null
                                ? SemImagem()
                                : ComImagem(file: _image),
                          )
                      ),
                      SizedBox(height: 20,),
                      Container(
                          width: 300.0,
                          height: 50,
                          child: RaisedButton(
                            elevation: 3,
                            color: Colors.orange,
                            child: Text(
                                'Adicionar imagem',
                                style: TextStyle(fontSize: 20, color: Colors.white)
                            ),
                            onPressed: () {
                              getImage();
                            },
                          )
                      ),

                    ],
                  )
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment(0,1),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                      child: Container(
                          width: 300.0,
                          height: 50,
                          child: RaisedButton(
                            elevation: 3,
                            color: Colors.orange,
                            child: Text(
                                'Proximo',
                                style: TextStyle(fontSize: 20, color: Colors.white)
                            ),
                            onPressed: () {
                              if (_image != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      Relato(image: _image,)),
                                );
                              }
                            },
                          )
                      )
                  ),
                ),
              ]
          ),
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
}


class SemImagem extends StatelessWidget {
  String texto = 'Nenhuma imagem selecionada';
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
          child: Text(texto, style: TextStyle(fontSize: 20, color: Colors.black))
    );
  }
}

class ComImagem extends StatelessWidget {
  File file;
  ComImagem({this.file});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Image.file(file).width,
      height: Image.file(file).height,
      child: Card(
        elevation: 5,
        child: Image.file(file),
      )
    );
  }
}

