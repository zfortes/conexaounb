import 'package:flutter/material.dart';

class Informacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(//Primeira noticia
      color: Colors.white,
      child :SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height :20),
            Card(
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
                          image: NetworkImage("http://www.noticias.unb.br/images/FNI2019_Feed.png")
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
                              'Hackaton - UnB'
                              
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                width: 260,
                                child: Text("Evento do CDT: 21 e 22 de Novembro, para mais informações em: http://www.noticias.unb.br/component/agenda/agenda/2793",style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 48, 48, 54)
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
                          image: NetworkImage("http://www.noticias.unb.br/images/Noticias/2019/11-Nov/19nov2019_energiafotovoltaica_davisuedpontesaguiar_fce.jpg")
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
                              'Novo Sistema de geração de energia solar'
                              
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                width: 260,
                                child: Text("informaçoes em: http://www.noticias.unb.br/76-institucional/3643-campus-darcy-ribeiro-recebe-sistema-de...",style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 48, 48, 54)
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
                          image: NetworkImage("http://www.noticias.unb.br/images/Noticias/2019/11-Nov/21nov2019_110_gustavo.jpg")
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
                              'Atividade acadêmica e passe livre'
                              
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                width: 260,
                                child: Text("informaçoes em: http://www.noticias.unb.br/76-institucional/3657-aluno-em-atividade-academica-nas-ferias-tera-passe-livre",style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 48, 48, 54)
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
        )
      ), 
    );
  }
}