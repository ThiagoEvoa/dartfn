// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Body _$BodyFromJson(Map<String, dynamic> json) {
  return _Body.fromJson(json);
}

/// @nodoc
class _$BodyTearOff {
  const _$BodyTearOff();

  _Body call({required String message}) {
    return _Body(
      message: message,
    );
  }

  Body fromJson(Map<String, Object> json) {
    return Body.fromJson(json);
  }
}

/// @nodoc
const $Body = _$BodyTearOff();

/// @nodoc
mixin _$Body {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyCopyWith<Body> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyCopyWith<$Res> {
  factory $BodyCopyWith(Body value, $Res Function(Body) then) =
      _$BodyCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$BodyCopyWithImpl<$Res> implements $BodyCopyWith<$Res> {
  _$BodyCopyWithImpl(this._value, this._then);

  final Body _value;
  // ignore: unused_field
  final $Res Function(Body) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BodyCopyWith<$Res> implements $BodyCopyWith<$Res> {
  factory _$BodyCopyWith(_Body value, $Res Function(_Body) then) =
      __$BodyCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$BodyCopyWithImpl<$Res> extends _$BodyCopyWithImpl<$Res>
    implements _$BodyCopyWith<$Res> {
  __$BodyCopyWithImpl(_Body _value, $Res Function(_Body) _then)
      : super(_value, (v) => _then(v as _Body));

  @override
  _Body get _value => super._value as _Body;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Body(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Body implements _Body {
  const _$_Body({required this.message});

  factory _$_Body.fromJson(Map<String, dynamic> json) =>
      _$_$_BodyFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'Body(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Body &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$BodyCopyWith<_Body> get copyWith =>
      __$BodyCopyWithImpl<_Body>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BodyToJson(this);
  }
}

abstract class _Body implements Body {
  const factory _Body({required String message}) = _$_Body;

  factory _Body.fromJson(Map<String, dynamic> json) = _$_Body.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BodyCopyWith<_Body> get copyWith => throw _privateConstructorUsedError;
}
