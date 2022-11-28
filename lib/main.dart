import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musixmatch_api/bookmarks_page.dart';
import 'package:musixmatch_api/track_detail_screen.dart';
import 'package:musixmatch_api/tracks_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App - Musixmatch API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        TrackDetailScreen.routeName: (context) => TrackDetailScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;

  var pages = [TracksPage(), BookmarksPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music App - Musixmatch API'),
      ),
      body: pages[navIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: navIndex,
          onTap: (value) {
            setState(() {
              navIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.art_track_rounded), label: "Tracks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmarks), label: "Bookmarks")
          ]),
    );
  }
}
