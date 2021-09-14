import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Chose extends StatelessWidget {
  const Chose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int _grupa = prefs.getInt('grupa') ?? 0;
      if (_grupa > 0) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }

    getData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Wybierz klasę'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: klasy.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, '/Grupa');
                  print(index + 1);
                  String klasaSlowo = "";

                  switch (index + 1) {
                    case 1:
                      klasaSlowo = '1E';
                      break;

                    case 2:
                      klasaSlowo = '1R';
                      break;
                    case 3:
                      klasaSlowo = '1I1';
                      break;
                    case 4:
                      klasaSlowo = '1I2';
                      break;
                    case 5:
                      klasaSlowo = '1L1';
                      break;
                    case 6:
                      klasaSlowo = '1L2';
                      break;
                    case 7:
                      klasaSlowo = '2EP';
                      break;
                    case 8:
                      klasaSlowo = '2RP';
                      break;
                    case 9:
                      klasaSlowo = '2LP';
                      break;
                    case 10:
                      klasaSlowo = '2IP';
                      break;
                    case 11:
                      klasaSlowo = '3E';
                      break;
                    case 12:
                      klasaSlowo = '3R';
                      break;
                    case 13:
                      klasaSlowo = '3L';
                      break;
                    case 14:
                      klasaSlowo = '3I';
                      break;
                    case 15:
                      klasaSlowo = '3EP';
                      break;
                    case 16:
                      klasaSlowo = '3RP';
                      break;
                    case 17:
                      klasaSlowo = '3LP';
                      break;
                    case 18:
                      klasaSlowo = '3IP';
                      break;
                    case 19:
                      klasaSlowo = '4E';
                      break;
                    case 20:
                      klasaSlowo = '4R';
                      break;
                    case 21:
                      klasaSlowo = '4L';
                      break;
                    case 22:
                      klasaSlowo = '4I';
                      break;
                  }
                  print(klasaSlowo);

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('save', klasaSlowo);
                },
                child: Text(klasy[index] + '',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(60), primary: Colors.green),
              ),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
            );
          }),
    );
  }
}

List<String> klasy = [
  "1E",
  "1R",
  "1I1",
  "1I2",
  "1L1",
  "1L2",
  "2EP",
  "2RP",
  "2LP",
  "2IP",
  "3E",
  "3R",
  "3L",
  "3i",
  "3EP",
  "3RP",
  "3LP",
  "3IP",
  "4E",
  "4R",
  "4L",
  "4i",
];
