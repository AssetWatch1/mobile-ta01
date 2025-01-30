import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client(),
        super(CharacterInitial());
  //* Todo: Implement the business logic:
  //* [] Retrieve the data from https://rickandmortyapi.com/api/character
  //* [] Make sure to show a loading spinner while waiting for the data to load
  //* [] Show an error message if the data fails to load
  final http.Client _httpClient;
}
