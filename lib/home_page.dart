import 'dart:convert';

import 'package:buddy_activity/buddy_press_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var _data;
  
  _getData() async {
      try {
        final response = await http.get(Uri.parse('https://promisepolice.tastewp.com/wp-json/buddypress/v1/activity'));
        if(response.statusCode == 200) {
          return jsonDecode(response.body);
        }
        throw "${response.body}";
      } catch (e) {
        print(e);
        return e;
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    _data = _getData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () {
            setState(() {
              _data = _getData();
            });
            return _data;
          },
          child: FutureBuilder(
            future: _data,
            builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData) {
                List<BuddyPressActivityModal> items = snapshot?.data
                    ?.map<BuddyPressActivityModal>
                  ((item) => BuddyPressActivityModal.fromJson(item))?.toList();

                return Column(
                  children: items.map((e) =>
                      ListTile(
                    title: Text(Bidi.stripHtmlIfNeeded(e?.content.rendered)),
                    subtitle: Text(e?.date),
                    trailing: Text(e?.status),

                  )).toList(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
