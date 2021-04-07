import 'package:freezed_annotation/freezed_annotation.dart';

part 'body.freezed.dart';
part 'body.g.dart';

@freezed
class Body with _$Body {
  const factory Body({required String message}) = _Body;

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
}
