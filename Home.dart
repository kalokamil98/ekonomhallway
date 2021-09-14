import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

var green = Colors.green;
String lekcja = 'Matematyka';
var iddleButton = Colors.grey;

// ignore: non_constant_identifier_names
String klasa_slowo = "";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: non_constant_identifier_names
    String? wybrana_klasa = prefs.getString('save');
    String fix = wybrana_klasa.toString();
    int _grupa = prefs.getInt('grupa') ?? 0;
    klasa_slowo = fix;
    setState(() {
      klasa_slowo = '$klasa_slowo Gr $_grupa';
    });
    print('$klasa_slowo  ;  $_grupa');
  }

  final url =
      "https://uonetplus.vulcan.net.pl/powiatelcki/Start.mvc/GetKidsLessonPlan";

  final body = {
    "permissions":
        "eyJVbml0cyI6W3siSWQiOjEsIk5hendhIjoiWmVzcMOzxYIgU3prw7PFgiBuciA1IHcgRcWCa3UiLCJTa3JvdCI6IlpTNSIsIlN5bWJvbCI6IjAxMzg2MSJ9XSwiQXV0aEluZm9zIjpbeyJKZWRub3N0a2FTcHJhd296ZGF3Y3phSWQiOjEsIkxvZ2luSWQiOjYxODUsIkxvZ2luVmFsdWUiOiJrYWxva2FtaWw5OEBob3RtYWlsLmNvbSIsIlVjemVuSWRzIjpbMzIzOV0sIk9waWVrdW5JZHMiOltdLCJQcmFjb3duaWtJZHMiOltdLCJSb2xlcyI6WzddLCJMaW5rZWRBY2NvdW50VWlkcyI6W119XX0=^|XQoKhg1HPuz53CWOS0uiA3AE36oRsLTxl2kfF4bm6Yk="
  };
  final headers = {
    'accept': "application/json, text/javascript, */*; q=0.01",
    "accept-language": "en-GB,en;q=0.9,pl-PL;q=0.8,pl;q=0.7,en-US;q=0.6",
    "content-type": "application/json; charset=UTF-8",
    "sec-ch-ua":
        '"Google Chrome";v="93", " Not;A Brand";v="99", "Chromium";v="93"',
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": '"Windows"',
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-origin",
    "x-requested-with": "XMLHttpRequest",
    'cookie':
        "_ga=GA1.3.596487655.1587986088; efebCookieReaded=1; ARR_3S_ARR_EFEB=baa65c969ba7d8ecae6632920e7c26bb3414de287fcd9cd3f22722a7ca08a7f9; UonetPlus_ASP.NET_SessionId=j2vwklaculdpcpb21jhxit4n; EfebSsoAuthCookie=_sPyZnNnnHWH_GgRYx-UJUzjNklZCz5trmD7KJ9KQdouHK6F_VcFdo-_WQ-qT8I6SKiKRu-S3GGaV9L1IH-qyf7Gx_zb6WZ4uh_b0s2L3bAwHDSi6ehAeILmwSIqrdVRK6y3m8ebFCbzCOLvJkTrTAJX4O6lhuQi4hqu9P9D3e-PXADtFRAlIdEj204KuJui52HWdpIHEy_oL8nVZ6HGVHXgGib1WpYrqANBWDHreQLNwVxLEVs8L4lDQauV80YEprmTaVZu7waZvFVLRmaWEUPiKAIBAFcp1yOvc70GKc97Ue_jlzBFavbNCgzbSrZXSq37TpHi1jDoHKKzQBjps4Pcw4uNtzhxsw7Ix92fyKQhWVPBk5oRGeOcxS9xtpF9L7Dkie7cGXzbSODXdw~~; UonetPlus_SLACookie=637672454576665694",
  };

  void sendPoste() async {
    final respone = await http.post(Uri.parse(url),
        body: jsonEncode(body), headers: headers);
    final jsondata = jsonDecode(respone.body);
    print('$jsondata["data"]');
    print(respone.statusCode);
  }

  @override
  void initState() {
    setData();
    sendPoste();
    super.initState();
  }

  String? nrklasy = 'elo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ekonom Hallway',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      backgroundColor: Colors.grey[100],
      body: InteractiveViewer(
        child: Container(
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.remove('grupa');
                        Navigator.pushReplacementNamed(context, '/');
                        setState(() {
                          nrklasy = '3i';
                        });
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  klasa_slowo,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Text(
                    '2 piętro',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Container(
                constraints: BoxConstraints(minHeight: 100, maxHeight: 700),
                child: Image.network(
                  'https://liceum7.edu.pl/wp-content/uploads/2018/08/IIPietro-Copy.jpg',
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    '13:20-14:10',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '$lekcja  \n     sala 85',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              ),

              /*             Container(
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                child: Divider(
                  height: 30,
                  color: Colors.grey,
                ),
              ),
              
              
              
                height: 120,
                alignment: Alignment.bottomCenter,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Pn'),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Colors.green),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('Wt'),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          primary: iddleButton)),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('Śr'),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          primary: iddleButton)),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('Czw'),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          primary: iddleButton)),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('Pt'),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          primary: iddleButton))
                ],
              ),) */
            ],
          ),
        ),
      ),
    );
  }
}
