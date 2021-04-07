import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({int? id, required String name, required String email}) =
      _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  factory Person.initState() => Person(id: -1, name: '', email: '');
}
