//import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:conexaounb/configs/configs.dart';
import 'package:flutter/material.dart';
//import 'package:tinder_dev/bloc/userBloc.dart';
//import 'package:tinder_dev/model/user.dart';


class Pontuacao extends StatefulWidget {
  Pontuacao({Key key}) : super(key: key);
  _PontuacaoState createState() => _PontuacaoState();
}

class _PontuacaoState extends State<Pontuacao> {
  //final UserBloc bloc = BlocProvider.getBloc<UserBloc>();

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
            
            SizedBox(height: 150,),
            Container( // Titulo Pontuacao
              width: 170.0,
              height: 40,
              child: Text(
                  ' Pontuação',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30,),

            Container( //Texto pontuacao
              width: 308.0, 
              height: 200.0,
              child: Card(
                elevation: 1,
                child: Form(
                  child: Center(
                    child: Text(
                      '\nNumero de relatos:     3 \n Sua pontuação:         30',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ),
              ),
            ),
            SizedBox(height: 25,),

            Center(
              child: Container( //Texto Saldo-RU
                width: 130.0,
                height: 80.0,
                child: Card(
                  elevation: 1,
                  color: Colors.blue[700],
                  child: Form(    
                    child: Center(             
                      child: Text(
                        "Créditos no RU: \n R\$ 10.50 ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60,), 

           Container( // Botão: Trocar por Vale-RU
              width: 300.0,
              height: 50,
              child: RaisedButton(
                elevation: 3,
                color: Configs.colorButton,  //TODO SABER QUAL A COR PRA ALTERAR DEPOIS
                child: Text(
                  'Trocar seus pontos',
                  style: TextStyle(fontSize: 20, color: Colors.white)
                ),
                onPressed: () {
                },
              )
            ),
          ],
        )
      )
    );
  }
}