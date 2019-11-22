import 'package:conexaounb/modals/usuario.dart';
import 'package:conexaounb/screens/relato/addImage.dart';
import 'package:flutter/material.dart';

class UltimosRelatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(//Primeiro relato
      color: Colors.white,
      child :Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height :50),
            Card(
                elevation: 5,
                color: Colors.white,
                child: Container(
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5)
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://img.icons8.com/carbon-copy/2x/info.png")
                        )
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Titulo: Relato 1'
                              
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                width: 260,
                                child: Text("Descricao: Problemas na torneira do Banheiro Feminino\n Data:21/11/2019",style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
             SizedBox(height :10),



             Card(//Segunda informação
                elevation: 5,
                child: Container(
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5)
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://img.icons8.com/carbon-copy/2x/info.png")
                        )
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Titulo: Relato 2'
                              
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                width: 260,
                                child: Text("Descricao: Piso quebrado em frente a sala 10/33 \n Data:25/10/2019",style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),),
                                
                                
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Card(//Terceira informação
                elevation: 5,
                child: Container(
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5)
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://img.icons8.com/carbon-copy/2x/info.png")
                        )
                      ),
                    ),
                    Container(
                      height: 120,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Titulo: Relato 1'
                              
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                width: 260,
                                child: Text("Descricao: Bebedouro quebrado no Térreo\n Data:07/05//2019",style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),),
                                
                                
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {                              
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                AddImage()));   
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      ), 
    );
  }
}