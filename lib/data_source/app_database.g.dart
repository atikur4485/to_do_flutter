// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ToDoTableTable extends ToDoTable with TableInfo<$ToDoTableTable, ToDo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToDoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompleteMeta = const VerificationMeta(
    'isComplete',
  );
  @override
  late final GeneratedColumn<bool> isComplete = GeneratedColumn<bool>(
    'is_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, isComplete];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'to_do_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ToDo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_complete')) {
      context.handle(
        _isCompleteMeta,
        isComplete.isAcceptableOrUnknown(data['is_complete']!, _isCompleteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToDo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ToDo(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      isComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_complete'],
      )!,
    );
  }

  @override
  $ToDoTableTable createAlias(String alias) {
    return $ToDoTableTable(attachedDatabase, alias);
  }
}

class ToDo extends DataClass implements Insertable<ToDo> {
  final int id;
  final String name;
  final String description;
  final bool isComplete;
  const ToDo({
    required this.id,
    required this.name,
    required this.description,
    required this.isComplete,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['is_complete'] = Variable<bool>(isComplete);
    return map;
  }

  ToDoTableCompanion toCompanion(bool nullToAbsent) {
    return ToDoTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      isComplete: Value(isComplete),
    );
  }

  factory ToDo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ToDo(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'isComplete': serializer.toJson<bool>(isComplete),
    };
  }

  ToDo copyWith({
    int? id,
    String? name,
    String? description,
    bool? isComplete,
  }) => ToDo(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    isComplete: isComplete ?? this.isComplete,
  );
  ToDo copyWithCompanion(ToDoTableCompanion data) {
    return ToDo(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isComplete: data.isComplete.present
          ? data.isComplete.value
          : this.isComplete,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ToDo(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, isComplete);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToDo &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isComplete == this.isComplete);
}

class ToDoTableCompanion extends UpdateCompanion<ToDo> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<bool> isComplete;
  const ToDoTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isComplete = const Value.absent(),
  });
  ToDoTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.isComplete = const Value.absent(),
  }) : name = Value(name),
       description = Value(description);
  static Insertable<ToDo> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isComplete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isComplete != null) 'is_complete': isComplete,
    });
  }

  ToDoTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<bool>? isComplete,
  }) {
    return ToDoTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ToDoTableTable toDoTable = $ToDoTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toDoTable];
}

typedef $$ToDoTableTableCreateCompanionBuilder =
    ToDoTableCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      Value<bool> isComplete,
    });
typedef $$ToDoTableTableUpdateCompanionBuilder =
    ToDoTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<bool> isComplete,
    });

class $$ToDoTableTableFilterComposer
    extends Composer<_$AppDatabase, $ToDoTableTable> {
  $$ToDoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ToDoTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ToDoTableTable> {
  $$ToDoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ToDoTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ToDoTableTable> {
  $$ToDoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => column,
  );
}

class $$ToDoTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ToDoTableTable,
          ToDo,
          $$ToDoTableTableFilterComposer,
          $$ToDoTableTableOrderingComposer,
          $$ToDoTableTableAnnotationComposer,
          $$ToDoTableTableCreateCompanionBuilder,
          $$ToDoTableTableUpdateCompanionBuilder,
          (ToDo, BaseReferences<_$AppDatabase, $ToDoTableTable, ToDo>),
          ToDo,
          PrefetchHooks Function()
        > {
  $$ToDoTableTableTableManager(_$AppDatabase db, $ToDoTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ToDoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ToDoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ToDoTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> isComplete = const Value.absent(),
              }) => ToDoTableCompanion(
                id: id,
                name: name,
                description: description,
                isComplete: isComplete,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                Value<bool> isComplete = const Value.absent(),
              }) => ToDoTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                isComplete: isComplete,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ToDoTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ToDoTableTable,
      ToDo,
      $$ToDoTableTableFilterComposer,
      $$ToDoTableTableOrderingComposer,
      $$ToDoTableTableAnnotationComposer,
      $$ToDoTableTableCreateCompanionBuilder,
      $$ToDoTableTableUpdateCompanionBuilder,
      (ToDo, BaseReferences<_$AppDatabase, $ToDoTableTable, ToDo>),
      ToDo,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ToDoTableTableTableManager get toDoTable =>
      $$ToDoTableTableTableManager(_db, _db.toDoTable);
}
