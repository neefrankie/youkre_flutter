// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CourseSession implements DiagnosticableTreeMixin {

 String get id; String get courseId; DateTime get startedAt; DateTime? get completedAt; int? get lastLevelIndex;
/// Create a copy of CourseSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseSessionCopyWith<CourseSession> get copyWith => _$CourseSessionCopyWithImpl<CourseSession>(this as CourseSession, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CourseSession'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('courseId', courseId))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('completedAt', completedAt))..add(DiagnosticsProperty('lastLevelIndex', lastLevelIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseSession&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.lastLevelIndex, lastLevelIndex) || other.lastLevelIndex == lastLevelIndex));
}


@override
int get hashCode => Object.hash(runtimeType,id,courseId,startedAt,completedAt,lastLevelIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CourseSession(id: $id, courseId: $courseId, startedAt: $startedAt, completedAt: $completedAt, lastLevelIndex: $lastLevelIndex)';
}


}

/// @nodoc
abstract mixin class $CourseSessionCopyWith<$Res>  {
  factory $CourseSessionCopyWith(CourseSession value, $Res Function(CourseSession) _then) = _$CourseSessionCopyWithImpl;
@useResult
$Res call({
 String id, String courseId, DateTime startedAt, DateTime? completedAt, int? lastLevelIndex
});




}
/// @nodoc
class _$CourseSessionCopyWithImpl<$Res>
    implements $CourseSessionCopyWith<$Res> {
  _$CourseSessionCopyWithImpl(this._self, this._then);

  final CourseSession _self;
  final $Res Function(CourseSession) _then;

/// Create a copy of CourseSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseId = null,Object? startedAt = null,Object? completedAt = freezed,Object? lastLevelIndex = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLevelIndex: freezed == lastLevelIndex ? _self.lastLevelIndex : lastLevelIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseSession].
extension CourseSessionPatterns on CourseSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseSession value)  $default,){
final _that = this;
switch (_that) {
case _CourseSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseSession value)?  $default,){
final _that = this;
switch (_that) {
case _CourseSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String courseId,  DateTime startedAt,  DateTime? completedAt,  int? lastLevelIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseSession() when $default != null:
return $default(_that.id,_that.courseId,_that.startedAt,_that.completedAt,_that.lastLevelIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String courseId,  DateTime startedAt,  DateTime? completedAt,  int? lastLevelIndex)  $default,) {final _that = this;
switch (_that) {
case _CourseSession():
return $default(_that.id,_that.courseId,_that.startedAt,_that.completedAt,_that.lastLevelIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String courseId,  DateTime startedAt,  DateTime? completedAt,  int? lastLevelIndex)?  $default,) {final _that = this;
switch (_that) {
case _CourseSession() when $default != null:
return $default(_that.id,_that.courseId,_that.startedAt,_that.completedAt,_that.lastLevelIndex);case _:
  return null;

}
}

}

/// @nodoc


class _CourseSession extends CourseSession with DiagnosticableTreeMixin {
  const _CourseSession({required this.id, required this.courseId, required this.startedAt, this.completedAt, this.lastLevelIndex}): super._();
  

@override final  String id;
@override final  String courseId;
@override final  DateTime startedAt;
@override final  DateTime? completedAt;
@override final  int? lastLevelIndex;

/// Create a copy of CourseSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseSessionCopyWith<_CourseSession> get copyWith => __$CourseSessionCopyWithImpl<_CourseSession>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CourseSession'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('courseId', courseId))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('completedAt', completedAt))..add(DiagnosticsProperty('lastLevelIndex', lastLevelIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseSession&&(identical(other.id, id) || other.id == id)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.lastLevelIndex, lastLevelIndex) || other.lastLevelIndex == lastLevelIndex));
}


@override
int get hashCode => Object.hash(runtimeType,id,courseId,startedAt,completedAt,lastLevelIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CourseSession(id: $id, courseId: $courseId, startedAt: $startedAt, completedAt: $completedAt, lastLevelIndex: $lastLevelIndex)';
}


}

/// @nodoc
abstract mixin class _$CourseSessionCopyWith<$Res> implements $CourseSessionCopyWith<$Res> {
  factory _$CourseSessionCopyWith(_CourseSession value, $Res Function(_CourseSession) _then) = __$CourseSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String courseId, DateTime startedAt, DateTime? completedAt, int? lastLevelIndex
});




}
/// @nodoc
class __$CourseSessionCopyWithImpl<$Res>
    implements _$CourseSessionCopyWith<$Res> {
  __$CourseSessionCopyWithImpl(this._self, this._then);

  final _CourseSession _self;
  final $Res Function(_CourseSession) _then;

/// Create a copy of CourseSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseId = null,Object? startedAt = null,Object? completedAt = freezed,Object? lastLevelIndex = freezed,}) {
  return _then(_CourseSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLevelIndex: freezed == lastLevelIndex ? _self.lastLevelIndex : lastLevelIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$LevelProgress implements DiagnosticableTreeMixin {

 String get id; String get levelId; int get score; int get total; DateTime get startedAt; DateTime? get completedAt; int? get lastExerciseIndex;
/// Create a copy of LevelProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LevelProgressCopyWith<LevelProgress> get copyWith => _$LevelProgressCopyWithImpl<LevelProgress>(this as LevelProgress, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LevelProgress'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('levelId', levelId))..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('completedAt', completedAt))..add(DiagnosticsProperty('lastExerciseIndex', lastExerciseIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LevelProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.score, score) || other.score == score)&&(identical(other.total, total) || other.total == total)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.lastExerciseIndex, lastExerciseIndex) || other.lastExerciseIndex == lastExerciseIndex));
}


@override
int get hashCode => Object.hash(runtimeType,id,levelId,score,total,startedAt,completedAt,lastExerciseIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LevelProgress(id: $id, levelId: $levelId, score: $score, total: $total, startedAt: $startedAt, completedAt: $completedAt, lastExerciseIndex: $lastExerciseIndex)';
}


}

/// @nodoc
abstract mixin class $LevelProgressCopyWith<$Res>  {
  factory $LevelProgressCopyWith(LevelProgress value, $Res Function(LevelProgress) _then) = _$LevelProgressCopyWithImpl;
@useResult
$Res call({
 String id, String levelId, int score, int total, DateTime startedAt, DateTime? completedAt, int? lastExerciseIndex
});




}
/// @nodoc
class _$LevelProgressCopyWithImpl<$Res>
    implements $LevelProgressCopyWith<$Res> {
  _$LevelProgressCopyWithImpl(this._self, this._then);

  final LevelProgress _self;
  final $Res Function(LevelProgress) _then;

/// Create a copy of LevelProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? levelId = null,Object? score = null,Object? total = null,Object? startedAt = null,Object? completedAt = freezed,Object? lastExerciseIndex = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastExerciseIndex: freezed == lastExerciseIndex ? _self.lastExerciseIndex : lastExerciseIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LevelProgress].
extension LevelProgressPatterns on LevelProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LevelProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LevelProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LevelProgress value)  $default,){
final _that = this;
switch (_that) {
case _LevelProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LevelProgress value)?  $default,){
final _that = this;
switch (_that) {
case _LevelProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String levelId,  int score,  int total,  DateTime startedAt,  DateTime? completedAt,  int? lastExerciseIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LevelProgress() when $default != null:
return $default(_that.id,_that.levelId,_that.score,_that.total,_that.startedAt,_that.completedAt,_that.lastExerciseIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String levelId,  int score,  int total,  DateTime startedAt,  DateTime? completedAt,  int? lastExerciseIndex)  $default,) {final _that = this;
switch (_that) {
case _LevelProgress():
return $default(_that.id,_that.levelId,_that.score,_that.total,_that.startedAt,_that.completedAt,_that.lastExerciseIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String levelId,  int score,  int total,  DateTime startedAt,  DateTime? completedAt,  int? lastExerciseIndex)?  $default,) {final _that = this;
switch (_that) {
case _LevelProgress() when $default != null:
return $default(_that.id,_that.levelId,_that.score,_that.total,_that.startedAt,_that.completedAt,_that.lastExerciseIndex);case _:
  return null;

}
}

}

/// @nodoc


class _LevelProgress extends LevelProgress with DiagnosticableTreeMixin {
  const _LevelProgress({required this.id, required this.levelId, required this.score, required this.total, required this.startedAt, this.completedAt, this.lastExerciseIndex}): super._();
  

@override final  String id;
@override final  String levelId;
@override final  int score;
@override final  int total;
@override final  DateTime startedAt;
@override final  DateTime? completedAt;
@override final  int? lastExerciseIndex;

/// Create a copy of LevelProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LevelProgressCopyWith<_LevelProgress> get copyWith => __$LevelProgressCopyWithImpl<_LevelProgress>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LevelProgress'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('levelId', levelId))..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('total', total))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('completedAt', completedAt))..add(DiagnosticsProperty('lastExerciseIndex', lastExerciseIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LevelProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.score, score) || other.score == score)&&(identical(other.total, total) || other.total == total)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.lastExerciseIndex, lastExerciseIndex) || other.lastExerciseIndex == lastExerciseIndex));
}


@override
int get hashCode => Object.hash(runtimeType,id,levelId,score,total,startedAt,completedAt,lastExerciseIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LevelProgress(id: $id, levelId: $levelId, score: $score, total: $total, startedAt: $startedAt, completedAt: $completedAt, lastExerciseIndex: $lastExerciseIndex)';
}


}

/// @nodoc
abstract mixin class _$LevelProgressCopyWith<$Res> implements $LevelProgressCopyWith<$Res> {
  factory _$LevelProgressCopyWith(_LevelProgress value, $Res Function(_LevelProgress) _then) = __$LevelProgressCopyWithImpl;
@override @useResult
$Res call({
 String id, String levelId, int score, int total, DateTime startedAt, DateTime? completedAt, int? lastExerciseIndex
});




}
/// @nodoc
class __$LevelProgressCopyWithImpl<$Res>
    implements _$LevelProgressCopyWith<$Res> {
  __$LevelProgressCopyWithImpl(this._self, this._then);

  final _LevelProgress _self;
  final $Res Function(_LevelProgress) _then;

/// Create a copy of LevelProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? levelId = null,Object? score = null,Object? total = null,Object? startedAt = null,Object? completedAt = freezed,Object? lastExerciseIndex = freezed,}) {
  return _then(_LevelProgress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastExerciseIndex: freezed == lastExerciseIndex ? _self.lastExerciseIndex : lastExerciseIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$ExerciseProgress implements DiagnosticableTreeMixin {

 String get id; String get exerciseId; int? get selectedIndex; bool get isCorrect; DateTime get startedAt; DateTime? get completedAt;
/// Create a copy of ExerciseProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseProgressCopyWith<ExerciseProgress> get copyWith => _$ExerciseProgressCopyWithImpl<ExerciseProgress>(this as ExerciseProgress, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ExerciseProgress'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('exerciseId', exerciseId))..add(DiagnosticsProperty('selectedIndex', selectedIndex))..add(DiagnosticsProperty('isCorrect', isCorrect))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('completedAt', completedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,exerciseId,selectedIndex,isCorrect,startedAt,completedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ExerciseProgress(id: $id, exerciseId: $exerciseId, selectedIndex: $selectedIndex, isCorrect: $isCorrect, startedAt: $startedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $ExerciseProgressCopyWith<$Res>  {
  factory $ExerciseProgressCopyWith(ExerciseProgress value, $Res Function(ExerciseProgress) _then) = _$ExerciseProgressCopyWithImpl;
@useResult
$Res call({
 String id, String exerciseId, int? selectedIndex, bool isCorrect, DateTime startedAt, DateTime? completedAt
});




}
/// @nodoc
class _$ExerciseProgressCopyWithImpl<$Res>
    implements $ExerciseProgressCopyWith<$Res> {
  _$ExerciseProgressCopyWithImpl(this._self, this._then);

  final ExerciseProgress _self;
  final $Res Function(ExerciseProgress) _then;

/// Create a copy of ExerciseProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? exerciseId = null,Object? selectedIndex = freezed,Object? isCorrect = null,Object? startedAt = null,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,selectedIndex: freezed == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseProgress].
extension ExerciseProgressPatterns on ExerciseProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseProgress value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseProgress value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String exerciseId,  int? selectedIndex,  bool isCorrect,  DateTime startedAt,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseProgress() when $default != null:
return $default(_that.id,_that.exerciseId,_that.selectedIndex,_that.isCorrect,_that.startedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String exerciseId,  int? selectedIndex,  bool isCorrect,  DateTime startedAt,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _ExerciseProgress():
return $default(_that.id,_that.exerciseId,_that.selectedIndex,_that.isCorrect,_that.startedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String exerciseId,  int? selectedIndex,  bool isCorrect,  DateTime startedAt,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseProgress() when $default != null:
return $default(_that.id,_that.exerciseId,_that.selectedIndex,_that.isCorrect,_that.startedAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ExerciseProgress extends ExerciseProgress with DiagnosticableTreeMixin {
  const _ExerciseProgress({required this.id, required this.exerciseId, this.selectedIndex, required this.isCorrect, required this.startedAt, required this.completedAt}): super._();
  

@override final  String id;
@override final  String exerciseId;
@override final  int? selectedIndex;
@override final  bool isCorrect;
@override final  DateTime startedAt;
@override final  DateTime? completedAt;

/// Create a copy of ExerciseProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseProgressCopyWith<_ExerciseProgress> get copyWith => __$ExerciseProgressCopyWithImpl<_ExerciseProgress>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ExerciseProgress'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('exerciseId', exerciseId))..add(DiagnosticsProperty('selectedIndex', selectedIndex))..add(DiagnosticsProperty('isCorrect', isCorrect))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('completedAt', completedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,exerciseId,selectedIndex,isCorrect,startedAt,completedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ExerciseProgress(id: $id, exerciseId: $exerciseId, selectedIndex: $selectedIndex, isCorrect: $isCorrect, startedAt: $startedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$ExerciseProgressCopyWith<$Res> implements $ExerciseProgressCopyWith<$Res> {
  factory _$ExerciseProgressCopyWith(_ExerciseProgress value, $Res Function(_ExerciseProgress) _then) = __$ExerciseProgressCopyWithImpl;
@override @useResult
$Res call({
 String id, String exerciseId, int? selectedIndex, bool isCorrect, DateTime startedAt, DateTime? completedAt
});




}
/// @nodoc
class __$ExerciseProgressCopyWithImpl<$Res>
    implements _$ExerciseProgressCopyWith<$Res> {
  __$ExerciseProgressCopyWithImpl(this._self, this._then);

  final _ExerciseProgress _self;
  final $Res Function(_ExerciseProgress) _then;

/// Create a copy of ExerciseProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? exerciseId = null,Object? selectedIndex = freezed,Object? isCorrect = null,Object? startedAt = null,Object? completedAt = freezed,}) {
  return _then(_ExerciseProgress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,selectedIndex: freezed == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
