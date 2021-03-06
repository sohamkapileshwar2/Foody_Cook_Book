import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealsScreen extends StatefulWidget {
  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  Future<Map> mapResponse;

  void initState() {
    mapResponse = fetchData();
    super.initState();
  }

  Future<Map> fetchData() async {
    http.Response response;
    response =
        await http.get('https://www.themealdb.com/api/json/v1/1/random.php');
    if (response.statusCode == 200) {
      // setState(() {
      //   mapResponse = json.decode(response.body);
      // });
      return json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: mapResponse,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                Center(
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        child: Text(snapshot.data['meals'][0]['strMeal'],
                            style: TextStyle(
                                fontSize: 25,
                                color: Theme.of(context).accentColor)))),
                Container(
                    padding: EdgeInsets.all(15),
                    child: Container(
                        decoration: BoxDecoration(border: Border.all(width: 5)),
                        child: Image.network(
                            snapshot.data["meals"][0]["strMealThumb"]))),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    snapshot.data['meals'][0]['strInstructions'],
                    style: TextStyle(
                        fontSize: 15, color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
