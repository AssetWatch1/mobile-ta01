/// Please paste the entire code into DartPad (https://dartpad.dev/) if there are any issues with running it on the candidates machine
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

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

/// The Character Bloc
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client(),
        super(CharacterInitial());
  //* Todo: Implement the business logic:
  //* [] Retrieve the data from https://rickandmortyapi.com/api/character
  //* [] Make sure to show a loading spinner while waiting for the data to load
  //* [] Show an error message if the data fails to load
  //* You can reference the documentation here: https://rickandmortyapi.com/documentation/#character-schema
  final http.Client _httpClient;
}

/// Bloc Events
abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacters extends CharacterEvent {}

/// Bloc States
abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

//* Todo:
//* [] Define the CharacterState

/// The Character Model
class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationInfo origin;
  final LocationInfo location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: LocationInfo.fromJson(json['origin'] as Map<String, dynamic>),
      location: LocationInfo.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: DateTime.parse(json['created'] as String),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];
}

/// The Location Info Model
class LocationInfo extends Equatable {
  final String name;
  final String url;

  const LocationInfo({
    required this.name,
    required this.url,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  @override
  List<Object?> get props => [name, url];
}
