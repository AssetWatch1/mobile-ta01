import 'package:flutter/material.dart';

import 'bloc/models/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //MockData
  final List<Character> mockCharacters = [
    Character(
      id: 1,
      name: "Rick Sanchez",
      status: "Alive",
      species: "Human",
      type: "",
      gender: "Male",
      origin: const LocationInfo(
        name: "Earth",
        url: "https://rickandmortyapi.com/api/location/1",
      ),
      location: const LocationInfo(
        name: "Earth",
        url: "https://rickandmortyapi.com/api/location/20",
      ),
      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      episode: const [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
      ],
      url: "https://rickandmortyapi.com/api/character/1",
      created: DateTime.parse("2017-11-04T18:48:46.250Z"),
    ),
    Character(
      id: 2,
      name: "Morty Smith",
      status: "Alive",
      species: "Human",
      type: "",
      gender: "Male",
      origin: const LocationInfo(
        name: "Earth",
        url: "https://rickandmortyapi.com/api/location/1",
      ),
      location: const LocationInfo(
        name: "Earth",
        url: "https://rickandmortyapi.com/api/location/20",
      ),
      image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
      episode: const [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
      ],
      url: "https://rickandmortyapi.com/api/character/2",
      created: DateTime.parse("2017-11-04T18:50:21.651Z"),
    ),
  ];

//* Todo:
//* [] Display a list of names and species using the provided mock data
//* [] Show the avatar or image of the character
//* [] (optional) Add a way to refresh the data (can be as simple as a button being pressed)
//* [] (optional) Add Image caching
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Character List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Character List'),
        ),
        body: Text('Welcome to Assetwatch!'),
      ),
    );
  }
}
