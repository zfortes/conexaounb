import 'package:conexaounb/screens/informaces/informacoes.dart';
import 'package:conexaounb/screens/relato/addImage.dart';
import 'package:flutter/material.dart';

import 'pontuacao/pontuacao.dart';
import 'ultimosRelatos/ultimosRelatos.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  int _currentIndex = 0;

  List<Widget> _tabList = [
    AddImage(),
    Informacoes(),
    UltimosRelatos(),
    Pontuacao(),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _tabList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _currentIndex,
        onTap: (currentIndex){

          setState(() {
            _currentIndex = currentIndex;
          });

            _tabController.animateTo(_currentIndex);

        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            title: Text("Relatos"),
            icon: Icon(Icons.add)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            title: Text("Informações"),
            icon: Icon(Icons.info)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            title: Text("Últimos Relatos"),
            icon: Icon(Icons.list)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            title: Text("Pontuação"),
            icon: Icon(Icons.confirmation_number)
          ),
        ],
      ),
    );
  }
}