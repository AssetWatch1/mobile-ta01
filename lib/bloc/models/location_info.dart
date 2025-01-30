import 'package:equatable/equatable.dart';

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
