import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _imageLogo = AssetImage("images/logo.png");
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoresultado = "";

   void _calcular(){
    
    double precoAlcool = double.tryParse(_controllerAlcool.text.replaceAll(",", "."));
    double precoGasolina = double.tryParse(_controllerGasolina.text.replaceAll(",", "."));
  
    if(precoAlcool == null || precoGasolina == null){
      setState(() {
      _textoresultado = "Número inválido, digite números maiores que 0";   
      });
     
    }
    else {
      setState(() {
        if((precoAlcool / precoGasolina) >= (0.7)){
            _textoresultado = "Abasteça com gasolina"; 
        }

        else {
          _textoresultado = "Abasteça com álcool";
        }
       
      });

      _limparCampos();
    }
  }

  void _limparCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image(
                image: this._imageLogo,  
              ),
            ),  
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Qual a melhor opção de combústivel?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ), 
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço Álcool, ex: 1.59",
              ),
              style: TextStyle(
                fontSize: 22
              ),
              controller: _controllerAlcool,
            ),
            TextField(
               keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço Gasolina, ex: 3.99",
              ),
              style: TextStyle(
                fontSize: 22
              ),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                color: Colors.blue,  
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text("Calcular",
                style: TextStyle(
                  fontSize: 20
                ),
                ),
                onPressed: _calcular,
              ),
            ),
           Padding(
             padding: EdgeInsets.only(top: 20),
             child: Text(
               _textoresultado,
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold,
                 
               ),),
           )
          ],
        ),
        )
      ),
    );
  }
}
