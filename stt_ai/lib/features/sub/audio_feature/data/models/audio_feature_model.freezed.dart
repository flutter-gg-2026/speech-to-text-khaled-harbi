// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioFeatureModel {

 String get path;
/// Create a copy of AudioFeatureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioFeatureModelCopyWith<AudioFeatureModel> get copyWith => _$AudioFeatureModelCopyWithImpl<AudioFeatureModel>(this as AudioFeatureModel, _$identity);

  /// Serializes this AudioFeatureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioFeatureModel&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'AudioFeatureModel(path: $path)';
}


}

/// @nodoc
abstract mixin class $AudioFeatureModelCopyWith<$Res>  {
  factory $AudioFeatureModelCopyWith(AudioFeatureModel value, $Res Function(AudioFeatureModel) _then) = _$AudioFeatureModelCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$AudioFeatureModelCopyWithImpl<$Res>
    implements $AudioFeatureModelCopyWith<$Res> {
  _$AudioFeatureModelCopyWithImpl(this._self, this._then);

  final AudioFeatureModel _self;
  final $Res Function(AudioFeatureModel) _then;

/// Create a copy of AudioFeatureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioFeatureModel].
extension AudioFeatureModelPatterns on AudioFeatureModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioFeatureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioFeatureModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioFeatureModel value)  $default,){
final _that = this;
switch (_that) {
case _AudioFeatureModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioFeatureModel value)?  $default,){
final _that = this;
switch (_that) {
case _AudioFeatureModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioFeatureModel() when $default != null:
return $default(_that.path);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path)  $default,) {final _that = this;
switch (_that) {
case _AudioFeatureModel():
return $default(_that.path);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path)?  $default,) {final _that = this;
switch (_that) {
case _AudioFeatureModel() when $default != null:
return $default(_that.path);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioFeatureModel implements AudioFeatureModel {
  const _AudioFeatureModel({required this.path});
  factory _AudioFeatureModel.fromJson(Map<String, dynamic> json) => _$AudioFeatureModelFromJson(json);

@override final  String path;

/// Create a copy of AudioFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioFeatureModelCopyWith<_AudioFeatureModel> get copyWith => __$AudioFeatureModelCopyWithImpl<_AudioFeatureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioFeatureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioFeatureModel&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'AudioFeatureModel(path: $path)';
}


}

/// @nodoc
abstract mixin class _$AudioFeatureModelCopyWith<$Res> implements $AudioFeatureModelCopyWith<$Res> {
  factory _$AudioFeatureModelCopyWith(_AudioFeatureModel value, $Res Function(_AudioFeatureModel) _then) = __$AudioFeatureModelCopyWithImpl;
@override @useResult
$Res call({
 String path
});




}
/// @nodoc
class __$AudioFeatureModelCopyWithImpl<$Res>
    implements _$AudioFeatureModelCopyWith<$Res> {
  __$AudioFeatureModelCopyWithImpl(this._self, this._then);

  final _AudioFeatureModel _self;
  final $Res Function(_AudioFeatureModel) _then;

/// Create a copy of AudioFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(_AudioFeatureModel(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
