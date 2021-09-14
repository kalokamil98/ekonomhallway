import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Grupa extends StatelessWidget {
  const Grupa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wybierz Grupę'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: ElevatedButton(
              child: Container(child: Text('Grupa 1',style: TextStyle(
                fontSize: 17
              ),)
              ,
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size(double.infinity, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  )
                  ),
                  
              onPressed: () {
               Navigator.pushReplacementNamed(context, '/home');
                saveData(1);
              },
            ),
            
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(
              child: Text('Grupa 2',style: TextStyle(
                fontSize: 17
              ),),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size(double.infinity, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  )),
                  
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
                saveData(2);
              },
            ),
            
          )
        ],
      ),
    );
  }

  void saveData(x) async {
    print(x);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('grupa', x);
  }
}
