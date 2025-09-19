// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
mixin _$CourseDaoMixin on DatabaseAccessor<AppDatabase> {
  $CourseSessionSchemaTable get courseSessionSchema =>
      attachedDatabase.courseSessionSchema;
}
mixin _$LevelDaoMixin on DatabaseAccessor<AppDatabase> {
  $CourseSessionSchemaTable get courseSessionSchema =>
      attachedDatabase.courseSessionSchema;
  $LevelProgressSchemaTable get levelProgressSchema =>
      attachedDatabase.levelProgressSchema;
}
mixin _$ExerciseDaoMixin on DatabaseAccessor<AppDatabase> {
  $CourseSessionSchemaTable get courseSessionSchema =>
      attachedDatabase.courseSessionSchema;
  $LevelProgressSchemaTable get levelProgressSchema =>
      attachedDatabase.levelProgressSchema;
  $ExerciseProgressSchemaTable get exerciseProgressSchema =>
      attachedDatabase.exerciseProgressSchema;
}

class $CourseSessionSchemaTable extends CourseSessionSchema
    with TableInfo<$CourseSessionSchemaTable, CourseSessionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseSessionSchemaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseIdMeta = const VerificationMeta(
    'courseId',
  );
  @override
  late final GeneratedColumn<String> courseId = GeneratedColumn<String>(
    'course_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastLevelIndexMeta = const VerificationMeta(
    'lastLevelIndex',
  );
  @override
  late final GeneratedColumn<int> lastLevelIndex = GeneratedColumn<int>(
    'last_level_index',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentVersionMeta = const VerificationMeta(
    'contentVersion',
  );
  @override
  late final GeneratedColumn<int> contentVersion = GeneratedColumn<int>(
    'content_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    courseId,
    startedAt,
    completedAt,
    lastLevelIndex,
    contentVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_session';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseSessionEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(
        _courseIdMeta,
        courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('last_level_index')) {
      context.handle(
        _lastLevelIndexMeta,
        lastLevelIndex.isAcceptableOrUnknown(
          data['last_level_index']!,
          _lastLevelIndexMeta,
        ),
      );
    }
    if (data.containsKey('content_version')) {
      context.handle(
        _contentVersionMeta,
        contentVersion.isAcceptableOrUnknown(
          data['content_version']!,
          _contentVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentVersionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseSessionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseSessionEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      courseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}course_id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      lastLevelIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_level_index'],
      ),
      contentVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}content_version'],
      )!,
    );
  }

  @override
  $CourseSessionSchemaTable createAlias(String alias) {
    return $CourseSessionSchemaTable(attachedDatabase, alias);
  }
}

class CourseSessionEntity extends DataClass
    implements Insertable<CourseSessionEntity> {
  final String id;
  final String courseId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int? lastLevelIndex;
  final int contentVersion;
  const CourseSessionEntity({
    required this.id,
    required this.courseId,
    required this.startedAt,
    this.completedAt,
    this.lastLevelIndex,
    required this.contentVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['course_id'] = Variable<String>(courseId);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || lastLevelIndex != null) {
      map['last_level_index'] = Variable<int>(lastLevelIndex);
    }
    map['content_version'] = Variable<int>(contentVersion);
    return map;
  }

  CourseSessionSchemaCompanion toCompanion(bool nullToAbsent) {
    return CourseSessionSchemaCompanion(
      id: Value(id),
      courseId: Value(courseId),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      lastLevelIndex: lastLevelIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLevelIndex),
      contentVersion: Value(contentVersion),
    );
  }

  factory CourseSessionEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseSessionEntity(
      id: serializer.fromJson<String>(json['id']),
      courseId: serializer.fromJson<String>(json['courseId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      lastLevelIndex: serializer.fromJson<int?>(json['lastLevelIndex']),
      contentVersion: serializer.fromJson<int>(json['contentVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'courseId': serializer.toJson<String>(courseId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'lastLevelIndex': serializer.toJson<int?>(lastLevelIndex),
      'contentVersion': serializer.toJson<int>(contentVersion),
    };
  }

  CourseSessionEntity copyWith({
    String? id,
    String? courseId,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<int?> lastLevelIndex = const Value.absent(),
    int? contentVersion,
  }) => CourseSessionEntity(
    id: id ?? this.id,
    courseId: courseId ?? this.courseId,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    lastLevelIndex: lastLevelIndex.present
        ? lastLevelIndex.value
        : this.lastLevelIndex,
    contentVersion: contentVersion ?? this.contentVersion,
  );
  CourseSessionEntity copyWithCompanion(CourseSessionSchemaCompanion data) {
    return CourseSessionEntity(
      id: data.id.present ? data.id.value : this.id,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      lastLevelIndex: data.lastLevelIndex.present
          ? data.lastLevelIndex.value
          : this.lastLevelIndex,
      contentVersion: data.contentVersion.present
          ? data.contentVersion.value
          : this.contentVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseSessionEntity(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('lastLevelIndex: $lastLevelIndex, ')
          ..write('contentVersion: $contentVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    courseId,
    startedAt,
    completedAt,
    lastLevelIndex,
    contentVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseSessionEntity &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.lastLevelIndex == this.lastLevelIndex &&
          other.contentVersion == this.contentVersion);
}

class CourseSessionSchemaCompanion
    extends UpdateCompanion<CourseSessionEntity> {
  final Value<String> id;
  final Value<String> courseId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int?> lastLevelIndex;
  final Value<int> contentVersion;
  final Value<int> rowid;
  const CourseSessionSchemaCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.lastLevelIndex = const Value.absent(),
    this.contentVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseSessionSchemaCompanion.insert({
    required String id,
    required String courseId,
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    this.lastLevelIndex = const Value.absent(),
    required int contentVersion,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       courseId = Value(courseId),
       startedAt = Value(startedAt),
       contentVersion = Value(contentVersion);
  static Insertable<CourseSessionEntity> custom({
    Expression<String>? id,
    Expression<String>? courseId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? lastLevelIndex,
    Expression<int>? contentVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (lastLevelIndex != null) 'last_level_index': lastLevelIndex,
      if (contentVersion != null) 'content_version': contentVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseSessionSchemaCompanion copyWith({
    Value<String>? id,
    Value<String>? courseId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<int?>? lastLevelIndex,
    Value<int>? contentVersion,
    Value<int>? rowid,
  }) {
    return CourseSessionSchemaCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      lastLevelIndex: lastLevelIndex ?? this.lastLevelIndex,
      contentVersion: contentVersion ?? this.contentVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<String>(courseId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (lastLevelIndex.present) {
      map['last_level_index'] = Variable<int>(lastLevelIndex.value);
    }
    if (contentVersion.present) {
      map['content_version'] = Variable<int>(contentVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseSessionSchemaCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('lastLevelIndex: $lastLevelIndex, ')
          ..write('contentVersion: $contentVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LevelProgressSchemaTable extends LevelProgressSchema
    with TableInfo<$LevelProgressSchemaTable, LevelProgressEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LevelProgressSchemaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelIdMeta = const VerificationMeta(
    'levelId',
  );
  @override
  late final GeneratedColumn<String> levelId = GeneratedColumn<String>(
    'level_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastExerciseIndexMeta = const VerificationMeta(
    'lastExerciseIndex',
  );
  @override
  late final GeneratedColumn<int> lastExerciseIndex = GeneratedColumn<int>(
    'last_exercise_index',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentVersionMeta = const VerificationMeta(
    'contentVersion',
  );
  @override
  late final GeneratedColumn<int> contentVersion = GeneratedColumn<int>(
    'content_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseSessionIdMeta = const VerificationMeta(
    'courseSessionId',
  );
  @override
  late final GeneratedColumn<String> courseSessionId = GeneratedColumn<String>(
    'course_session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES course_session (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    levelId,
    score,
    total,
    startedAt,
    completedAt,
    lastExerciseIndex,
    contentVersion,
    courseSessionId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'level_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<LevelProgressEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('level_id')) {
      context.handle(
        _levelIdMeta,
        levelId.isAcceptableOrUnknown(data['level_id']!, _levelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_levelIdMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('last_exercise_index')) {
      context.handle(
        _lastExerciseIndexMeta,
        lastExerciseIndex.isAcceptableOrUnknown(
          data['last_exercise_index']!,
          _lastExerciseIndexMeta,
        ),
      );
    }
    if (data.containsKey('content_version')) {
      context.handle(
        _contentVersionMeta,
        contentVersion.isAcceptableOrUnknown(
          data['content_version']!,
          _contentVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentVersionMeta);
    }
    if (data.containsKey('course_session_id')) {
      context.handle(
        _courseSessionIdMeta,
        courseSessionId.isAcceptableOrUnknown(
          data['course_session_id']!,
          _courseSessionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_courseSessionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LevelProgressEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LevelProgressEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      levelId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}level_id'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      lastExerciseIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_exercise_index'],
      ),
      contentVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}content_version'],
      )!,
      courseSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}course_session_id'],
      )!,
    );
  }

  @override
  $LevelProgressSchemaTable createAlias(String alias) {
    return $LevelProgressSchemaTable(attachedDatabase, alias);
  }
}

class LevelProgressEntity extends DataClass
    implements Insertable<LevelProgressEntity> {
  final String id;
  final String levelId;
  final int score;
  final int total;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int? lastExerciseIndex;
  final int contentVersion;
  final String courseSessionId;
  const LevelProgressEntity({
    required this.id,
    required this.levelId,
    required this.score,
    required this.total,
    required this.startedAt,
    this.completedAt,
    this.lastExerciseIndex,
    required this.contentVersion,
    required this.courseSessionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['level_id'] = Variable<String>(levelId);
    map['score'] = Variable<int>(score);
    map['total'] = Variable<int>(total);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || lastExerciseIndex != null) {
      map['last_exercise_index'] = Variable<int>(lastExerciseIndex);
    }
    map['content_version'] = Variable<int>(contentVersion);
    map['course_session_id'] = Variable<String>(courseSessionId);
    return map;
  }

  LevelProgressSchemaCompanion toCompanion(bool nullToAbsent) {
    return LevelProgressSchemaCompanion(
      id: Value(id),
      levelId: Value(levelId),
      score: Value(score),
      total: Value(total),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      lastExerciseIndex: lastExerciseIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(lastExerciseIndex),
      contentVersion: Value(contentVersion),
      courseSessionId: Value(courseSessionId),
    );
  }

  factory LevelProgressEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LevelProgressEntity(
      id: serializer.fromJson<String>(json['id']),
      levelId: serializer.fromJson<String>(json['levelId']),
      score: serializer.fromJson<int>(json['score']),
      total: serializer.fromJson<int>(json['total']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      lastExerciseIndex: serializer.fromJson<int?>(json['lastExerciseIndex']),
      contentVersion: serializer.fromJson<int>(json['contentVersion']),
      courseSessionId: serializer.fromJson<String>(json['courseSessionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'levelId': serializer.toJson<String>(levelId),
      'score': serializer.toJson<int>(score),
      'total': serializer.toJson<int>(total),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'lastExerciseIndex': serializer.toJson<int?>(lastExerciseIndex),
      'contentVersion': serializer.toJson<int>(contentVersion),
      'courseSessionId': serializer.toJson<String>(courseSessionId),
    };
  }

  LevelProgressEntity copyWith({
    String? id,
    String? levelId,
    int? score,
    int? total,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<int?> lastExerciseIndex = const Value.absent(),
    int? contentVersion,
    String? courseSessionId,
  }) => LevelProgressEntity(
    id: id ?? this.id,
    levelId: levelId ?? this.levelId,
    score: score ?? this.score,
    total: total ?? this.total,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    lastExerciseIndex: lastExerciseIndex.present
        ? lastExerciseIndex.value
        : this.lastExerciseIndex,
    contentVersion: contentVersion ?? this.contentVersion,
    courseSessionId: courseSessionId ?? this.courseSessionId,
  );
  LevelProgressEntity copyWithCompanion(LevelProgressSchemaCompanion data) {
    return LevelProgressEntity(
      id: data.id.present ? data.id.value : this.id,
      levelId: data.levelId.present ? data.levelId.value : this.levelId,
      score: data.score.present ? data.score.value : this.score,
      total: data.total.present ? data.total.value : this.total,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      lastExerciseIndex: data.lastExerciseIndex.present
          ? data.lastExerciseIndex.value
          : this.lastExerciseIndex,
      contentVersion: data.contentVersion.present
          ? data.contentVersion.value
          : this.contentVersion,
      courseSessionId: data.courseSessionId.present
          ? data.courseSessionId.value
          : this.courseSessionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LevelProgressEntity(')
          ..write('id: $id, ')
          ..write('levelId: $levelId, ')
          ..write('score: $score, ')
          ..write('total: $total, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('lastExerciseIndex: $lastExerciseIndex, ')
          ..write('contentVersion: $contentVersion, ')
          ..write('courseSessionId: $courseSessionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    levelId,
    score,
    total,
    startedAt,
    completedAt,
    lastExerciseIndex,
    contentVersion,
    courseSessionId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LevelProgressEntity &&
          other.id == this.id &&
          other.levelId == this.levelId &&
          other.score == this.score &&
          other.total == this.total &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.lastExerciseIndex == this.lastExerciseIndex &&
          other.contentVersion == this.contentVersion &&
          other.courseSessionId == this.courseSessionId);
}

class LevelProgressSchemaCompanion
    extends UpdateCompanion<LevelProgressEntity> {
  final Value<String> id;
  final Value<String> levelId;
  final Value<int> score;
  final Value<int> total;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int?> lastExerciseIndex;
  final Value<int> contentVersion;
  final Value<String> courseSessionId;
  final Value<int> rowid;
  const LevelProgressSchemaCompanion({
    this.id = const Value.absent(),
    this.levelId = const Value.absent(),
    this.score = const Value.absent(),
    this.total = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.lastExerciseIndex = const Value.absent(),
    this.contentVersion = const Value.absent(),
    this.courseSessionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LevelProgressSchemaCompanion.insert({
    required String id,
    required String levelId,
    required int score,
    required int total,
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    this.lastExerciseIndex = const Value.absent(),
    required int contentVersion,
    required String courseSessionId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       levelId = Value(levelId),
       score = Value(score),
       total = Value(total),
       startedAt = Value(startedAt),
       contentVersion = Value(contentVersion),
       courseSessionId = Value(courseSessionId);
  static Insertable<LevelProgressEntity> custom({
    Expression<String>? id,
    Expression<String>? levelId,
    Expression<int>? score,
    Expression<int>? total,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? lastExerciseIndex,
    Expression<int>? contentVersion,
    Expression<String>? courseSessionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (levelId != null) 'level_id': levelId,
      if (score != null) 'score': score,
      if (total != null) 'total': total,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (lastExerciseIndex != null) 'last_exercise_index': lastExerciseIndex,
      if (contentVersion != null) 'content_version': contentVersion,
      if (courseSessionId != null) 'course_session_id': courseSessionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LevelProgressSchemaCompanion copyWith({
    Value<String>? id,
    Value<String>? levelId,
    Value<int>? score,
    Value<int>? total,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<int?>? lastExerciseIndex,
    Value<int>? contentVersion,
    Value<String>? courseSessionId,
    Value<int>? rowid,
  }) {
    return LevelProgressSchemaCompanion(
      id: id ?? this.id,
      levelId: levelId ?? this.levelId,
      score: score ?? this.score,
      total: total ?? this.total,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      lastExerciseIndex: lastExerciseIndex ?? this.lastExerciseIndex,
      contentVersion: contentVersion ?? this.contentVersion,
      courseSessionId: courseSessionId ?? this.courseSessionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (levelId.present) {
      map['level_id'] = Variable<String>(levelId.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (lastExerciseIndex.present) {
      map['last_exercise_index'] = Variable<int>(lastExerciseIndex.value);
    }
    if (contentVersion.present) {
      map['content_version'] = Variable<int>(contentVersion.value);
    }
    if (courseSessionId.present) {
      map['course_session_id'] = Variable<String>(courseSessionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevelProgressSchemaCompanion(')
          ..write('id: $id, ')
          ..write('levelId: $levelId, ')
          ..write('score: $score, ')
          ..write('total: $total, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('lastExerciseIndex: $lastExerciseIndex, ')
          ..write('contentVersion: $contentVersion, ')
          ..write('courseSessionId: $courseSessionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseProgressSchemaTable extends ExerciseProgressSchema
    with TableInfo<$ExerciseProgressSchemaTable, ExerciseProgressEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseProgressSchemaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedIndexMeta = const VerificationMeta(
    'selectedIndex',
  );
  @override
  late final GeneratedColumn<int> selectedIndex = GeneratedColumn<int>(
    'selected_index',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCorrectMeta = const VerificationMeta(
    'isCorrect',
  );
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
    'is_correct',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_correct" IN (0, 1))',
    ),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _courseSessionIdMeta = const VerificationMeta(
    'courseSessionId',
  );
  @override
  late final GeneratedColumn<String> courseSessionId = GeneratedColumn<String>(
    'course_session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES course_session (id)',
    ),
  );
  static const VerificationMeta _levelProgressIdMeta = const VerificationMeta(
    'levelProgressId',
  );
  @override
  late final GeneratedColumn<String> levelProgressId = GeneratedColumn<String>(
    'level_progress_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES level_progress (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    exerciseId,
    selectedIndex,
    isCorrect,
    startedAt,
    completedAt,
    courseSessionId,
    levelProgressId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseProgressEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('selected_index')) {
      context.handle(
        _selectedIndexMeta,
        selectedIndex.isAcceptableOrUnknown(
          data['selected_index']!,
          _selectedIndexMeta,
        ),
      );
    }
    if (data.containsKey('is_correct')) {
      context.handle(
        _isCorrectMeta,
        isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta),
      );
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('course_session_id')) {
      context.handle(
        _courseSessionIdMeta,
        courseSessionId.isAcceptableOrUnknown(
          data['course_session_id']!,
          _courseSessionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_courseSessionIdMeta);
    }
    if (data.containsKey('level_progress_id')) {
      context.handle(
        _levelProgressIdMeta,
        levelProgressId.isAcceptableOrUnknown(
          data['level_progress_id']!,
          _levelProgressIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_levelProgressIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ExerciseProgressEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseProgressEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      selectedIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}selected_index'],
      ),
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      courseSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}course_session_id'],
      )!,
      levelProgressId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}level_progress_id'],
      )!,
    );
  }

  @override
  $ExerciseProgressSchemaTable createAlias(String alias) {
    return $ExerciseProgressSchemaTable(attachedDatabase, alias);
  }
}

class ExerciseProgressEntity extends DataClass
    implements Insertable<ExerciseProgressEntity> {
  final String id;
  final String exerciseId;
  final int? selectedIndex;
  final bool isCorrect;
  final DateTime startedAt;
  final DateTime? completedAt;
  final String courseSessionId;
  final String levelProgressId;
  const ExerciseProgressEntity({
    required this.id,
    required this.exerciseId,
    this.selectedIndex,
    required this.isCorrect,
    required this.startedAt,
    this.completedAt,
    required this.courseSessionId,
    required this.levelProgressId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['exercise_id'] = Variable<String>(exerciseId);
    if (!nullToAbsent || selectedIndex != null) {
      map['selected_index'] = Variable<int>(selectedIndex);
    }
    map['is_correct'] = Variable<bool>(isCorrect);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['course_session_id'] = Variable<String>(courseSessionId);
    map['level_progress_id'] = Variable<String>(levelProgressId);
    return map;
  }

  ExerciseProgressSchemaCompanion toCompanion(bool nullToAbsent) {
    return ExerciseProgressSchemaCompanion(
      id: Value(id),
      exerciseId: Value(exerciseId),
      selectedIndex: selectedIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedIndex),
      isCorrect: Value(isCorrect),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      courseSessionId: Value(courseSessionId),
      levelProgressId: Value(levelProgressId),
    );
  }

  factory ExerciseProgressEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseProgressEntity(
      id: serializer.fromJson<String>(json['id']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      selectedIndex: serializer.fromJson<int?>(json['selectedIndex']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      courseSessionId: serializer.fromJson<String>(json['courseSessionId']),
      levelProgressId: serializer.fromJson<String>(json['levelProgressId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'selectedIndex': serializer.toJson<int?>(selectedIndex),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'courseSessionId': serializer.toJson<String>(courseSessionId),
      'levelProgressId': serializer.toJson<String>(levelProgressId),
    };
  }

  ExerciseProgressEntity copyWith({
    String? id,
    String? exerciseId,
    Value<int?> selectedIndex = const Value.absent(),
    bool? isCorrect,
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    String? courseSessionId,
    String? levelProgressId,
  }) => ExerciseProgressEntity(
    id: id ?? this.id,
    exerciseId: exerciseId ?? this.exerciseId,
    selectedIndex: selectedIndex.present
        ? selectedIndex.value
        : this.selectedIndex,
    isCorrect: isCorrect ?? this.isCorrect,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    courseSessionId: courseSessionId ?? this.courseSessionId,
    levelProgressId: levelProgressId ?? this.levelProgressId,
  );
  ExerciseProgressEntity copyWithCompanion(
    ExerciseProgressSchemaCompanion data,
  ) {
    return ExerciseProgressEntity(
      id: data.id.present ? data.id.value : this.id,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      selectedIndex: data.selectedIndex.present
          ? data.selectedIndex.value
          : this.selectedIndex,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      courseSessionId: data.courseSessionId.present
          ? data.courseSessionId.value
          : this.courseSessionId,
      levelProgressId: data.levelProgressId.present
          ? data.levelProgressId.value
          : this.levelProgressId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseProgressEntity(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('selectedIndex: $selectedIndex, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('courseSessionId: $courseSessionId, ')
          ..write('levelProgressId: $levelProgressId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    exerciseId,
    selectedIndex,
    isCorrect,
    startedAt,
    completedAt,
    courseSessionId,
    levelProgressId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseProgressEntity &&
          other.id == this.id &&
          other.exerciseId == this.exerciseId &&
          other.selectedIndex == this.selectedIndex &&
          other.isCorrect == this.isCorrect &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.courseSessionId == this.courseSessionId &&
          other.levelProgressId == this.levelProgressId);
}

class ExerciseProgressSchemaCompanion
    extends UpdateCompanion<ExerciseProgressEntity> {
  final Value<String> id;
  final Value<String> exerciseId;
  final Value<int?> selectedIndex;
  final Value<bool> isCorrect;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<String> courseSessionId;
  final Value<String> levelProgressId;
  final Value<int> rowid;
  const ExerciseProgressSchemaCompanion({
    this.id = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.selectedIndex = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.courseSessionId = const Value.absent(),
    this.levelProgressId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseProgressSchemaCompanion.insert({
    required String id,
    required String exerciseId,
    this.selectedIndex = const Value.absent(),
    required bool isCorrect,
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    required String courseSessionId,
    required String levelProgressId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       exerciseId = Value(exerciseId),
       isCorrect = Value(isCorrect),
       startedAt = Value(startedAt),
       courseSessionId = Value(courseSessionId),
       levelProgressId = Value(levelProgressId);
  static Insertable<ExerciseProgressEntity> custom({
    Expression<String>? id,
    Expression<String>? exerciseId,
    Expression<int>? selectedIndex,
    Expression<bool>? isCorrect,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? courseSessionId,
    Expression<String>? levelProgressId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (selectedIndex != null) 'selected_index': selectedIndex,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (courseSessionId != null) 'course_session_id': courseSessionId,
      if (levelProgressId != null) 'level_progress_id': levelProgressId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseProgressSchemaCompanion copyWith({
    Value<String>? id,
    Value<String>? exerciseId,
    Value<int?>? selectedIndex,
    Value<bool>? isCorrect,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<String>? courseSessionId,
    Value<String>? levelProgressId,
    Value<int>? rowid,
  }) {
    return ExerciseProgressSchemaCompanion(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isCorrect: isCorrect ?? this.isCorrect,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      courseSessionId: courseSessionId ?? this.courseSessionId,
      levelProgressId: levelProgressId ?? this.levelProgressId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (selectedIndex.present) {
      map['selected_index'] = Variable<int>(selectedIndex.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (courseSessionId.present) {
      map['course_session_id'] = Variable<String>(courseSessionId.value);
    }
    if (levelProgressId.present) {
      map['level_progress_id'] = Variable<String>(levelProgressId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseProgressSchemaCompanion(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('selectedIndex: $selectedIndex, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('courseSessionId: $courseSessionId, ')
          ..write('levelProgressId: $levelProgressId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CourseSessionSchemaTable courseSessionSchema =
      $CourseSessionSchemaTable(this);
  late final $LevelProgressSchemaTable levelProgressSchema =
      $LevelProgressSchemaTable(this);
  late final $ExerciseProgressSchemaTable exerciseProgressSchema =
      $ExerciseProgressSchemaTable(this);
  late final Index courseIdIdx = Index(
    'course_id_idx',
    'CREATE INDEX course_id_idx ON course_session (course_id)',
  );
  late final Index courseCompletedIdx = Index(
    'course_completed_idx',
    'CREATE INDEX course_completed_idx ON course_session (completed_at)',
  );
  late final Index levelIdIdx = Index(
    'level_id_idx',
    'CREATE INDEX level_id_idx ON level_progress (level_id)',
  );
  late final Index levelCompletedIdx = Index(
    'level_completed_idx',
    'CREATE INDEX level_completed_idx ON level_progress (completed_at)',
  );
  late final Index exerciseIdIdx = Index(
    'exercise_id_idx',
    'CREATE INDEX exercise_id_idx ON exercise_progress (exercise_id)',
  );
  late final Index exerciseCompletedIdx = Index(
    'exercise_completed_idx',
    'CREATE INDEX exercise_completed_idx ON exercise_progress (completed_at)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    courseSessionSchema,
    levelProgressSchema,
    exerciseProgressSchema,
    courseIdIdx,
    courseCompletedIdx,
    levelIdIdx,
    levelCompletedIdx,
    exerciseIdIdx,
    exerciseCompletedIdx,
  ];
}

typedef $$CourseSessionSchemaTableCreateCompanionBuilder =
    CourseSessionSchemaCompanion Function({
      required String id,
      required String courseId,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      Value<int?> lastLevelIndex,
      required int contentVersion,
      Value<int> rowid,
    });
typedef $$CourseSessionSchemaTableUpdateCompanionBuilder =
    CourseSessionSchemaCompanion Function({
      Value<String> id,
      Value<String> courseId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<int?> lastLevelIndex,
      Value<int> contentVersion,
      Value<int> rowid,
    });

final class $$CourseSessionSchemaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CourseSessionSchemaTable,
          CourseSessionEntity
        > {
  $$CourseSessionSchemaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $LevelProgressSchemaTable,
    List<LevelProgressEntity>
  >
  _levelProgressSchemaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.levelProgressSchema,
        aliasName: $_aliasNameGenerator(
          db.courseSessionSchema.id,
          db.levelProgressSchema.courseSessionId,
        ),
      );

  $$LevelProgressSchemaTableProcessedTableManager get levelProgressSchemaRefs {
    final manager =
        $$LevelProgressSchemaTableTableManager(
          $_db,
          $_db.levelProgressSchema,
        ).filter(
          (f) => f.courseSessionId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _levelProgressSchemaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExerciseProgressSchemaTable,
    List<ExerciseProgressEntity>
  >
  _exerciseProgressSchemaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exerciseProgressSchema,
        aliasName: $_aliasNameGenerator(
          db.courseSessionSchema.id,
          db.exerciseProgressSchema.courseSessionId,
        ),
      );

  $$ExerciseProgressSchemaTableProcessedTableManager
  get exerciseProgressSchemaRefs {
    final manager =
        $$ExerciseProgressSchemaTableTableManager(
          $_db,
          $_db.exerciseProgressSchema,
        ).filter(
          (f) => f.courseSessionId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _exerciseProgressSchemaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CourseSessionSchemaTableFilterComposer
    extends Composer<_$AppDatabase, $CourseSessionSchemaTable> {
  $$CourseSessionSchemaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastLevelIndex => $composableBuilder(
    column: $table.lastLevelIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> levelProgressSchemaRefs(
    Expression<bool> Function($$LevelProgressSchemaTableFilterComposer f) f,
  ) {
    final $$LevelProgressSchemaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.levelProgressSchema,
      getReferencedColumn: (t) => t.courseSessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelProgressSchemaTableFilterComposer(
            $db: $db,
            $table: $db.levelProgressSchema,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> exerciseProgressSchemaRefs(
    Expression<bool> Function($$ExerciseProgressSchemaTableFilterComposer f) f,
  ) {
    final $$ExerciseProgressSchemaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseProgressSchema,
          getReferencedColumn: (t) => t.courseSessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseProgressSchemaTableFilterComposer(
                $db: $db,
                $table: $db.exerciseProgressSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CourseSessionSchemaTableOrderingComposer
    extends Composer<_$AppDatabase, $CourseSessionSchemaTable> {
  $$CourseSessionSchemaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseId => $composableBuilder(
    column: $table.courseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastLevelIndex => $composableBuilder(
    column: $table.lastLevelIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CourseSessionSchemaTableAnnotationComposer
    extends Composer<_$AppDatabase, $CourseSessionSchemaTable> {
  $$CourseSessionSchemaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get courseId =>
      $composableBuilder(column: $table.courseId, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastLevelIndex => $composableBuilder(
    column: $table.lastLevelIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => column,
  );

  Expression<T> levelProgressSchemaRefs<T extends Object>(
    Expression<T> Function($$LevelProgressSchemaTableAnnotationComposer a) f,
  ) {
    final $$LevelProgressSchemaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.levelProgressSchema,
          getReferencedColumn: (t) => t.courseSessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$LevelProgressSchemaTableAnnotationComposer(
                $db: $db,
                $table: $db.levelProgressSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> exerciseProgressSchemaRefs<T extends Object>(
    Expression<T> Function($$ExerciseProgressSchemaTableAnnotationComposer a) f,
  ) {
    final $$ExerciseProgressSchemaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseProgressSchema,
          getReferencedColumn: (t) => t.courseSessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseProgressSchemaTableAnnotationComposer(
                $db: $db,
                $table: $db.exerciseProgressSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CourseSessionSchemaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CourseSessionSchemaTable,
          CourseSessionEntity,
          $$CourseSessionSchemaTableFilterComposer,
          $$CourseSessionSchemaTableOrderingComposer,
          $$CourseSessionSchemaTableAnnotationComposer,
          $$CourseSessionSchemaTableCreateCompanionBuilder,
          $$CourseSessionSchemaTableUpdateCompanionBuilder,
          (CourseSessionEntity, $$CourseSessionSchemaTableReferences),
          CourseSessionEntity,
          PrefetchHooks Function({
            bool levelProgressSchemaRefs,
            bool exerciseProgressSchemaRefs,
          })
        > {
  $$CourseSessionSchemaTableTableManager(
    _$AppDatabase db,
    $CourseSessionSchemaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseSessionSchemaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseSessionSchemaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CourseSessionSchemaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> courseId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int?> lastLevelIndex = const Value.absent(),
                Value<int> contentVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CourseSessionSchemaCompanion(
                id: id,
                courseId: courseId,
                startedAt: startedAt,
                completedAt: completedAt,
                lastLevelIndex: lastLevelIndex,
                contentVersion: contentVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String courseId,
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int?> lastLevelIndex = const Value.absent(),
                required int contentVersion,
                Value<int> rowid = const Value.absent(),
              }) => CourseSessionSchemaCompanion.insert(
                id: id,
                courseId: courseId,
                startedAt: startedAt,
                completedAt: completedAt,
                lastLevelIndex: lastLevelIndex,
                contentVersion: contentVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CourseSessionSchemaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                levelProgressSchemaRefs = false,
                exerciseProgressSchemaRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (levelProgressSchemaRefs) db.levelProgressSchema,
                    if (exerciseProgressSchemaRefs) db.exerciseProgressSchema,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (levelProgressSchemaRefs)
                        await $_getPrefetchedData<
                          CourseSessionEntity,
                          $CourseSessionSchemaTable,
                          LevelProgressEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CourseSessionSchemaTableReferences
                              ._levelProgressSchemaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CourseSessionSchemaTableReferences(
                                db,
                                table,
                                p0,
                              ).levelProgressSchemaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.courseSessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (exerciseProgressSchemaRefs)
                        await $_getPrefetchedData<
                          CourseSessionEntity,
                          $CourseSessionSchemaTable,
                          ExerciseProgressEntity
                        >(
                          currentTable: table,
                          referencedTable: $$CourseSessionSchemaTableReferences
                              ._exerciseProgressSchemaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CourseSessionSchemaTableReferences(
                                db,
                                table,
                                p0,
                              ).exerciseProgressSchemaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.courseSessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CourseSessionSchemaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CourseSessionSchemaTable,
      CourseSessionEntity,
      $$CourseSessionSchemaTableFilterComposer,
      $$CourseSessionSchemaTableOrderingComposer,
      $$CourseSessionSchemaTableAnnotationComposer,
      $$CourseSessionSchemaTableCreateCompanionBuilder,
      $$CourseSessionSchemaTableUpdateCompanionBuilder,
      (CourseSessionEntity, $$CourseSessionSchemaTableReferences),
      CourseSessionEntity,
      PrefetchHooks Function({
        bool levelProgressSchemaRefs,
        bool exerciseProgressSchemaRefs,
      })
    >;
typedef $$LevelProgressSchemaTableCreateCompanionBuilder =
    LevelProgressSchemaCompanion Function({
      required String id,
      required String levelId,
      required int score,
      required int total,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      Value<int?> lastExerciseIndex,
      required int contentVersion,
      required String courseSessionId,
      Value<int> rowid,
    });
typedef $$LevelProgressSchemaTableUpdateCompanionBuilder =
    LevelProgressSchemaCompanion Function({
      Value<String> id,
      Value<String> levelId,
      Value<int> score,
      Value<int> total,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<int?> lastExerciseIndex,
      Value<int> contentVersion,
      Value<String> courseSessionId,
      Value<int> rowid,
    });

final class $$LevelProgressSchemaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $LevelProgressSchemaTable,
          LevelProgressEntity
        > {
  $$LevelProgressSchemaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CourseSessionSchemaTable _courseSessionIdTable(_$AppDatabase db) =>
      db.courseSessionSchema.createAlias(
        $_aliasNameGenerator(
          db.levelProgressSchema.courseSessionId,
          db.courseSessionSchema.id,
        ),
      );

  $$CourseSessionSchemaTableProcessedTableManager get courseSessionId {
    final $_column = $_itemColumn<String>('course_session_id')!;

    final manager = $$CourseSessionSchemaTableTableManager(
      $_db,
      $_db.courseSessionSchema,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseSessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ExerciseProgressSchemaTable,
    List<ExerciseProgressEntity>
  >
  _exerciseProgressSchemaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exerciseProgressSchema,
        aliasName: $_aliasNameGenerator(
          db.levelProgressSchema.id,
          db.exerciseProgressSchema.levelProgressId,
        ),
      );

  $$ExerciseProgressSchemaTableProcessedTableManager
  get exerciseProgressSchemaRefs {
    final manager =
        $$ExerciseProgressSchemaTableTableManager(
          $_db,
          $_db.exerciseProgressSchema,
        ).filter(
          (f) => f.levelProgressId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _exerciseProgressSchemaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LevelProgressSchemaTableFilterComposer
    extends Composer<_$AppDatabase, $LevelProgressSchemaTable> {
  $$LevelProgressSchemaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get levelId => $composableBuilder(
    column: $table.levelId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastExerciseIndex => $composableBuilder(
    column: $table.lastExerciseIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnFilters(column),
  );

  $$CourseSessionSchemaTableFilterComposer get courseSessionId {
    final $$CourseSessionSchemaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseSessionId,
      referencedTable: $db.courseSessionSchema,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseSessionSchemaTableFilterComposer(
            $db: $db,
            $table: $db.courseSessionSchema,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> exerciseProgressSchemaRefs(
    Expression<bool> Function($$ExerciseProgressSchemaTableFilterComposer f) f,
  ) {
    final $$ExerciseProgressSchemaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseProgressSchema,
          getReferencedColumn: (t) => t.levelProgressId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseProgressSchemaTableFilterComposer(
                $db: $db,
                $table: $db.exerciseProgressSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$LevelProgressSchemaTableOrderingComposer
    extends Composer<_$AppDatabase, $LevelProgressSchemaTable> {
  $$LevelProgressSchemaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get levelId => $composableBuilder(
    column: $table.levelId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastExerciseIndex => $composableBuilder(
    column: $table.lastExerciseIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnOrderings(column),
  );

  $$CourseSessionSchemaTableOrderingComposer get courseSessionId {
    final $$CourseSessionSchemaTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.courseSessionId,
          referencedTable: $db.courseSessionSchema,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CourseSessionSchemaTableOrderingComposer(
                $db: $db,
                $table: $db.courseSessionSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$LevelProgressSchemaTableAnnotationComposer
    extends Composer<_$AppDatabase, $LevelProgressSchemaTable> {
  $$LevelProgressSchemaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get levelId =>
      $composableBuilder(column: $table.levelId, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastExerciseIndex => $composableBuilder(
    column: $table.lastExerciseIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => column,
  );

  $$CourseSessionSchemaTableAnnotationComposer get courseSessionId {
    final $$CourseSessionSchemaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.courseSessionId,
          referencedTable: $db.courseSessionSchema,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CourseSessionSchemaTableAnnotationComposer(
                $db: $db,
                $table: $db.courseSessionSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> exerciseProgressSchemaRefs<T extends Object>(
    Expression<T> Function($$ExerciseProgressSchemaTableAnnotationComposer a) f,
  ) {
    final $$ExerciseProgressSchemaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseProgressSchema,
          getReferencedColumn: (t) => t.levelProgressId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseProgressSchemaTableAnnotationComposer(
                $db: $db,
                $table: $db.exerciseProgressSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$LevelProgressSchemaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LevelProgressSchemaTable,
          LevelProgressEntity,
          $$LevelProgressSchemaTableFilterComposer,
          $$LevelProgressSchemaTableOrderingComposer,
          $$LevelProgressSchemaTableAnnotationComposer,
          $$LevelProgressSchemaTableCreateCompanionBuilder,
          $$LevelProgressSchemaTableUpdateCompanionBuilder,
          (LevelProgressEntity, $$LevelProgressSchemaTableReferences),
          LevelProgressEntity,
          PrefetchHooks Function({
            bool courseSessionId,
            bool exerciseProgressSchemaRefs,
          })
        > {
  $$LevelProgressSchemaTableTableManager(
    _$AppDatabase db,
    $LevelProgressSchemaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LevelProgressSchemaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LevelProgressSchemaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LevelProgressSchemaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> levelId = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int?> lastExerciseIndex = const Value.absent(),
                Value<int> contentVersion = const Value.absent(),
                Value<String> courseSessionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LevelProgressSchemaCompanion(
                id: id,
                levelId: levelId,
                score: score,
                total: total,
                startedAt: startedAt,
                completedAt: completedAt,
                lastExerciseIndex: lastExerciseIndex,
                contentVersion: contentVersion,
                courseSessionId: courseSessionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String levelId,
                required int score,
                required int total,
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int?> lastExerciseIndex = const Value.absent(),
                required int contentVersion,
                required String courseSessionId,
                Value<int> rowid = const Value.absent(),
              }) => LevelProgressSchemaCompanion.insert(
                id: id,
                levelId: levelId,
                score: score,
                total: total,
                startedAt: startedAt,
                completedAt: completedAt,
                lastExerciseIndex: lastExerciseIndex,
                contentVersion: contentVersion,
                courseSessionId: courseSessionId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LevelProgressSchemaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({courseSessionId = false, exerciseProgressSchemaRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (exerciseProgressSchemaRefs) db.exerciseProgressSchema,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (courseSessionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.courseSessionId,
                                    referencedTable:
                                        $$LevelProgressSchemaTableReferences
                                            ._courseSessionIdTable(db),
                                    referencedColumn:
                                        $$LevelProgressSchemaTableReferences
                                            ._courseSessionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (exerciseProgressSchemaRefs)
                        await $_getPrefetchedData<
                          LevelProgressEntity,
                          $LevelProgressSchemaTable,
                          ExerciseProgressEntity
                        >(
                          currentTable: table,
                          referencedTable: $$LevelProgressSchemaTableReferences
                              ._exerciseProgressSchemaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LevelProgressSchemaTableReferences(
                                db,
                                table,
                                p0,
                              ).exerciseProgressSchemaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.levelProgressId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LevelProgressSchemaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LevelProgressSchemaTable,
      LevelProgressEntity,
      $$LevelProgressSchemaTableFilterComposer,
      $$LevelProgressSchemaTableOrderingComposer,
      $$LevelProgressSchemaTableAnnotationComposer,
      $$LevelProgressSchemaTableCreateCompanionBuilder,
      $$LevelProgressSchemaTableUpdateCompanionBuilder,
      (LevelProgressEntity, $$LevelProgressSchemaTableReferences),
      LevelProgressEntity,
      PrefetchHooks Function({
        bool courseSessionId,
        bool exerciseProgressSchemaRefs,
      })
    >;
typedef $$ExerciseProgressSchemaTableCreateCompanionBuilder =
    ExerciseProgressSchemaCompanion Function({
      required String id,
      required String exerciseId,
      Value<int?> selectedIndex,
      required bool isCorrect,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      required String courseSessionId,
      required String levelProgressId,
      Value<int> rowid,
    });
typedef $$ExerciseProgressSchemaTableUpdateCompanionBuilder =
    ExerciseProgressSchemaCompanion Function({
      Value<String> id,
      Value<String> exerciseId,
      Value<int?> selectedIndex,
      Value<bool> isCorrect,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<String> courseSessionId,
      Value<String> levelProgressId,
      Value<int> rowid,
    });

final class $$ExerciseProgressSchemaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExerciseProgressSchemaTable,
          ExerciseProgressEntity
        > {
  $$ExerciseProgressSchemaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CourseSessionSchemaTable _courseSessionIdTable(_$AppDatabase db) =>
      db.courseSessionSchema.createAlias(
        $_aliasNameGenerator(
          db.exerciseProgressSchema.courseSessionId,
          db.courseSessionSchema.id,
        ),
      );

  $$CourseSessionSchemaTableProcessedTableManager get courseSessionId {
    final $_column = $_itemColumn<String>('course_session_id')!;

    final manager = $$CourseSessionSchemaTableTableManager(
      $_db,
      $_db.courseSessionSchema,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseSessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LevelProgressSchemaTable _levelProgressIdTable(_$AppDatabase db) =>
      db.levelProgressSchema.createAlias(
        $_aliasNameGenerator(
          db.exerciseProgressSchema.levelProgressId,
          db.levelProgressSchema.id,
        ),
      );

  $$LevelProgressSchemaTableProcessedTableManager get levelProgressId {
    final $_column = $_itemColumn<String>('level_progress_id')!;

    final manager = $$LevelProgressSchemaTableTableManager(
      $_db,
      $_db.levelProgressSchema,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_levelProgressIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExerciseProgressSchemaTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseProgressSchemaTable> {
  $$ExerciseProgressSchemaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get selectedIndex => $composableBuilder(
    column: $table.selectedIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CourseSessionSchemaTableFilterComposer get courseSessionId {
    final $$CourseSessionSchemaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.courseSessionId,
      referencedTable: $db.courseSessionSchema,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CourseSessionSchemaTableFilterComposer(
            $db: $db,
            $table: $db.courseSessionSchema,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LevelProgressSchemaTableFilterComposer get levelProgressId {
    final $$LevelProgressSchemaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.levelProgressId,
      referencedTable: $db.levelProgressSchema,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelProgressSchemaTableFilterComposer(
            $db: $db,
            $table: $db.levelProgressSchema,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExerciseProgressSchemaTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseProgressSchemaTable> {
  $$ExerciseProgressSchemaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get selectedIndex => $composableBuilder(
    column: $table.selectedIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CourseSessionSchemaTableOrderingComposer get courseSessionId {
    final $$CourseSessionSchemaTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.courseSessionId,
          referencedTable: $db.courseSessionSchema,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CourseSessionSchemaTableOrderingComposer(
                $db: $db,
                $table: $db.courseSessionSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$LevelProgressSchemaTableOrderingComposer get levelProgressId {
    final $$LevelProgressSchemaTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.levelProgressId,
          referencedTable: $db.levelProgressSchema,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$LevelProgressSchemaTableOrderingComposer(
                $db: $db,
                $table: $db.levelProgressSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ExerciseProgressSchemaTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseProgressSchemaTable> {
  $$ExerciseProgressSchemaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get selectedIndex => $composableBuilder(
    column: $table.selectedIndex,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  $$CourseSessionSchemaTableAnnotationComposer get courseSessionId {
    final $$CourseSessionSchemaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.courseSessionId,
          referencedTable: $db.courseSessionSchema,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CourseSessionSchemaTableAnnotationComposer(
                $db: $db,
                $table: $db.courseSessionSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$LevelProgressSchemaTableAnnotationComposer get levelProgressId {
    final $$LevelProgressSchemaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.levelProgressId,
          referencedTable: $db.levelProgressSchema,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$LevelProgressSchemaTableAnnotationComposer(
                $db: $db,
                $table: $db.levelProgressSchema,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ExerciseProgressSchemaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseProgressSchemaTable,
          ExerciseProgressEntity,
          $$ExerciseProgressSchemaTableFilterComposer,
          $$ExerciseProgressSchemaTableOrderingComposer,
          $$ExerciseProgressSchemaTableAnnotationComposer,
          $$ExerciseProgressSchemaTableCreateCompanionBuilder,
          $$ExerciseProgressSchemaTableUpdateCompanionBuilder,
          (ExerciseProgressEntity, $$ExerciseProgressSchemaTableReferences),
          ExerciseProgressEntity,
          PrefetchHooks Function({bool courseSessionId, bool levelProgressId})
        > {
  $$ExerciseProgressSchemaTableTableManager(
    _$AppDatabase db,
    $ExerciseProgressSchemaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseProgressSchemaTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ExerciseProgressSchemaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ExerciseProgressSchemaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int?> selectedIndex = const Value.absent(),
                Value<bool> isCorrect = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String> courseSessionId = const Value.absent(),
                Value<String> levelProgressId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseProgressSchemaCompanion(
                id: id,
                exerciseId: exerciseId,
                selectedIndex: selectedIndex,
                isCorrect: isCorrect,
                startedAt: startedAt,
                completedAt: completedAt,
                courseSessionId: courseSessionId,
                levelProgressId: levelProgressId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String exerciseId,
                Value<int?> selectedIndex = const Value.absent(),
                required bool isCorrect,
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                required String courseSessionId,
                required String levelProgressId,
                Value<int> rowid = const Value.absent(),
              }) => ExerciseProgressSchemaCompanion.insert(
                id: id,
                exerciseId: exerciseId,
                selectedIndex: selectedIndex,
                isCorrect: isCorrect,
                startedAt: startedAt,
                completedAt: completedAt,
                courseSessionId: courseSessionId,
                levelProgressId: levelProgressId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExerciseProgressSchemaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({courseSessionId = false, levelProgressId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (courseSessionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.courseSessionId,
                                    referencedTable:
                                        $$ExerciseProgressSchemaTableReferences
                                            ._courseSessionIdTable(db),
                                    referencedColumn:
                                        $$ExerciseProgressSchemaTableReferences
                                            ._courseSessionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (levelProgressId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.levelProgressId,
                                    referencedTable:
                                        $$ExerciseProgressSchemaTableReferences
                                            ._levelProgressIdTable(db),
                                    referencedColumn:
                                        $$ExerciseProgressSchemaTableReferences
                                            ._levelProgressIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ExerciseProgressSchemaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseProgressSchemaTable,
      ExerciseProgressEntity,
      $$ExerciseProgressSchemaTableFilterComposer,
      $$ExerciseProgressSchemaTableOrderingComposer,
      $$ExerciseProgressSchemaTableAnnotationComposer,
      $$ExerciseProgressSchemaTableCreateCompanionBuilder,
      $$ExerciseProgressSchemaTableUpdateCompanionBuilder,
      (ExerciseProgressEntity, $$ExerciseProgressSchemaTableReferences),
      ExerciseProgressEntity,
      PrefetchHooks Function({bool courseSessionId, bool levelProgressId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CourseSessionSchemaTableTableManager get courseSessionSchema =>
      $$CourseSessionSchemaTableTableManager(_db, _db.courseSessionSchema);
  $$LevelProgressSchemaTableTableManager get levelProgressSchema =>
      $$LevelProgressSchemaTableTableManager(_db, _db.levelProgressSchema);
  $$ExerciseProgressSchemaTableTableManager get exerciseProgressSchema =>
      $$ExerciseProgressSchemaTableTableManager(
        _db,
        _db.exerciseProgressSchema,
      );
}
