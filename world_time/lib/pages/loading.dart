import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response =
        await get("http://worldtimeapi.org/api/timezone/Europe/London" as Uri);
    Map data = jsonDecode(response.body);

    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("loading screen"),
    );
  }
}
