import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental_dicoding/models/album.dart';
import 'package:http/http.dart' as http;

class InternetThingsPage extends StatefulWidget {
  static const routeName = '/internet_things/internet_things';
  const InternetThingsPage({Key? key}) : super(key: key);

  @override
  State<InternetThingsPage> createState() => _InternetThingsPageState();
}

class _InternetThingsPageState extends State<InternetThingsPage> {
  // Future myVoidFuture() {} // Tidak mengembalikan nilai apapun
  Future<bool> myTypedFuture() async {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('Error from Exception');
  }

  // Mengembalikan nilai true / false
  void runMyFuture() {
    myTypedFuture().then(
      (value) {
        // Jalankan kode ekstra di sini
      },
    ).catchError((error) {
      print(error);
    });
  }

  // atau seperti ini
  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  late Future<Album> _futureAlbum;

  @override
  void initState() {
    _futureAlbum = fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet tuts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   child: Text('Run Future'),
            //   onPressed: () async {
            //     setState(() {
            //       fetchAlbum();
            //     });
            //     // var value = await myTypedFuture();
            //     // variable value mengembalikan sebuah nilai dari fungsi myTypedFuture().
            //   },
            // ),
            FutureBuilder<Album>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  print('loading...');
                  return Column(
                    children: [
                      Center(child: Text('Loading...')),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.title);
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else {
                    return Text('');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
