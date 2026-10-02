// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MessesTable extends Messes with TableInfo<$MessesTable, MessesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _managerNameMeta = const VerificationMeta(
    'managerName',
  );
  @override
  late final GeneratedColumn<String> managerName = GeneratedColumn<String>(
    'manager_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _managerPhoneMeta = const VerificationMeta(
    'managerPhone',
  );
  @override
  late final GeneratedColumn<String> managerPhone = GeneratedColumn<String>(
    'manager_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('BDT'),
  );
  static const VerificationMeta _defaultLanguageMeta = const VerificationMeta(
    'defaultLanguage',
  );
  @override
  late final GeneratedColumn<String> defaultLanguage = GeneratedColumn<String>(
    'default_language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('bn'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    address,
    managerName,
    managerPhone,
    currencyCode,
    defaultLanguage,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messes';
  @override
  VerificationContext validateIntegrity(
    Insertable<MessesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('manager_name')) {
      context.handle(
        _managerNameMeta,
        managerName.isAcceptableOrUnknown(
          data['manager_name']!,
          _managerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_managerNameMeta);
    }
    if (data.containsKey('manager_phone')) {
      context.handle(
        _managerPhoneMeta,
        managerPhone.isAcceptableOrUnknown(
          data['manager_phone']!,
          _managerPhoneMeta,
        ),
      );
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('default_language')) {
      context.handle(
        _defaultLanguageMeta,
        defaultLanguage.isAcceptableOrUnknown(
          data['default_language']!,
          _defaultLanguageMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MessesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessesData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      managerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manager_name'],
      )!,
      managerPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manager_phone'],
      ),
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      defaultLanguage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_language'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MessesTable createAlias(String alias) {
    return $MessesTable(attachedDatabase, alias);
  }
}

class MessesData extends DataClass implements Insertable<MessesData> {
  final String id;
  final String name;
  final String? address;
  final String managerName;
  final String? managerPhone;
  final String currencyCode;
  final String defaultLanguage;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MessesData({
    required this.id,
    required this.name,
    this.address,
    required this.managerName,
    this.managerPhone,
    required this.currencyCode,
    required this.defaultLanguage,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['manager_name'] = Variable<String>(managerName);
    if (!nullToAbsent || managerPhone != null) {
      map['manager_phone'] = Variable<String>(managerPhone);
    }
    map['currency_code'] = Variable<String>(currencyCode);
    map['default_language'] = Variable<String>(defaultLanguage);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MessesCompanion toCompanion(bool nullToAbsent) {
    return MessesCompanion(
      id: Value(id),
      name: Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      managerName: Value(managerName),
      managerPhone: managerPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(managerPhone),
      currencyCode: Value(currencyCode),
      defaultLanguage: Value(defaultLanguage),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MessesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessesData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      managerName: serializer.fromJson<String>(json['managerName']),
      managerPhone: serializer.fromJson<String?>(json['managerPhone']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      defaultLanguage: serializer.fromJson<String>(json['defaultLanguage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String?>(address),
      'managerName': serializer.toJson<String>(managerName),
      'managerPhone': serializer.toJson<String?>(managerPhone),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'defaultLanguage': serializer.toJson<String>(defaultLanguage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MessesData copyWith({
    String? id,
    String? name,
    Value<String?> address = const Value.absent(),
    String? managerName,
    Value<String?> managerPhone = const Value.absent(),
    String? currencyCode,
    String? defaultLanguage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MessesData(
    id: id ?? this.id,
    name: name ?? this.name,
    address: address.present ? address.value : this.address,
    managerName: managerName ?? this.managerName,
    managerPhone: managerPhone.present ? managerPhone.value : this.managerPhone,
    currencyCode: currencyCode ?? this.currencyCode,
    defaultLanguage: defaultLanguage ?? this.defaultLanguage,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MessesData copyWithCompanion(MessesCompanion data) {
    return MessesData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      managerName: data.managerName.present
          ? data.managerName.value
          : this.managerName,
      managerPhone: data.managerPhone.present
          ? data.managerPhone.value
          : this.managerPhone,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      defaultLanguage: data.defaultLanguage.present
          ? data.defaultLanguage.value
          : this.defaultLanguage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MessesData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('managerName: $managerName, ')
          ..write('managerPhone: $managerPhone, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('defaultLanguage: $defaultLanguage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    address,
    managerName,
    managerPhone,
    currencyCode,
    defaultLanguage,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessesData &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.managerName == this.managerName &&
          other.managerPhone == this.managerPhone &&
          other.currencyCode == this.currencyCode &&
          other.defaultLanguage == this.defaultLanguage &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MessesCompanion extends UpdateCompanion<MessesData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> address;
  final Value<String> managerName;
  final Value<String?> managerPhone;
  final Value<String> currencyCode;
  final Value<String> defaultLanguage;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MessesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.managerName = const Value.absent(),
    this.managerPhone = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.defaultLanguage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessesCompanion.insert({
    required String id,
    required String name,
    this.address = const Value.absent(),
    required String managerName,
    this.managerPhone = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.defaultLanguage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       managerName = Value(managerName);
  static Insertable<MessesData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? managerName,
    Expression<String>? managerPhone,
    Expression<String>? currencyCode,
    Expression<String>? defaultLanguage,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (managerName != null) 'manager_name': managerName,
      if (managerPhone != null) 'manager_phone': managerPhone,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (defaultLanguage != null) 'default_language': defaultLanguage,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? address,
    Value<String>? managerName,
    Value<String?>? managerPhone,
    Value<String>? currencyCode,
    Value<String>? defaultLanguage,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MessesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      managerName: managerName ?? this.managerName,
      managerPhone: managerPhone ?? this.managerPhone,
      currencyCode: currencyCode ?? this.currencyCode,
      defaultLanguage: defaultLanguage ?? this.defaultLanguage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (managerName.present) {
      map['manager_name'] = Variable<String>(managerName.value);
    }
    if (managerPhone.present) {
      map['manager_phone'] = Variable<String>(managerPhone.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (defaultLanguage.present) {
      map['default_language'] = Variable<String>(defaultLanguage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('managerName: $managerName, ')
          ..write('managerPhone: $managerPhone, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('defaultLanguage: $defaultLanguage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
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
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roomNumberMeta = const VerificationMeta(
    'roomNumber',
  );
  @override
  late final GeneratedColumn<String> roomNumber = GeneratedColumn<String>(
    'room_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarPathMeta = const VerificationMeta(
    'avatarPath',
  );
  @override
  late final GeneratedColumn<String> avatarPath = GeneratedColumn<String>(
    'avatar_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _joinDateMeta = const VerificationMeta(
    'joinDate',
  );
  @override
  late final GeneratedColumn<DateTime> joinDate = GeneratedColumn<DateTime>(
    'join_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _leaveDateMeta = const VerificationMeta(
    'leaveDate',
  );
  @override
  late final GeneratedColumn<DateTime> leaveDate = GeneratedColumn<DateTime>(
    'leave_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _openingBalanceMinorMeta =
      const VerificationMeta('openingBalanceMinor');
  @override
  late final GeneratedColumn<int> openingBalanceMinor = GeneratedColumn<int>(
    'opening_balance_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    name,
    nickname,
    phone,
    roomNumber,
    avatarPath,
    joinDate,
    leaveDate,
    openingBalanceMinor,
    status,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'members';
  @override
  VerificationContext validateIntegrity(
    Insertable<Member> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('room_number')) {
      context.handle(
        _roomNumberMeta,
        roomNumber.isAcceptableOrUnknown(data['room_number']!, _roomNumberMeta),
      );
    }
    if (data.containsKey('avatar_path')) {
      context.handle(
        _avatarPathMeta,
        avatarPath.isAcceptableOrUnknown(data['avatar_path']!, _avatarPathMeta),
      );
    }
    if (data.containsKey('join_date')) {
      context.handle(
        _joinDateMeta,
        joinDate.isAcceptableOrUnknown(data['join_date']!, _joinDateMeta),
      );
    } else if (isInserting) {
      context.missing(_joinDateMeta);
    }
    if (data.containsKey('leave_date')) {
      context.handle(
        _leaveDateMeta,
        leaveDate.isAcceptableOrUnknown(data['leave_date']!, _leaveDateMeta),
      );
    }
    if (data.containsKey('opening_balance_minor')) {
      context.handle(
        _openingBalanceMinorMeta,
        openingBalanceMinor.isAcceptableOrUnknown(
          data['opening_balance_minor']!,
          _openingBalanceMinorMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Member map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Member(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      roomNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_number'],
      ),
      avatarPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_path'],
      ),
      joinDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}join_date'],
      )!,
      leaveDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}leave_date'],
      ),
      openingBalanceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}opening_balance_minor'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(attachedDatabase, alias);
  }
}

class Member extends DataClass implements Insertable<Member> {
  final String id;
  final String messId;
  final String name;
  final String? nickname;
  final String? phone;
  final String? roomNumber;
  final String? avatarPath;
  final DateTime joinDate;
  final DateTime? leaveDate;
  final int openingBalanceMinor;
  final String status;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Member({
    required this.id,
    required this.messId,
    required this.name,
    this.nickname,
    this.phone,
    this.roomNumber,
    this.avatarPath,
    required this.joinDate,
    this.leaveDate,
    required this.openingBalanceMinor,
    required this.status,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || roomNumber != null) {
      map['room_number'] = Variable<String>(roomNumber);
    }
    if (!nullToAbsent || avatarPath != null) {
      map['avatar_path'] = Variable<String>(avatarPath);
    }
    map['join_date'] = Variable<DateTime>(joinDate);
    if (!nullToAbsent || leaveDate != null) {
      map['leave_date'] = Variable<DateTime>(leaveDate);
    }
    map['opening_balance_minor'] = Variable<int>(openingBalanceMinor);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
    return MembersCompanion(
      id: Value(id),
      messId: Value(messId),
      name: Value(name),
      nickname: nickname == null && nullToAbsent
          ? const Value.absent()
          : Value(nickname),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      roomNumber: roomNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(roomNumber),
      avatarPath: avatarPath == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarPath),
      joinDate: Value(joinDate),
      leaveDate: leaveDate == null && nullToAbsent
          ? const Value.absent()
          : Value(leaveDate),
      openingBalanceMinor: Value(openingBalanceMinor),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Member.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      name: serializer.fromJson<String>(json['name']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      phone: serializer.fromJson<String?>(json['phone']),
      roomNumber: serializer.fromJson<String?>(json['roomNumber']),
      avatarPath: serializer.fromJson<String?>(json['avatarPath']),
      joinDate: serializer.fromJson<DateTime>(json['joinDate']),
      leaveDate: serializer.fromJson<DateTime?>(json['leaveDate']),
      openingBalanceMinor: serializer.fromJson<int>(
        json['openingBalanceMinor'],
      ),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'name': serializer.toJson<String>(name),
      'nickname': serializer.toJson<String?>(nickname),
      'phone': serializer.toJson<String?>(phone),
      'roomNumber': serializer.toJson<String?>(roomNumber),
      'avatarPath': serializer.toJson<String?>(avatarPath),
      'joinDate': serializer.toJson<DateTime>(joinDate),
      'leaveDate': serializer.toJson<DateTime?>(leaveDate),
      'openingBalanceMinor': serializer.toJson<int>(openingBalanceMinor),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Member copyWith({
    String? id,
    String? messId,
    String? name,
    Value<String?> nickname = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> roomNumber = const Value.absent(),
    Value<String?> avatarPath = const Value.absent(),
    DateTime? joinDate,
    Value<DateTime?> leaveDate = const Value.absent(),
    int? openingBalanceMinor,
    String? status,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Member(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    name: name ?? this.name,
    nickname: nickname.present ? nickname.value : this.nickname,
    phone: phone.present ? phone.value : this.phone,
    roomNumber: roomNumber.present ? roomNumber.value : this.roomNumber,
    avatarPath: avatarPath.present ? avatarPath.value : this.avatarPath,
    joinDate: joinDate ?? this.joinDate,
    leaveDate: leaveDate.present ? leaveDate.value : this.leaveDate,
    openingBalanceMinor: openingBalanceMinor ?? this.openingBalanceMinor,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Member copyWithCompanion(MembersCompanion data) {
    return Member(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      name: data.name.present ? data.name.value : this.name,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      phone: data.phone.present ? data.phone.value : this.phone,
      roomNumber: data.roomNumber.present
          ? data.roomNumber.value
          : this.roomNumber,
      avatarPath: data.avatarPath.present
          ? data.avatarPath.value
          : this.avatarPath,
      joinDate: data.joinDate.present ? data.joinDate.value : this.joinDate,
      leaveDate: data.leaveDate.present ? data.leaveDate.value : this.leaveDate,
      openingBalanceMinor: data.openingBalanceMinor.present
          ? data.openingBalanceMinor.value
          : this.openingBalanceMinor,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('name: $name, ')
          ..write('nickname: $nickname, ')
          ..write('phone: $phone, ')
          ..write('roomNumber: $roomNumber, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('joinDate: $joinDate, ')
          ..write('leaveDate: $leaveDate, ')
          ..write('openingBalanceMinor: $openingBalanceMinor, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    name,
    nickname,
    phone,
    roomNumber,
    avatarPath,
    joinDate,
    leaveDate,
    openingBalanceMinor,
    status,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.name == this.name &&
          other.nickname == this.nickname &&
          other.phone == this.phone &&
          other.roomNumber == this.roomNumber &&
          other.avatarPath == this.avatarPath &&
          other.joinDate == this.joinDate &&
          other.leaveDate == this.leaveDate &&
          other.openingBalanceMinor == this.openingBalanceMinor &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> name;
  final Value<String?> nickname;
  final Value<String?> phone;
  final Value<String?> roomNumber;
  final Value<String?> avatarPath;
  final Value<DateTime> joinDate;
  final Value<DateTime?> leaveDate;
  final Value<int> openingBalanceMinor;
  final Value<String> status;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MembersCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.name = const Value.absent(),
    this.nickname = const Value.absent(),
    this.phone = const Value.absent(),
    this.roomNumber = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.joinDate = const Value.absent(),
    this.leaveDate = const Value.absent(),
    this.openingBalanceMinor = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MembersCompanion.insert({
    required String id,
    required String messId,
    required String name,
    this.nickname = const Value.absent(),
    this.phone = const Value.absent(),
    this.roomNumber = const Value.absent(),
    this.avatarPath = const Value.absent(),
    required DateTime joinDate,
    this.leaveDate = const Value.absent(),
    this.openingBalanceMinor = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       name = Value(name),
       joinDate = Value(joinDate);
  static Insertable<Member> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? name,
    Expression<String>? nickname,
    Expression<String>? phone,
    Expression<String>? roomNumber,
    Expression<String>? avatarPath,
    Expression<DateTime>? joinDate,
    Expression<DateTime>? leaveDate,
    Expression<int>? openingBalanceMinor,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (name != null) 'name': name,
      if (nickname != null) 'nickname': nickname,
      if (phone != null) 'phone': phone,
      if (roomNumber != null) 'room_number': roomNumber,
      if (avatarPath != null) 'avatar_path': avatarPath,
      if (joinDate != null) 'join_date': joinDate,
      if (leaveDate != null) 'leave_date': leaveDate,
      if (openingBalanceMinor != null)
        'opening_balance_minor': openingBalanceMinor,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MembersCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? name,
    Value<String?>? nickname,
    Value<String?>? phone,
    Value<String?>? roomNumber,
    Value<String?>? avatarPath,
    Value<DateTime>? joinDate,
    Value<DateTime?>? leaveDate,
    Value<int>? openingBalanceMinor,
    Value<String>? status,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MembersCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      phone: phone ?? this.phone,
      roomNumber: roomNumber ?? this.roomNumber,
      avatarPath: avatarPath ?? this.avatarPath,
      joinDate: joinDate ?? this.joinDate,
      leaveDate: leaveDate ?? this.leaveDate,
      openingBalanceMinor: openingBalanceMinor ?? this.openingBalanceMinor,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (roomNumber.present) {
      map['room_number'] = Variable<String>(roomNumber.value);
    }
    if (avatarPath.present) {
      map['avatar_path'] = Variable<String>(avatarPath.value);
    }
    if (joinDate.present) {
      map['join_date'] = Variable<DateTime>(joinDate.value);
    }
    if (leaveDate.present) {
      map['leave_date'] = Variable<DateTime>(leaveDate.value);
    }
    if (openingBalanceMinor.present) {
      map['opening_balance_minor'] = Variable<int>(openingBalanceMinor.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('name: $name, ')
          ..write('nickname: $nickname, ')
          ..write('phone: $phone, ')
          ..write('roomNumber: $roomNumber, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('joinDate: $joinDate, ')
          ..write('leaveDate: $leaveDate, ')
          ..write('openingBalanceMinor: $openingBalanceMinor, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountingMonthsTable extends AccountingMonths
    with TableInfo<$AccountingMonthsTable, AccountingMonth> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountingMonthsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<int> month = GeneratedColumn<int>(
    'month',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _finalMealRateScaledMeta =
      const VerificationMeta('finalMealRateScaled');
  @override
  late final GeneratedColumn<int> finalMealRateScaled = GeneratedColumn<int>(
    'final_meal_rate_scaled',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _closedAtMeta = const VerificationMeta(
    'closedAt',
  );
  @override
  late final GeneratedColumn<DateTime> closedAt = GeneratedColumn<DateTime>(
    'closed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    year,
    month,
    startDate,
    endDate,
    status,
    finalMealRateScaled,
    closedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounting_months';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountingMonth> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
        _monthMeta,
        month.isAcceptableOrUnknown(data['month']!, _monthMeta),
      );
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('final_meal_rate_scaled')) {
      context.handle(
        _finalMealRateScaledMeta,
        finalMealRateScaled.isAcceptableOrUnknown(
          data['final_meal_rate_scaled']!,
          _finalMealRateScaledMeta,
        ),
      );
    }
    if (data.containsKey('closed_at')) {
      context.handle(
        _closedAtMeta,
        closedAt.isAcceptableOrUnknown(data['closed_at']!, _closedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountingMonth map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountingMonth(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      month: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}month'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      finalMealRateScaled: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}final_meal_rate_scaled'],
      ),
      closedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}closed_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AccountingMonthsTable createAlias(String alias) {
    return $AccountingMonthsTable(attachedDatabase, alias);
  }
}

class AccountingMonth extends DataClass implements Insertable<AccountingMonth> {
  final String id;
  final String messId;
  final int year;
  final int month;
  final DateTime startDate;
  final DateTime? endDate;
  final String status;
  final int? finalMealRateScaled;
  final DateTime? closedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AccountingMonth({
    required this.id,
    required this.messId,
    required this.year,
    required this.month,
    required this.startDate,
    this.endDate,
    required this.status,
    this.finalMealRateScaled,
    this.closedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['year'] = Variable<int>(year);
    map['month'] = Variable<int>(month);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || finalMealRateScaled != null) {
      map['final_meal_rate_scaled'] = Variable<int>(finalMealRateScaled);
    }
    if (!nullToAbsent || closedAt != null) {
      map['closed_at'] = Variable<DateTime>(closedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AccountingMonthsCompanion toCompanion(bool nullToAbsent) {
    return AccountingMonthsCompanion(
      id: Value(id),
      messId: Value(messId),
      year: Value(year),
      month: Value(month),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      status: Value(status),
      finalMealRateScaled: finalMealRateScaled == null && nullToAbsent
          ? const Value.absent()
          : Value(finalMealRateScaled),
      closedAt: closedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(closedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AccountingMonth.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountingMonth(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      year: serializer.fromJson<int>(json['year']),
      month: serializer.fromJson<int>(json['month']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      status: serializer.fromJson<String>(json['status']),
      finalMealRateScaled: serializer.fromJson<int?>(
        json['finalMealRateScaled'],
      ),
      closedAt: serializer.fromJson<DateTime?>(json['closedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'year': serializer.toJson<int>(year),
      'month': serializer.toJson<int>(month),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'status': serializer.toJson<String>(status),
      'finalMealRateScaled': serializer.toJson<int?>(finalMealRateScaled),
      'closedAt': serializer.toJson<DateTime?>(closedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AccountingMonth copyWith({
    String? id,
    String? messId,
    int? year,
    int? month,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    String? status,
    Value<int?> finalMealRateScaled = const Value.absent(),
    Value<DateTime?> closedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AccountingMonth(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    year: year ?? this.year,
    month: month ?? this.month,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    status: status ?? this.status,
    finalMealRateScaled: finalMealRateScaled.present
        ? finalMealRateScaled.value
        : this.finalMealRateScaled,
    closedAt: closedAt.present ? closedAt.value : this.closedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AccountingMonth copyWithCompanion(AccountingMonthsCompanion data) {
    return AccountingMonth(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      year: data.year.present ? data.year.value : this.year,
      month: data.month.present ? data.month.value : this.month,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      status: data.status.present ? data.status.value : this.status,
      finalMealRateScaled: data.finalMealRateScaled.present
          ? data.finalMealRateScaled.value
          : this.finalMealRateScaled,
      closedAt: data.closedAt.present ? data.closedAt.value : this.closedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountingMonth(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('finalMealRateScaled: $finalMealRateScaled, ')
          ..write('closedAt: $closedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    year,
    month,
    startDate,
    endDate,
    status,
    finalMealRateScaled,
    closedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountingMonth &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.year == this.year &&
          other.month == this.month &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.status == this.status &&
          other.finalMealRateScaled == this.finalMealRateScaled &&
          other.closedAt == this.closedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AccountingMonthsCompanion extends UpdateCompanion<AccountingMonth> {
  final Value<String> id;
  final Value<String> messId;
  final Value<int> year;
  final Value<int> month;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<String> status;
  final Value<int?> finalMealRateScaled;
  final Value<DateTime?> closedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AccountingMonthsCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.year = const Value.absent(),
    this.month = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.finalMealRateScaled = const Value.absent(),
    this.closedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountingMonthsCompanion.insert({
    required String id,
    required String messId,
    required int year,
    required int month,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.finalMealRateScaled = const Value.absent(),
    this.closedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       year = Value(year),
       month = Value(month),
       startDate = Value(startDate);
  static Insertable<AccountingMonth> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<int>? year,
    Expression<int>? month,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? status,
    Expression<int>? finalMealRateScaled,
    Expression<DateTime>? closedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (year != null) 'year': year,
      if (month != null) 'month': month,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (status != null) 'status': status,
      if (finalMealRateScaled != null)
        'final_meal_rate_scaled': finalMealRateScaled,
      if (closedAt != null) 'closed_at': closedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountingMonthsCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<int>? year,
    Value<int>? month,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<String>? status,
    Value<int?>? finalMealRateScaled,
    Value<DateTime?>? closedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AccountingMonthsCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      year: year ?? this.year,
      month: month ?? this.month,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      finalMealRateScaled: finalMealRateScaled ?? this.finalMealRateScaled,
      closedAt: closedAt ?? this.closedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (finalMealRateScaled.present) {
      map['final_meal_rate_scaled'] = Variable<int>(finalMealRateScaled.value);
    }
    if (closedAt.present) {
      map['closed_at'] = Variable<DateTime>(closedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountingMonthsCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('finalMealRateScaled: $finalMealRateScaled, ')
          ..write('closedAt: $closedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealEntriesTable extends MealEntries
    with TableInfo<$MealEntriesTable, MealEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _accountingMonthIdMeta = const VerificationMeta(
    'accountingMonthId',
  );
  @override
  late final GeneratedColumn<String> accountingMonthId =
      GeneratedColumn<String>(
        'accounting_month_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounting_months (id)',
        ),
      );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
    'member_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _mealDateMeta = const VerificationMeta(
    'mealDate',
  );
  @override
  late final GeneratedColumn<DateTime> mealDate = GeneratedColumn<DateTime>(
    'meal_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breakfastUnitsMeta = const VerificationMeta(
    'breakfastUnits',
  );
  @override
  late final GeneratedColumn<int> breakfastUnits = GeneratedColumn<int>(
    'breakfast_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lunchUnitsMeta = const VerificationMeta(
    'lunchUnits',
  );
  @override
  late final GeneratedColumn<int> lunchUnits = GeneratedColumn<int>(
    'lunch_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dinnerUnitsMeta = const VerificationMeta(
    'dinnerUnits',
  );
  @override
  late final GeneratedColumn<int> dinnerUnits = GeneratedColumn<int>(
    'dinner_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _extraUnitsMeta = const VerificationMeta(
    'extraUnits',
  );
  @override
  late final GeneratedColumn<int> extraUnits = GeneratedColumn<int>(
    'extra_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalUnitsMeta = const VerificationMeta(
    'totalUnits',
  );
  @override
  late final GeneratedColumn<int> totalUnits = GeneratedColumn<int>(
    'total_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    accountingMonthId,
    memberId,
    mealDate,
    breakfastUnits,
    lunchUnits,
    dinnerUnits,
    extraUnits,
    totalUnits,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('accounting_month_id')) {
      context.handle(
        _accountingMonthIdMeta,
        accountingMonthId.isAcceptableOrUnknown(
          data['accounting_month_id']!,
          _accountingMonthIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountingMonthIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('meal_date')) {
      context.handle(
        _mealDateMeta,
        mealDate.isAcceptableOrUnknown(data['meal_date']!, _mealDateMeta),
      );
    } else if (isInserting) {
      context.missing(_mealDateMeta);
    }
    if (data.containsKey('breakfast_units')) {
      context.handle(
        _breakfastUnitsMeta,
        breakfastUnits.isAcceptableOrUnknown(
          data['breakfast_units']!,
          _breakfastUnitsMeta,
        ),
      );
    }
    if (data.containsKey('lunch_units')) {
      context.handle(
        _lunchUnitsMeta,
        lunchUnits.isAcceptableOrUnknown(data['lunch_units']!, _lunchUnitsMeta),
      );
    }
    if (data.containsKey('dinner_units')) {
      context.handle(
        _dinnerUnitsMeta,
        dinnerUnits.isAcceptableOrUnknown(
          data['dinner_units']!,
          _dinnerUnitsMeta,
        ),
      );
    }
    if (data.containsKey('extra_units')) {
      context.handle(
        _extraUnitsMeta,
        extraUnits.isAcceptableOrUnknown(data['extra_units']!, _extraUnitsMeta),
      );
    }
    if (data.containsKey('total_units')) {
      context.handle(
        _totalUnitsMeta,
        totalUnits.isAcceptableOrUnknown(data['total_units']!, _totalUnitsMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      accountingMonthId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accounting_month_id'],
      )!,
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}member_id'],
      )!,
      mealDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}meal_date'],
      )!,
      breakfastUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}breakfast_units'],
      )!,
      lunchUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lunch_units'],
      )!,
      dinnerUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dinner_units'],
      )!,
      extraUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}extra_units'],
      )!,
      totalUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_units'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MealEntriesTable createAlias(String alias) {
    return $MealEntriesTable(attachedDatabase, alias);
  }
}

class MealEntry extends DataClass implements Insertable<MealEntry> {
  final String id;
  final String messId;
  final String accountingMonthId;
  final String memberId;
  final DateTime mealDate;
  final int breakfastUnits;
  final int lunchUnits;
  final int dinnerUnits;
  final int extraUnits;
  final int totalUnits;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MealEntry({
    required this.id,
    required this.messId,
    required this.accountingMonthId,
    required this.memberId,
    required this.mealDate,
    required this.breakfastUnits,
    required this.lunchUnits,
    required this.dinnerUnits,
    required this.extraUnits,
    required this.totalUnits,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['accounting_month_id'] = Variable<String>(accountingMonthId);
    map['member_id'] = Variable<String>(memberId);
    map['meal_date'] = Variable<DateTime>(mealDate);
    map['breakfast_units'] = Variable<int>(breakfastUnits);
    map['lunch_units'] = Variable<int>(lunchUnits);
    map['dinner_units'] = Variable<int>(dinnerUnits);
    map['extra_units'] = Variable<int>(extraUnits);
    map['total_units'] = Variable<int>(totalUnits);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MealEntriesCompanion toCompanion(bool nullToAbsent) {
    return MealEntriesCompanion(
      id: Value(id),
      messId: Value(messId),
      accountingMonthId: Value(accountingMonthId),
      memberId: Value(memberId),
      mealDate: Value(mealDate),
      breakfastUnits: Value(breakfastUnits),
      lunchUnits: Value(lunchUnits),
      dinnerUnits: Value(dinnerUnits),
      extraUnits: Value(extraUnits),
      totalUnits: Value(totalUnits),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MealEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealEntry(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      accountingMonthId: serializer.fromJson<String>(json['accountingMonthId']),
      memberId: serializer.fromJson<String>(json['memberId']),
      mealDate: serializer.fromJson<DateTime>(json['mealDate']),
      breakfastUnits: serializer.fromJson<int>(json['breakfastUnits']),
      lunchUnits: serializer.fromJson<int>(json['lunchUnits']),
      dinnerUnits: serializer.fromJson<int>(json['dinnerUnits']),
      extraUnits: serializer.fromJson<int>(json['extraUnits']),
      totalUnits: serializer.fromJson<int>(json['totalUnits']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'accountingMonthId': serializer.toJson<String>(accountingMonthId),
      'memberId': serializer.toJson<String>(memberId),
      'mealDate': serializer.toJson<DateTime>(mealDate),
      'breakfastUnits': serializer.toJson<int>(breakfastUnits),
      'lunchUnits': serializer.toJson<int>(lunchUnits),
      'dinnerUnits': serializer.toJson<int>(dinnerUnits),
      'extraUnits': serializer.toJson<int>(extraUnits),
      'totalUnits': serializer.toJson<int>(totalUnits),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MealEntry copyWith({
    String? id,
    String? messId,
    String? accountingMonthId,
    String? memberId,
    DateTime? mealDate,
    int? breakfastUnits,
    int? lunchUnits,
    int? dinnerUnits,
    int? extraUnits,
    int? totalUnits,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MealEntry(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    accountingMonthId: accountingMonthId ?? this.accountingMonthId,
    memberId: memberId ?? this.memberId,
    mealDate: mealDate ?? this.mealDate,
    breakfastUnits: breakfastUnits ?? this.breakfastUnits,
    lunchUnits: lunchUnits ?? this.lunchUnits,
    dinnerUnits: dinnerUnits ?? this.dinnerUnits,
    extraUnits: extraUnits ?? this.extraUnits,
    totalUnits: totalUnits ?? this.totalUnits,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MealEntry copyWithCompanion(MealEntriesCompanion data) {
    return MealEntry(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      accountingMonthId: data.accountingMonthId.present
          ? data.accountingMonthId.value
          : this.accountingMonthId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      mealDate: data.mealDate.present ? data.mealDate.value : this.mealDate,
      breakfastUnits: data.breakfastUnits.present
          ? data.breakfastUnits.value
          : this.breakfastUnits,
      lunchUnits: data.lunchUnits.present
          ? data.lunchUnits.value
          : this.lunchUnits,
      dinnerUnits: data.dinnerUnits.present
          ? data.dinnerUnits.value
          : this.dinnerUnits,
      extraUnits: data.extraUnits.present
          ? data.extraUnits.value
          : this.extraUnits,
      totalUnits: data.totalUnits.present
          ? data.totalUnits.value
          : this.totalUnits,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealEntry(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('memberId: $memberId, ')
          ..write('mealDate: $mealDate, ')
          ..write('breakfastUnits: $breakfastUnits, ')
          ..write('lunchUnits: $lunchUnits, ')
          ..write('dinnerUnits: $dinnerUnits, ')
          ..write('extraUnits: $extraUnits, ')
          ..write('totalUnits: $totalUnits, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    accountingMonthId,
    memberId,
    mealDate,
    breakfastUnits,
    lunchUnits,
    dinnerUnits,
    extraUnits,
    totalUnits,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealEntry &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.accountingMonthId == this.accountingMonthId &&
          other.memberId == this.memberId &&
          other.mealDate == this.mealDate &&
          other.breakfastUnits == this.breakfastUnits &&
          other.lunchUnits == this.lunchUnits &&
          other.dinnerUnits == this.dinnerUnits &&
          other.extraUnits == this.extraUnits &&
          other.totalUnits == this.totalUnits &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MealEntriesCompanion extends UpdateCompanion<MealEntry> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> accountingMonthId;
  final Value<String> memberId;
  final Value<DateTime> mealDate;
  final Value<int> breakfastUnits;
  final Value<int> lunchUnits;
  final Value<int> dinnerUnits;
  final Value<int> extraUnits;
  final Value<int> totalUnits;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MealEntriesCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.accountingMonthId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.mealDate = const Value.absent(),
    this.breakfastUnits = const Value.absent(),
    this.lunchUnits = const Value.absent(),
    this.dinnerUnits = const Value.absent(),
    this.extraUnits = const Value.absent(),
    this.totalUnits = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealEntriesCompanion.insert({
    required String id,
    required String messId,
    required String accountingMonthId,
    required String memberId,
    required DateTime mealDate,
    this.breakfastUnits = const Value.absent(),
    this.lunchUnits = const Value.absent(),
    this.dinnerUnits = const Value.absent(),
    this.extraUnits = const Value.absent(),
    this.totalUnits = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       accountingMonthId = Value(accountingMonthId),
       memberId = Value(memberId),
       mealDate = Value(mealDate);
  static Insertable<MealEntry> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? accountingMonthId,
    Expression<String>? memberId,
    Expression<DateTime>? mealDate,
    Expression<int>? breakfastUnits,
    Expression<int>? lunchUnits,
    Expression<int>? dinnerUnits,
    Expression<int>? extraUnits,
    Expression<int>? totalUnits,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (accountingMonthId != null) 'accounting_month_id': accountingMonthId,
      if (memberId != null) 'member_id': memberId,
      if (mealDate != null) 'meal_date': mealDate,
      if (breakfastUnits != null) 'breakfast_units': breakfastUnits,
      if (lunchUnits != null) 'lunch_units': lunchUnits,
      if (dinnerUnits != null) 'dinner_units': dinnerUnits,
      if (extraUnits != null) 'extra_units': extraUnits,
      if (totalUnits != null) 'total_units': totalUnits,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? accountingMonthId,
    Value<String>? memberId,
    Value<DateTime>? mealDate,
    Value<int>? breakfastUnits,
    Value<int>? lunchUnits,
    Value<int>? dinnerUnits,
    Value<int>? extraUnits,
    Value<int>? totalUnits,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MealEntriesCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      accountingMonthId: accountingMonthId ?? this.accountingMonthId,
      memberId: memberId ?? this.memberId,
      mealDate: mealDate ?? this.mealDate,
      breakfastUnits: breakfastUnits ?? this.breakfastUnits,
      lunchUnits: lunchUnits ?? this.lunchUnits,
      dinnerUnits: dinnerUnits ?? this.dinnerUnits,
      extraUnits: extraUnits ?? this.extraUnits,
      totalUnits: totalUnits ?? this.totalUnits,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (accountingMonthId.present) {
      map['accounting_month_id'] = Variable<String>(accountingMonthId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (mealDate.present) {
      map['meal_date'] = Variable<DateTime>(mealDate.value);
    }
    if (breakfastUnits.present) {
      map['breakfast_units'] = Variable<int>(breakfastUnits.value);
    }
    if (lunchUnits.present) {
      map['lunch_units'] = Variable<int>(lunchUnits.value);
    }
    if (dinnerUnits.present) {
      map['dinner_units'] = Variable<int>(dinnerUnits.value);
    }
    if (extraUnits.present) {
      map['extra_units'] = Variable<int>(extraUnits.value);
    }
    if (totalUnits.present) {
      map['total_units'] = Variable<int>(totalUnits.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealEntriesCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('memberId: $memberId, ')
          ..write('mealDate: $mealDate, ')
          ..write('breakfastUnits: $breakfastUnits, ')
          ..write('lunchUnits: $lunchUnits, ')
          ..write('dinnerUnits: $dinnerUnits, ')
          ..write('extraUnits: $extraUnits, ')
          ..write('totalUnits: $totalUnits, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GuestMealsTable extends GuestMeals
    with TableInfo<$GuestMealsTable, GuestMeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuestMealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _accountingMonthIdMeta = const VerificationMeta(
    'accountingMonthId',
  );
  @override
  late final GeneratedColumn<String> accountingMonthId =
      GeneratedColumn<String>(
        'accounting_month_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounting_months (id)',
        ),
      );
  static const VerificationMeta _hostMemberIdMeta = const VerificationMeta(
    'hostMemberId',
  );
  @override
  late final GeneratedColumn<String> hostMemberId = GeneratedColumn<String>(
    'host_member_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _mealDateMeta = const VerificationMeta(
    'mealDate',
  );
  @override
  late final GeneratedColumn<DateTime> mealDate = GeneratedColumn<DateTime>(
    'meal_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guestNameMeta = const VerificationMeta(
    'guestName',
  );
  @override
  late final GeneratedColumn<String> guestName = GeneratedColumn<String>(
    'guest_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guestCountMeta = const VerificationMeta(
    'guestCount',
  );
  @override
  late final GeneratedColumn<int> guestCount = GeneratedColumn<int>(
    'guest_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _mealUnitsMeta = const VerificationMeta(
    'mealUnits',
  );
  @override
  late final GeneratedColumn<int> mealUnits = GeneratedColumn<int>(
    'meal_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chargeMethodMeta = const VerificationMeta(
    'chargeMethod',
  );
  @override
  late final GeneratedColumn<String> chargeMethod = GeneratedColumn<String>(
    'charge_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _directChargeMinorMeta = const VerificationMeta(
    'directChargeMinor',
  );
  @override
  late final GeneratedColumn<int> directChargeMinor = GeneratedColumn<int>(
    'direct_charge_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    accountingMonthId,
    hostMemberId,
    mealDate,
    guestName,
    guestCount,
    mealUnits,
    chargeMethod,
    directChargeMinor,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guest_meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<GuestMeal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('accounting_month_id')) {
      context.handle(
        _accountingMonthIdMeta,
        accountingMonthId.isAcceptableOrUnknown(
          data['accounting_month_id']!,
          _accountingMonthIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountingMonthIdMeta);
    }
    if (data.containsKey('host_member_id')) {
      context.handle(
        _hostMemberIdMeta,
        hostMemberId.isAcceptableOrUnknown(
          data['host_member_id']!,
          _hostMemberIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hostMemberIdMeta);
    }
    if (data.containsKey('meal_date')) {
      context.handle(
        _mealDateMeta,
        mealDate.isAcceptableOrUnknown(data['meal_date']!, _mealDateMeta),
      );
    } else if (isInserting) {
      context.missing(_mealDateMeta);
    }
    if (data.containsKey('guest_name')) {
      context.handle(
        _guestNameMeta,
        guestName.isAcceptableOrUnknown(data['guest_name']!, _guestNameMeta),
      );
    }
    if (data.containsKey('guest_count')) {
      context.handle(
        _guestCountMeta,
        guestCount.isAcceptableOrUnknown(data['guest_count']!, _guestCountMeta),
      );
    }
    if (data.containsKey('meal_units')) {
      context.handle(
        _mealUnitsMeta,
        mealUnits.isAcceptableOrUnknown(data['meal_units']!, _mealUnitsMeta),
      );
    } else if (isInserting) {
      context.missing(_mealUnitsMeta);
    }
    if (data.containsKey('charge_method')) {
      context.handle(
        _chargeMethodMeta,
        chargeMethod.isAcceptableOrUnknown(
          data['charge_method']!,
          _chargeMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chargeMethodMeta);
    }
    if (data.containsKey('direct_charge_minor')) {
      context.handle(
        _directChargeMinorMeta,
        directChargeMinor.isAcceptableOrUnknown(
          data['direct_charge_minor']!,
          _directChargeMinorMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GuestMeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GuestMeal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      accountingMonthId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accounting_month_id'],
      )!,
      hostMemberId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}host_member_id'],
      )!,
      mealDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}meal_date'],
      )!,
      guestName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guest_name'],
      ),
      guestCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guest_count'],
      )!,
      mealUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meal_units'],
      )!,
      chargeMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}charge_method'],
      )!,
      directChargeMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}direct_charge_minor'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GuestMealsTable createAlias(String alias) {
    return $GuestMealsTable(attachedDatabase, alias);
  }
}

class GuestMeal extends DataClass implements Insertable<GuestMeal> {
  final String id;
  final String messId;
  final String accountingMonthId;
  final String hostMemberId;
  final DateTime mealDate;
  final String? guestName;
  final int guestCount;
  final int mealUnits;
  final String chargeMethod;
  final int directChargeMinor;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const GuestMeal({
    required this.id,
    required this.messId,
    required this.accountingMonthId,
    required this.hostMemberId,
    required this.mealDate,
    this.guestName,
    required this.guestCount,
    required this.mealUnits,
    required this.chargeMethod,
    required this.directChargeMinor,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['accounting_month_id'] = Variable<String>(accountingMonthId);
    map['host_member_id'] = Variable<String>(hostMemberId);
    map['meal_date'] = Variable<DateTime>(mealDate);
    if (!nullToAbsent || guestName != null) {
      map['guest_name'] = Variable<String>(guestName);
    }
    map['guest_count'] = Variable<int>(guestCount);
    map['meal_units'] = Variable<int>(mealUnits);
    map['charge_method'] = Variable<String>(chargeMethod);
    map['direct_charge_minor'] = Variable<int>(directChargeMinor);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GuestMealsCompanion toCompanion(bool nullToAbsent) {
    return GuestMealsCompanion(
      id: Value(id),
      messId: Value(messId),
      accountingMonthId: Value(accountingMonthId),
      hostMemberId: Value(hostMemberId),
      mealDate: Value(mealDate),
      guestName: guestName == null && nullToAbsent
          ? const Value.absent()
          : Value(guestName),
      guestCount: Value(guestCount),
      mealUnits: Value(mealUnits),
      chargeMethod: Value(chargeMethod),
      directChargeMinor: Value(directChargeMinor),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory GuestMeal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuestMeal(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      accountingMonthId: serializer.fromJson<String>(json['accountingMonthId']),
      hostMemberId: serializer.fromJson<String>(json['hostMemberId']),
      mealDate: serializer.fromJson<DateTime>(json['mealDate']),
      guestName: serializer.fromJson<String?>(json['guestName']),
      guestCount: serializer.fromJson<int>(json['guestCount']),
      mealUnits: serializer.fromJson<int>(json['mealUnits']),
      chargeMethod: serializer.fromJson<String>(json['chargeMethod']),
      directChargeMinor: serializer.fromJson<int>(json['directChargeMinor']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'accountingMonthId': serializer.toJson<String>(accountingMonthId),
      'hostMemberId': serializer.toJson<String>(hostMemberId),
      'mealDate': serializer.toJson<DateTime>(mealDate),
      'guestName': serializer.toJson<String?>(guestName),
      'guestCount': serializer.toJson<int>(guestCount),
      'mealUnits': serializer.toJson<int>(mealUnits),
      'chargeMethod': serializer.toJson<String>(chargeMethod),
      'directChargeMinor': serializer.toJson<int>(directChargeMinor),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GuestMeal copyWith({
    String? id,
    String? messId,
    String? accountingMonthId,
    String? hostMemberId,
    DateTime? mealDate,
    Value<String?> guestName = const Value.absent(),
    int? guestCount,
    int? mealUnits,
    String? chargeMethod,
    int? directChargeMinor,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => GuestMeal(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    accountingMonthId: accountingMonthId ?? this.accountingMonthId,
    hostMemberId: hostMemberId ?? this.hostMemberId,
    mealDate: mealDate ?? this.mealDate,
    guestName: guestName.present ? guestName.value : this.guestName,
    guestCount: guestCount ?? this.guestCount,
    mealUnits: mealUnits ?? this.mealUnits,
    chargeMethod: chargeMethod ?? this.chargeMethod,
    directChargeMinor: directChargeMinor ?? this.directChargeMinor,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  GuestMeal copyWithCompanion(GuestMealsCompanion data) {
    return GuestMeal(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      accountingMonthId: data.accountingMonthId.present
          ? data.accountingMonthId.value
          : this.accountingMonthId,
      hostMemberId: data.hostMemberId.present
          ? data.hostMemberId.value
          : this.hostMemberId,
      mealDate: data.mealDate.present ? data.mealDate.value : this.mealDate,
      guestName: data.guestName.present ? data.guestName.value : this.guestName,
      guestCount: data.guestCount.present
          ? data.guestCount.value
          : this.guestCount,
      mealUnits: data.mealUnits.present ? data.mealUnits.value : this.mealUnits,
      chargeMethod: data.chargeMethod.present
          ? data.chargeMethod.value
          : this.chargeMethod,
      directChargeMinor: data.directChargeMinor.present
          ? data.directChargeMinor.value
          : this.directChargeMinor,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuestMeal(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('hostMemberId: $hostMemberId, ')
          ..write('mealDate: $mealDate, ')
          ..write('guestName: $guestName, ')
          ..write('guestCount: $guestCount, ')
          ..write('mealUnits: $mealUnits, ')
          ..write('chargeMethod: $chargeMethod, ')
          ..write('directChargeMinor: $directChargeMinor, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    accountingMonthId,
    hostMemberId,
    mealDate,
    guestName,
    guestCount,
    mealUnits,
    chargeMethod,
    directChargeMinor,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuestMeal &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.accountingMonthId == this.accountingMonthId &&
          other.hostMemberId == this.hostMemberId &&
          other.mealDate == this.mealDate &&
          other.guestName == this.guestName &&
          other.guestCount == this.guestCount &&
          other.mealUnits == this.mealUnits &&
          other.chargeMethod == this.chargeMethod &&
          other.directChargeMinor == this.directChargeMinor &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GuestMealsCompanion extends UpdateCompanion<GuestMeal> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> accountingMonthId;
  final Value<String> hostMemberId;
  final Value<DateTime> mealDate;
  final Value<String?> guestName;
  final Value<int> guestCount;
  final Value<int> mealUnits;
  final Value<String> chargeMethod;
  final Value<int> directChargeMinor;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const GuestMealsCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.accountingMonthId = const Value.absent(),
    this.hostMemberId = const Value.absent(),
    this.mealDate = const Value.absent(),
    this.guestName = const Value.absent(),
    this.guestCount = const Value.absent(),
    this.mealUnits = const Value.absent(),
    this.chargeMethod = const Value.absent(),
    this.directChargeMinor = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GuestMealsCompanion.insert({
    required String id,
    required String messId,
    required String accountingMonthId,
    required String hostMemberId,
    required DateTime mealDate,
    this.guestName = const Value.absent(),
    this.guestCount = const Value.absent(),
    required int mealUnits,
    required String chargeMethod,
    this.directChargeMinor = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       accountingMonthId = Value(accountingMonthId),
       hostMemberId = Value(hostMemberId),
       mealDate = Value(mealDate),
       mealUnits = Value(mealUnits),
       chargeMethod = Value(chargeMethod);
  static Insertable<GuestMeal> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? accountingMonthId,
    Expression<String>? hostMemberId,
    Expression<DateTime>? mealDate,
    Expression<String>? guestName,
    Expression<int>? guestCount,
    Expression<int>? mealUnits,
    Expression<String>? chargeMethod,
    Expression<int>? directChargeMinor,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (accountingMonthId != null) 'accounting_month_id': accountingMonthId,
      if (hostMemberId != null) 'host_member_id': hostMemberId,
      if (mealDate != null) 'meal_date': mealDate,
      if (guestName != null) 'guest_name': guestName,
      if (guestCount != null) 'guest_count': guestCount,
      if (mealUnits != null) 'meal_units': mealUnits,
      if (chargeMethod != null) 'charge_method': chargeMethod,
      if (directChargeMinor != null) 'direct_charge_minor': directChargeMinor,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GuestMealsCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? accountingMonthId,
    Value<String>? hostMemberId,
    Value<DateTime>? mealDate,
    Value<String?>? guestName,
    Value<int>? guestCount,
    Value<int>? mealUnits,
    Value<String>? chargeMethod,
    Value<int>? directChargeMinor,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return GuestMealsCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      accountingMonthId: accountingMonthId ?? this.accountingMonthId,
      hostMemberId: hostMemberId ?? this.hostMemberId,
      mealDate: mealDate ?? this.mealDate,
      guestName: guestName ?? this.guestName,
      guestCount: guestCount ?? this.guestCount,
      mealUnits: mealUnits ?? this.mealUnits,
      chargeMethod: chargeMethod ?? this.chargeMethod,
      directChargeMinor: directChargeMinor ?? this.directChargeMinor,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (accountingMonthId.present) {
      map['accounting_month_id'] = Variable<String>(accountingMonthId.value);
    }
    if (hostMemberId.present) {
      map['host_member_id'] = Variable<String>(hostMemberId.value);
    }
    if (mealDate.present) {
      map['meal_date'] = Variable<DateTime>(mealDate.value);
    }
    if (guestName.present) {
      map['guest_name'] = Variable<String>(guestName.value);
    }
    if (guestCount.present) {
      map['guest_count'] = Variable<int>(guestCount.value);
    }
    if (mealUnits.present) {
      map['meal_units'] = Variable<int>(mealUnits.value);
    }
    if (chargeMethod.present) {
      map['charge_method'] = Variable<String>(chargeMethod.value);
    }
    if (directChargeMinor.present) {
      map['direct_charge_minor'] = Variable<int>(directChargeMinor.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuestMealsCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('hostMemberId: $hostMemberId, ')
          ..write('mealDate: $mealDate, ')
          ..write('guestName: $guestName, ')
          ..write('guestCount: $guestCount, ')
          ..write('mealUnits: $mealUnits, ')
          ..write('chargeMethod: $chargeMethod, ')
          ..write('directChargeMinor: $directChargeMinor, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpecialMealsTable extends SpecialMeals
    with TableInfo<$SpecialMealsTable, SpecialMeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpecialMealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _accountingMonthIdMeta = const VerificationMeta(
    'accountingMonthId',
  );
  @override
  late final GeneratedColumn<String> accountingMonthId =
      GeneratedColumn<String>(
        'accounting_month_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounting_months (id)',
        ),
      );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalCostMinorMeta = const VerificationMeta(
    'totalCostMinor',
  );
  @override
  late final GeneratedColumn<int> totalCostMinor = GeneratedColumn<int>(
    'total_cost_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distributionMethodMeta =
      const VerificationMeta('distributionMethod');
  @override
  late final GeneratedColumn<String> distributionMethod =
      GeneratedColumn<String>(
        'distribution_method',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    accountingMonthId,
    date,
    title,
    totalCostMinor,
    distributionMethod,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'special_meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpecialMeal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('accounting_month_id')) {
      context.handle(
        _accountingMonthIdMeta,
        accountingMonthId.isAcceptableOrUnknown(
          data['accounting_month_id']!,
          _accountingMonthIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountingMonthIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('total_cost_minor')) {
      context.handle(
        _totalCostMinorMeta,
        totalCostMinor.isAcceptableOrUnknown(
          data['total_cost_minor']!,
          _totalCostMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalCostMinorMeta);
    }
    if (data.containsKey('distribution_method')) {
      context.handle(
        _distributionMethodMeta,
        distributionMethod.isAcceptableOrUnknown(
          data['distribution_method']!,
          _distributionMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_distributionMethodMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpecialMeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpecialMeal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      accountingMonthId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accounting_month_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      totalCostMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_cost_minor'],
      )!,
      distributionMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}distribution_method'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SpecialMealsTable createAlias(String alias) {
    return $SpecialMealsTable(attachedDatabase, alias);
  }
}

class SpecialMeal extends DataClass implements Insertable<SpecialMeal> {
  final String id;
  final String messId;
  final String accountingMonthId;
  final DateTime date;
  final String title;
  final int totalCostMinor;
  final String distributionMethod;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SpecialMeal({
    required this.id,
    required this.messId,
    required this.accountingMonthId,
    required this.date,
    required this.title,
    required this.totalCostMinor,
    required this.distributionMethod,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['accounting_month_id'] = Variable<String>(accountingMonthId);
    map['date'] = Variable<DateTime>(date);
    map['title'] = Variable<String>(title);
    map['total_cost_minor'] = Variable<int>(totalCostMinor);
    map['distribution_method'] = Variable<String>(distributionMethod);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SpecialMealsCompanion toCompanion(bool nullToAbsent) {
    return SpecialMealsCompanion(
      id: Value(id),
      messId: Value(messId),
      accountingMonthId: Value(accountingMonthId),
      date: Value(date),
      title: Value(title),
      totalCostMinor: Value(totalCostMinor),
      distributionMethod: Value(distributionMethod),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SpecialMeal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpecialMeal(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      accountingMonthId: serializer.fromJson<String>(json['accountingMonthId']),
      date: serializer.fromJson<DateTime>(json['date']),
      title: serializer.fromJson<String>(json['title']),
      totalCostMinor: serializer.fromJson<int>(json['totalCostMinor']),
      distributionMethod: serializer.fromJson<String>(
        json['distributionMethod'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'accountingMonthId': serializer.toJson<String>(accountingMonthId),
      'date': serializer.toJson<DateTime>(date),
      'title': serializer.toJson<String>(title),
      'totalCostMinor': serializer.toJson<int>(totalCostMinor),
      'distributionMethod': serializer.toJson<String>(distributionMethod),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SpecialMeal copyWith({
    String? id,
    String? messId,
    String? accountingMonthId,
    DateTime? date,
    String? title,
    int? totalCostMinor,
    String? distributionMethod,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SpecialMeal(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    accountingMonthId: accountingMonthId ?? this.accountingMonthId,
    date: date ?? this.date,
    title: title ?? this.title,
    totalCostMinor: totalCostMinor ?? this.totalCostMinor,
    distributionMethod: distributionMethod ?? this.distributionMethod,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SpecialMeal copyWithCompanion(SpecialMealsCompanion data) {
    return SpecialMeal(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      accountingMonthId: data.accountingMonthId.present
          ? data.accountingMonthId.value
          : this.accountingMonthId,
      date: data.date.present ? data.date.value : this.date,
      title: data.title.present ? data.title.value : this.title,
      totalCostMinor: data.totalCostMinor.present
          ? data.totalCostMinor.value
          : this.totalCostMinor,
      distributionMethod: data.distributionMethod.present
          ? data.distributionMethod.value
          : this.distributionMethod,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpecialMeal(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('totalCostMinor: $totalCostMinor, ')
          ..write('distributionMethod: $distributionMethod, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    accountingMonthId,
    date,
    title,
    totalCostMinor,
    distributionMethod,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpecialMeal &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.accountingMonthId == this.accountingMonthId &&
          other.date == this.date &&
          other.title == this.title &&
          other.totalCostMinor == this.totalCostMinor &&
          other.distributionMethod == this.distributionMethod &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SpecialMealsCompanion extends UpdateCompanion<SpecialMeal> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> accountingMonthId;
  final Value<DateTime> date;
  final Value<String> title;
  final Value<int> totalCostMinor;
  final Value<String> distributionMethod;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SpecialMealsCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.accountingMonthId = const Value.absent(),
    this.date = const Value.absent(),
    this.title = const Value.absent(),
    this.totalCostMinor = const Value.absent(),
    this.distributionMethod = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpecialMealsCompanion.insert({
    required String id,
    required String messId,
    required String accountingMonthId,
    required DateTime date,
    required String title,
    required int totalCostMinor,
    required String distributionMethod,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       accountingMonthId = Value(accountingMonthId),
       date = Value(date),
       title = Value(title),
       totalCostMinor = Value(totalCostMinor),
       distributionMethod = Value(distributionMethod);
  static Insertable<SpecialMeal> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? accountingMonthId,
    Expression<DateTime>? date,
    Expression<String>? title,
    Expression<int>? totalCostMinor,
    Expression<String>? distributionMethod,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (accountingMonthId != null) 'accounting_month_id': accountingMonthId,
      if (date != null) 'date': date,
      if (title != null) 'title': title,
      if (totalCostMinor != null) 'total_cost_minor': totalCostMinor,
      if (distributionMethod != null) 'distribution_method': distributionMethod,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpecialMealsCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? accountingMonthId,
    Value<DateTime>? date,
    Value<String>? title,
    Value<int>? totalCostMinor,
    Value<String>? distributionMethod,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SpecialMealsCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      accountingMonthId: accountingMonthId ?? this.accountingMonthId,
      date: date ?? this.date,
      title: title ?? this.title,
      totalCostMinor: totalCostMinor ?? this.totalCostMinor,
      distributionMethod: distributionMethod ?? this.distributionMethod,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (accountingMonthId.present) {
      map['accounting_month_id'] = Variable<String>(accountingMonthId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (totalCostMinor.present) {
      map['total_cost_minor'] = Variable<int>(totalCostMinor.value);
    }
    if (distributionMethod.present) {
      map['distribution_method'] = Variable<String>(distributionMethod.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpecialMealsCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('totalCostMinor: $totalCostMinor, ')
          ..write('distributionMethod: $distributionMethod, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpecialMealMembersTable extends SpecialMealMembers
    with TableInfo<$SpecialMealMembersTable, SpecialMealMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpecialMealMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specialMealIdMeta = const VerificationMeta(
    'specialMealId',
  );
  @override
  late final GeneratedColumn<String> specialMealId = GeneratedColumn<String>(
    'special_meal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES special_meals (id)',
    ),
  );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
    'member_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _shareAmountMinorMeta = const VerificationMeta(
    'shareAmountMinor',
  );
  @override
  late final GeneratedColumn<int> shareAmountMinor = GeneratedColumn<int>(
    'share_amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    specialMealId,
    memberId,
    shareAmountMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'special_meal_members';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpecialMealMember> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('special_meal_id')) {
      context.handle(
        _specialMealIdMeta,
        specialMealId.isAcceptableOrUnknown(
          data['special_meal_id']!,
          _specialMealIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_specialMealIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('share_amount_minor')) {
      context.handle(
        _shareAmountMinorMeta,
        shareAmountMinor.isAcceptableOrUnknown(
          data['share_amount_minor']!,
          _shareAmountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shareAmountMinorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpecialMealMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpecialMealMember(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      specialMealId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}special_meal_id'],
      )!,
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}member_id'],
      )!,
      shareAmountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}share_amount_minor'],
      )!,
    );
  }

  @override
  $SpecialMealMembersTable createAlias(String alias) {
    return $SpecialMealMembersTable(attachedDatabase, alias);
  }
}

class SpecialMealMember extends DataClass
    implements Insertable<SpecialMealMember> {
  final String id;
  final String specialMealId;
  final String memberId;
  final int shareAmountMinor;
  const SpecialMealMember({
    required this.id,
    required this.specialMealId,
    required this.memberId,
    required this.shareAmountMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['special_meal_id'] = Variable<String>(specialMealId);
    map['member_id'] = Variable<String>(memberId);
    map['share_amount_minor'] = Variable<int>(shareAmountMinor);
    return map;
  }

  SpecialMealMembersCompanion toCompanion(bool nullToAbsent) {
    return SpecialMealMembersCompanion(
      id: Value(id),
      specialMealId: Value(specialMealId),
      memberId: Value(memberId),
      shareAmountMinor: Value(shareAmountMinor),
    );
  }

  factory SpecialMealMember.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpecialMealMember(
      id: serializer.fromJson<String>(json['id']),
      specialMealId: serializer.fromJson<String>(json['specialMealId']),
      memberId: serializer.fromJson<String>(json['memberId']),
      shareAmountMinor: serializer.fromJson<int>(json['shareAmountMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'specialMealId': serializer.toJson<String>(specialMealId),
      'memberId': serializer.toJson<String>(memberId),
      'shareAmountMinor': serializer.toJson<int>(shareAmountMinor),
    };
  }

  SpecialMealMember copyWith({
    String? id,
    String? specialMealId,
    String? memberId,
    int? shareAmountMinor,
  }) => SpecialMealMember(
    id: id ?? this.id,
    specialMealId: specialMealId ?? this.specialMealId,
    memberId: memberId ?? this.memberId,
    shareAmountMinor: shareAmountMinor ?? this.shareAmountMinor,
  );
  SpecialMealMember copyWithCompanion(SpecialMealMembersCompanion data) {
    return SpecialMealMember(
      id: data.id.present ? data.id.value : this.id,
      specialMealId: data.specialMealId.present
          ? data.specialMealId.value
          : this.specialMealId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      shareAmountMinor: data.shareAmountMinor.present
          ? data.shareAmountMinor.value
          : this.shareAmountMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpecialMealMember(')
          ..write('id: $id, ')
          ..write('specialMealId: $specialMealId, ')
          ..write('memberId: $memberId, ')
          ..write('shareAmountMinor: $shareAmountMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, specialMealId, memberId, shareAmountMinor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpecialMealMember &&
          other.id == this.id &&
          other.specialMealId == this.specialMealId &&
          other.memberId == this.memberId &&
          other.shareAmountMinor == this.shareAmountMinor);
}

class SpecialMealMembersCompanion extends UpdateCompanion<SpecialMealMember> {
  final Value<String> id;
  final Value<String> specialMealId;
  final Value<String> memberId;
  final Value<int> shareAmountMinor;
  final Value<int> rowid;
  const SpecialMealMembersCompanion({
    this.id = const Value.absent(),
    this.specialMealId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.shareAmountMinor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpecialMealMembersCompanion.insert({
    required String id,
    required String specialMealId,
    required String memberId,
    required int shareAmountMinor,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       specialMealId = Value(specialMealId),
       memberId = Value(memberId),
       shareAmountMinor = Value(shareAmountMinor);
  static Insertable<SpecialMealMember> custom({
    Expression<String>? id,
    Expression<String>? specialMealId,
    Expression<String>? memberId,
    Expression<int>? shareAmountMinor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (specialMealId != null) 'special_meal_id': specialMealId,
      if (memberId != null) 'member_id': memberId,
      if (shareAmountMinor != null) 'share_amount_minor': shareAmountMinor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpecialMealMembersCompanion copyWith({
    Value<String>? id,
    Value<String>? specialMealId,
    Value<String>? memberId,
    Value<int>? shareAmountMinor,
    Value<int>? rowid,
  }) {
    return SpecialMealMembersCompanion(
      id: id ?? this.id,
      specialMealId: specialMealId ?? this.specialMealId,
      memberId: memberId ?? this.memberId,
      shareAmountMinor: shareAmountMinor ?? this.shareAmountMinor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (specialMealId.present) {
      map['special_meal_id'] = Variable<String>(specialMealId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (shareAmountMinor.present) {
      map['share_amount_minor'] = Variable<int>(shareAmountMinor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpecialMealMembersCompanion(')
          ..write('id: $id, ')
          ..write('specialMealId: $specialMealId, ')
          ..write('memberId: $memberId, ')
          ..write('shareAmountMinor: $shareAmountMinor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpenseCategoriesTable extends ExpenseCategories
    with TableInfo<$ExpenseCategoriesTable, ExpenseCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
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
  static const VerificationMeta _nameBnMeta = const VerificationMeta('nameBn');
  @override
  late final GeneratedColumn<String> nameBn = GeneratedColumn<String>(
    'name_bn',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSystemMeta = const VerificationMeta(
    'isSystem',
  );
  @override
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
    'is_system',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_system" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    name,
    nameBn,
    type,
    isSystem,
    isActive,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExpenseCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_bn')) {
      context.handle(
        _nameBnMeta,
        nameBn.isAcceptableOrUnknown(data['name_bn']!, _nameBnMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('is_system')) {
      context.handle(
        _isSystemMeta,
        isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameBn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_bn'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      isSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $ExpenseCategoriesTable createAlias(String alias) {
    return $ExpenseCategoriesTable(attachedDatabase, alias);
  }
}

class ExpenseCategory extends DataClass implements Insertable<ExpenseCategory> {
  final String id;
  final String messId;
  final String name;
  final String? nameBn;
  final String type;
  final bool isSystem;
  final bool isActive;
  final int sortOrder;
  const ExpenseCategory({
    required this.id,
    required this.messId,
    required this.name,
    this.nameBn,
    required this.type,
    required this.isSystem,
    required this.isActive,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nameBn != null) {
      map['name_bn'] = Variable<String>(nameBn);
    }
    map['type'] = Variable<String>(type);
    map['is_system'] = Variable<bool>(isSystem);
    map['is_active'] = Variable<bool>(isActive);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ExpenseCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCategoriesCompanion(
      id: Value(id),
      messId: Value(messId),
      name: Value(name),
      nameBn: nameBn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameBn),
      type: Value(type),
      isSystem: Value(isSystem),
      isActive: Value(isActive),
      sortOrder: Value(sortOrder),
    );
  }

  factory ExpenseCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseCategory(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      name: serializer.fromJson<String>(json['name']),
      nameBn: serializer.fromJson<String?>(json['nameBn']),
      type: serializer.fromJson<String>(json['type']),
      isSystem: serializer.fromJson<bool>(json['isSystem']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'name': serializer.toJson<String>(name),
      'nameBn': serializer.toJson<String?>(nameBn),
      'type': serializer.toJson<String>(type),
      'isSystem': serializer.toJson<bool>(isSystem),
      'isActive': serializer.toJson<bool>(isActive),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  ExpenseCategory copyWith({
    String? id,
    String? messId,
    String? name,
    Value<String?> nameBn = const Value.absent(),
    String? type,
    bool? isSystem,
    bool? isActive,
    int? sortOrder,
  }) => ExpenseCategory(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    name: name ?? this.name,
    nameBn: nameBn.present ? nameBn.value : this.nameBn,
    type: type ?? this.type,
    isSystem: isSystem ?? this.isSystem,
    isActive: isActive ?? this.isActive,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  ExpenseCategory copyWithCompanion(ExpenseCategoriesCompanion data) {
    return ExpenseCategory(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      name: data.name.present ? data.name.value : this.name,
      nameBn: data.nameBn.present ? data.nameBn.value : this.nameBn,
      type: data.type.present ? data.type.value : this.type,
      isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategory(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('name: $name, ')
          ..write('nameBn: $nameBn, ')
          ..write('type: $type, ')
          ..write('isSystem: $isSystem, ')
          ..write('isActive: $isActive, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    name,
    nameBn,
    type,
    isSystem,
    isActive,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseCategory &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.name == this.name &&
          other.nameBn == this.nameBn &&
          other.type == this.type &&
          other.isSystem == this.isSystem &&
          other.isActive == this.isActive &&
          other.sortOrder == this.sortOrder);
}

class ExpenseCategoriesCompanion extends UpdateCompanion<ExpenseCategory> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> name;
  final Value<String?> nameBn;
  final Value<String> type;
  final Value<bool> isSystem;
  final Value<bool> isActive;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const ExpenseCategoriesCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.name = const Value.absent(),
    this.nameBn = const Value.absent(),
    this.type = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.isActive = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpenseCategoriesCompanion.insert({
    required String id,
    required String messId,
    required String name,
    this.nameBn = const Value.absent(),
    required String type,
    this.isSystem = const Value.absent(),
    this.isActive = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       name = Value(name),
       type = Value(type);
  static Insertable<ExpenseCategory> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? name,
    Expression<String>? nameBn,
    Expression<String>? type,
    Expression<bool>? isSystem,
    Expression<bool>? isActive,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (name != null) 'name': name,
      if (nameBn != null) 'name_bn': nameBn,
      if (type != null) 'type': type,
      if (isSystem != null) 'is_system': isSystem,
      if (isActive != null) 'is_active': isActive,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpenseCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? name,
    Value<String?>? nameBn,
    Value<String>? type,
    Value<bool>? isSystem,
    Value<bool>? isActive,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return ExpenseCategoriesCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      name: name ?? this.name,
      nameBn: nameBn ?? this.nameBn,
      type: type ?? this.type,
      isSystem: isSystem ?? this.isSystem,
      isActive: isActive ?? this.isActive,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameBn.present) {
      map['name_bn'] = Variable<String>(nameBn.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('name: $name, ')
          ..write('nameBn: $nameBn, ')
          ..write('type: $type, ')
          ..write('isSystem: $isSystem, ')
          ..write('isActive: $isActive, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _accountingMonthIdMeta = const VerificationMeta(
    'accountingMonthId',
  );
  @override
  late final GeneratedColumn<String> accountingMonthId =
      GeneratedColumn<String>(
        'accounting_month_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounting_months (id)',
        ),
      );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES expense_categories (id)',
    ),
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vendorMeta = const VerificationMeta('vendor');
  @override
  late final GeneratedColumn<String> vendor = GeneratedColumn<String>(
    'vendor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paidByMemberIdMeta = const VerificationMeta(
    'paidByMemberId',
  );
  @override
  late final GeneratedColumn<String> paidByMemberId = GeneratedColumn<String>(
    'paid_by_member_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _paymentSourceMeta = const VerificationMeta(
    'paymentSource',
  );
  @override
  late final GeneratedColumn<String> paymentSource = GeneratedColumn<String>(
    'payment_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _affectsMealRateMeta = const VerificationMeta(
    'affectsMealRate',
  );
  @override
  late final GeneratedColumn<bool> affectsMealRate = GeneratedColumn<bool>(
    'affects_meal_rate',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("affects_meal_rate" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _distributionMethodMeta =
      const VerificationMeta('distributionMethod');
  @override
  late final GeneratedColumn<String> distributionMethod =
      GeneratedColumn<String>(
        'distribution_method',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _receiptPathMeta = const VerificationMeta(
    'receiptPath',
  );
  @override
  late final GeneratedColumn<String> receiptPath = GeneratedColumn<String>(
    'receipt_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    accountingMonthId,
    date,
    categoryId,
    amountMinor,
    description,
    vendor,
    paidByMemberId,
    paymentSource,
    affectsMealRate,
    distributionMethod,
    receiptPath,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Expense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('accounting_month_id')) {
      context.handle(
        _accountingMonthIdMeta,
        accountingMonthId.isAcceptableOrUnknown(
          data['accounting_month_id']!,
          _accountingMonthIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountingMonthIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('vendor')) {
      context.handle(
        _vendorMeta,
        vendor.isAcceptableOrUnknown(data['vendor']!, _vendorMeta),
      );
    }
    if (data.containsKey('paid_by_member_id')) {
      context.handle(
        _paidByMemberIdMeta,
        paidByMemberId.isAcceptableOrUnknown(
          data['paid_by_member_id']!,
          _paidByMemberIdMeta,
        ),
      );
    }
    if (data.containsKey('payment_source')) {
      context.handle(
        _paymentSourceMeta,
        paymentSource.isAcceptableOrUnknown(
          data['payment_source']!,
          _paymentSourceMeta,
        ),
      );
    }
    if (data.containsKey('affects_meal_rate')) {
      context.handle(
        _affectsMealRateMeta,
        affectsMealRate.isAcceptableOrUnknown(
          data['affects_meal_rate']!,
          _affectsMealRateMeta,
        ),
      );
    }
    if (data.containsKey('distribution_method')) {
      context.handle(
        _distributionMethodMeta,
        distributionMethod.isAcceptableOrUnknown(
          data['distribution_method']!,
          _distributionMethodMeta,
        ),
      );
    }
    if (data.containsKey('receipt_path')) {
      context.handle(
        _receiptPathMeta,
        receiptPath.isAcceptableOrUnknown(
          data['receipt_path']!,
          _receiptPathMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      accountingMonthId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accounting_month_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      vendor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vendor'],
      ),
      paidByMemberId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}paid_by_member_id'],
      ),
      paymentSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_source'],
      ),
      affectsMealRate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}affects_meal_rate'],
      )!,
      distributionMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}distribution_method'],
      ),
      receiptPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_path'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final String id;
  final String messId;
  final String accountingMonthId;
  final DateTime date;
  final String categoryId;
  final int amountMinor;
  final String? description;
  final String? vendor;
  final String? paidByMemberId;
  final String? paymentSource;
  final bool affectsMealRate;
  final String? distributionMethod;
  final String? receiptPath;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Expense({
    required this.id,
    required this.messId,
    required this.accountingMonthId,
    required this.date,
    required this.categoryId,
    required this.amountMinor,
    this.description,
    this.vendor,
    this.paidByMemberId,
    this.paymentSource,
    required this.affectsMealRate,
    this.distributionMethod,
    this.receiptPath,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['accounting_month_id'] = Variable<String>(accountingMonthId);
    map['date'] = Variable<DateTime>(date);
    map['category_id'] = Variable<String>(categoryId);
    map['amount_minor'] = Variable<int>(amountMinor);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || vendor != null) {
      map['vendor'] = Variable<String>(vendor);
    }
    if (!nullToAbsent || paidByMemberId != null) {
      map['paid_by_member_id'] = Variable<String>(paidByMemberId);
    }
    if (!nullToAbsent || paymentSource != null) {
      map['payment_source'] = Variable<String>(paymentSource);
    }
    map['affects_meal_rate'] = Variable<bool>(affectsMealRate);
    if (!nullToAbsent || distributionMethod != null) {
      map['distribution_method'] = Variable<String>(distributionMethod);
    }
    if (!nullToAbsent || receiptPath != null) {
      map['receipt_path'] = Variable<String>(receiptPath);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      messId: Value(messId),
      accountingMonthId: Value(accountingMonthId),
      date: Value(date),
      categoryId: Value(categoryId),
      amountMinor: Value(amountMinor),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      vendor: vendor == null && nullToAbsent
          ? const Value.absent()
          : Value(vendor),
      paidByMemberId: paidByMemberId == null && nullToAbsent
          ? const Value.absent()
          : Value(paidByMemberId),
      paymentSource: paymentSource == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentSource),
      affectsMealRate: Value(affectsMealRate),
      distributionMethod: distributionMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(distributionMethod),
      receiptPath: receiptPath == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptPath),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Expense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      accountingMonthId: serializer.fromJson<String>(json['accountingMonthId']),
      date: serializer.fromJson<DateTime>(json['date']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      description: serializer.fromJson<String?>(json['description']),
      vendor: serializer.fromJson<String?>(json['vendor']),
      paidByMemberId: serializer.fromJson<String?>(json['paidByMemberId']),
      paymentSource: serializer.fromJson<String?>(json['paymentSource']),
      affectsMealRate: serializer.fromJson<bool>(json['affectsMealRate']),
      distributionMethod: serializer.fromJson<String?>(
        json['distributionMethod'],
      ),
      receiptPath: serializer.fromJson<String?>(json['receiptPath']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'accountingMonthId': serializer.toJson<String>(accountingMonthId),
      'date': serializer.toJson<DateTime>(date),
      'categoryId': serializer.toJson<String>(categoryId),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'description': serializer.toJson<String?>(description),
      'vendor': serializer.toJson<String?>(vendor),
      'paidByMemberId': serializer.toJson<String?>(paidByMemberId),
      'paymentSource': serializer.toJson<String?>(paymentSource),
      'affectsMealRate': serializer.toJson<bool>(affectsMealRate),
      'distributionMethod': serializer.toJson<String?>(distributionMethod),
      'receiptPath': serializer.toJson<String?>(receiptPath),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Expense copyWith({
    String? id,
    String? messId,
    String? accountingMonthId,
    DateTime? date,
    String? categoryId,
    int? amountMinor,
    Value<String?> description = const Value.absent(),
    Value<String?> vendor = const Value.absent(),
    Value<String?> paidByMemberId = const Value.absent(),
    Value<String?> paymentSource = const Value.absent(),
    bool? affectsMealRate,
    Value<String?> distributionMethod = const Value.absent(),
    Value<String?> receiptPath = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Expense(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    accountingMonthId: accountingMonthId ?? this.accountingMonthId,
    date: date ?? this.date,
    categoryId: categoryId ?? this.categoryId,
    amountMinor: amountMinor ?? this.amountMinor,
    description: description.present ? description.value : this.description,
    vendor: vendor.present ? vendor.value : this.vendor,
    paidByMemberId: paidByMemberId.present
        ? paidByMemberId.value
        : this.paidByMemberId,
    paymentSource: paymentSource.present
        ? paymentSource.value
        : this.paymentSource,
    affectsMealRate: affectsMealRate ?? this.affectsMealRate,
    distributionMethod: distributionMethod.present
        ? distributionMethod.value
        : this.distributionMethod,
    receiptPath: receiptPath.present ? receiptPath.value : this.receiptPath,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      accountingMonthId: data.accountingMonthId.present
          ? data.accountingMonthId.value
          : this.accountingMonthId,
      date: data.date.present ? data.date.value : this.date,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      description: data.description.present
          ? data.description.value
          : this.description,
      vendor: data.vendor.present ? data.vendor.value : this.vendor,
      paidByMemberId: data.paidByMemberId.present
          ? data.paidByMemberId.value
          : this.paidByMemberId,
      paymentSource: data.paymentSource.present
          ? data.paymentSource.value
          : this.paymentSource,
      affectsMealRate: data.affectsMealRate.present
          ? data.affectsMealRate.value
          : this.affectsMealRate,
      distributionMethod: data.distributionMethod.present
          ? data.distributionMethod.value
          : this.distributionMethod,
      receiptPath: data.receiptPath.present
          ? data.receiptPath.value
          : this.receiptPath,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('description: $description, ')
          ..write('vendor: $vendor, ')
          ..write('paidByMemberId: $paidByMemberId, ')
          ..write('paymentSource: $paymentSource, ')
          ..write('affectsMealRate: $affectsMealRate, ')
          ..write('distributionMethod: $distributionMethod, ')
          ..write('receiptPath: $receiptPath, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    accountingMonthId,
    date,
    categoryId,
    amountMinor,
    description,
    vendor,
    paidByMemberId,
    paymentSource,
    affectsMealRate,
    distributionMethod,
    receiptPath,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.accountingMonthId == this.accountingMonthId &&
          other.date == this.date &&
          other.categoryId == this.categoryId &&
          other.amountMinor == this.amountMinor &&
          other.description == this.description &&
          other.vendor == this.vendor &&
          other.paidByMemberId == this.paidByMemberId &&
          other.paymentSource == this.paymentSource &&
          other.affectsMealRate == this.affectsMealRate &&
          other.distributionMethod == this.distributionMethod &&
          other.receiptPath == this.receiptPath &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> accountingMonthId;
  final Value<DateTime> date;
  final Value<String> categoryId;
  final Value<int> amountMinor;
  final Value<String?> description;
  final Value<String?> vendor;
  final Value<String?> paidByMemberId;
  final Value<String?> paymentSource;
  final Value<bool> affectsMealRate;
  final Value<String?> distributionMethod;
  final Value<String?> receiptPath;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.accountingMonthId = const Value.absent(),
    this.date = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.description = const Value.absent(),
    this.vendor = const Value.absent(),
    this.paidByMemberId = const Value.absent(),
    this.paymentSource = const Value.absent(),
    this.affectsMealRate = const Value.absent(),
    this.distributionMethod = const Value.absent(),
    this.receiptPath = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesCompanion.insert({
    required String id,
    required String messId,
    required String accountingMonthId,
    required DateTime date,
    required String categoryId,
    required int amountMinor,
    this.description = const Value.absent(),
    this.vendor = const Value.absent(),
    this.paidByMemberId = const Value.absent(),
    this.paymentSource = const Value.absent(),
    this.affectsMealRate = const Value.absent(),
    this.distributionMethod = const Value.absent(),
    this.receiptPath = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       accountingMonthId = Value(accountingMonthId),
       date = Value(date),
       categoryId = Value(categoryId),
       amountMinor = Value(amountMinor);
  static Insertable<Expense> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? accountingMonthId,
    Expression<DateTime>? date,
    Expression<String>? categoryId,
    Expression<int>? amountMinor,
    Expression<String>? description,
    Expression<String>? vendor,
    Expression<String>? paidByMemberId,
    Expression<String>? paymentSource,
    Expression<bool>? affectsMealRate,
    Expression<String>? distributionMethod,
    Expression<String>? receiptPath,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (accountingMonthId != null) 'accounting_month_id': accountingMonthId,
      if (date != null) 'date': date,
      if (categoryId != null) 'category_id': categoryId,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (description != null) 'description': description,
      if (vendor != null) 'vendor': vendor,
      if (paidByMemberId != null) 'paid_by_member_id': paidByMemberId,
      if (paymentSource != null) 'payment_source': paymentSource,
      if (affectsMealRate != null) 'affects_meal_rate': affectsMealRate,
      if (distributionMethod != null) 'distribution_method': distributionMethod,
      if (receiptPath != null) 'receipt_path': receiptPath,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? accountingMonthId,
    Value<DateTime>? date,
    Value<String>? categoryId,
    Value<int>? amountMinor,
    Value<String?>? description,
    Value<String?>? vendor,
    Value<String?>? paidByMemberId,
    Value<String?>? paymentSource,
    Value<bool>? affectsMealRate,
    Value<String?>? distributionMethod,
    Value<String?>? receiptPath,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ExpensesCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      accountingMonthId: accountingMonthId ?? this.accountingMonthId,
      date: date ?? this.date,
      categoryId: categoryId ?? this.categoryId,
      amountMinor: amountMinor ?? this.amountMinor,
      description: description ?? this.description,
      vendor: vendor ?? this.vendor,
      paidByMemberId: paidByMemberId ?? this.paidByMemberId,
      paymentSource: paymentSource ?? this.paymentSource,
      affectsMealRate: affectsMealRate ?? this.affectsMealRate,
      distributionMethod: distributionMethod ?? this.distributionMethod,
      receiptPath: receiptPath ?? this.receiptPath,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (accountingMonthId.present) {
      map['accounting_month_id'] = Variable<String>(accountingMonthId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (vendor.present) {
      map['vendor'] = Variable<String>(vendor.value);
    }
    if (paidByMemberId.present) {
      map['paid_by_member_id'] = Variable<String>(paidByMemberId.value);
    }
    if (paymentSource.present) {
      map['payment_source'] = Variable<String>(paymentSource.value);
    }
    if (affectsMealRate.present) {
      map['affects_meal_rate'] = Variable<bool>(affectsMealRate.value);
    }
    if (distributionMethod.present) {
      map['distribution_method'] = Variable<String>(distributionMethod.value);
    }
    if (receiptPath.present) {
      map['receipt_path'] = Variable<String>(receiptPath.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('description: $description, ')
          ..write('vendor: $vendor, ')
          ..write('paidByMemberId: $paidByMemberId, ')
          ..write('paymentSource: $paymentSource, ')
          ..write('affectsMealRate: $affectsMealRate, ')
          ..write('distributionMethod: $distributionMethod, ')
          ..write('receiptPath: $receiptPath, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UtilityBillsTable extends UtilityBills
    with TableInfo<$UtilityBillsTable, UtilityBill> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UtilityBillsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _accountingMonthIdMeta = const VerificationMeta(
    'accountingMonthId',
  );
  @override
  late final GeneratedColumn<String> accountingMonthId =
      GeneratedColumn<String>(
        'accounting_month_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounting_months (id)',
        ),
      );
  static const VerificationMeta _billTypeMeta = const VerificationMeta(
    'billType',
  );
  @override
  late final GeneratedColumn<String> billType = GeneratedColumn<String>(
    'bill_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _billingMonthMeta = const VerificationMeta(
    'billingMonth',
  );
  @override
  late final GeneratedColumn<DateTime> billingMonth = GeneratedColumn<DateTime>(
    'billing_month',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paidDateMeta = const VerificationMeta(
    'paidDate',
  );
  @override
  late final GeneratedColumn<DateTime> paidDate = GeneratedColumn<DateTime>(
    'paid_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unpaid'),
  );
  static const VerificationMeta _paidByMemberIdMeta = const VerificationMeta(
    'paidByMemberId',
  );
  @override
  late final GeneratedColumn<String> paidByMemberId = GeneratedColumn<String>(
    'paid_by_member_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _distributionMethodMeta =
      const VerificationMeta('distributionMethod');
  @override
  late final GeneratedColumn<String> distributionMethod =
      GeneratedColumn<String>(
        'distribution_method',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _receiptPathMeta = const VerificationMeta(
    'receiptPath',
  );
  @override
  late final GeneratedColumn<String> receiptPath = GeneratedColumn<String>(
    'receipt_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    accountingMonthId,
    billType,
    amountMinor,
    billingMonth,
    dueDate,
    paidDate,
    status,
    paidByMemberId,
    distributionMethod,
    receiptPath,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'utility_bills';
  @override
  VerificationContext validateIntegrity(
    Insertable<UtilityBill> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('accounting_month_id')) {
      context.handle(
        _accountingMonthIdMeta,
        accountingMonthId.isAcceptableOrUnknown(
          data['accounting_month_id']!,
          _accountingMonthIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountingMonthIdMeta);
    }
    if (data.containsKey('bill_type')) {
      context.handle(
        _billTypeMeta,
        billType.isAcceptableOrUnknown(data['bill_type']!, _billTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_billTypeMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('billing_month')) {
      context.handle(
        _billingMonthMeta,
        billingMonth.isAcceptableOrUnknown(
          data['billing_month']!,
          _billingMonthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_billingMonthMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('paid_date')) {
      context.handle(
        _paidDateMeta,
        paidDate.isAcceptableOrUnknown(data['paid_date']!, _paidDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('paid_by_member_id')) {
      context.handle(
        _paidByMemberIdMeta,
        paidByMemberId.isAcceptableOrUnknown(
          data['paid_by_member_id']!,
          _paidByMemberIdMeta,
        ),
      );
    }
    if (data.containsKey('distribution_method')) {
      context.handle(
        _distributionMethodMeta,
        distributionMethod.isAcceptableOrUnknown(
          data['distribution_method']!,
          _distributionMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_distributionMethodMeta);
    }
    if (data.containsKey('receipt_path')) {
      context.handle(
        _receiptPathMeta,
        receiptPath.isAcceptableOrUnknown(
          data['receipt_path']!,
          _receiptPathMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UtilityBill map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UtilityBill(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      accountingMonthId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accounting_month_id'],
      )!,
      billType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bill_type'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      billingMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}billing_month'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      paidDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}paid_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      paidByMemberId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}paid_by_member_id'],
      ),
      distributionMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}distribution_method'],
      )!,
      receiptPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_path'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UtilityBillsTable createAlias(String alias) {
    return $UtilityBillsTable(attachedDatabase, alias);
  }
}

class UtilityBill extends DataClass implements Insertable<UtilityBill> {
  final String id;
  final String messId;
  final String accountingMonthId;
  final String billType;
  final int amountMinor;
  final DateTime billingMonth;
  final DateTime? dueDate;
  final DateTime? paidDate;
  final String status;
  final String? paidByMemberId;
  final String distributionMethod;
  final String? receiptPath;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UtilityBill({
    required this.id,
    required this.messId,
    required this.accountingMonthId,
    required this.billType,
    required this.amountMinor,
    required this.billingMonth,
    this.dueDate,
    this.paidDate,
    required this.status,
    this.paidByMemberId,
    required this.distributionMethod,
    this.receiptPath,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['accounting_month_id'] = Variable<String>(accountingMonthId);
    map['bill_type'] = Variable<String>(billType);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['billing_month'] = Variable<DateTime>(billingMonth);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || paidDate != null) {
      map['paid_date'] = Variable<DateTime>(paidDate);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || paidByMemberId != null) {
      map['paid_by_member_id'] = Variable<String>(paidByMemberId);
    }
    map['distribution_method'] = Variable<String>(distributionMethod);
    if (!nullToAbsent || receiptPath != null) {
      map['receipt_path'] = Variable<String>(receiptPath);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UtilityBillsCompanion toCompanion(bool nullToAbsent) {
    return UtilityBillsCompanion(
      id: Value(id),
      messId: Value(messId),
      accountingMonthId: Value(accountingMonthId),
      billType: Value(billType),
      amountMinor: Value(amountMinor),
      billingMonth: Value(billingMonth),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      paidDate: paidDate == null && nullToAbsent
          ? const Value.absent()
          : Value(paidDate),
      status: Value(status),
      paidByMemberId: paidByMemberId == null && nullToAbsent
          ? const Value.absent()
          : Value(paidByMemberId),
      distributionMethod: Value(distributionMethod),
      receiptPath: receiptPath == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptPath),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UtilityBill.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UtilityBill(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      accountingMonthId: serializer.fromJson<String>(json['accountingMonthId']),
      billType: serializer.fromJson<String>(json['billType']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      billingMonth: serializer.fromJson<DateTime>(json['billingMonth']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      paidDate: serializer.fromJson<DateTime?>(json['paidDate']),
      status: serializer.fromJson<String>(json['status']),
      paidByMemberId: serializer.fromJson<String?>(json['paidByMemberId']),
      distributionMethod: serializer.fromJson<String>(
        json['distributionMethod'],
      ),
      receiptPath: serializer.fromJson<String?>(json['receiptPath']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'accountingMonthId': serializer.toJson<String>(accountingMonthId),
      'billType': serializer.toJson<String>(billType),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'billingMonth': serializer.toJson<DateTime>(billingMonth),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'paidDate': serializer.toJson<DateTime?>(paidDate),
      'status': serializer.toJson<String>(status),
      'paidByMemberId': serializer.toJson<String?>(paidByMemberId),
      'distributionMethod': serializer.toJson<String>(distributionMethod),
      'receiptPath': serializer.toJson<String?>(receiptPath),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UtilityBill copyWith({
    String? id,
    String? messId,
    String? accountingMonthId,
    String? billType,
    int? amountMinor,
    DateTime? billingMonth,
    Value<DateTime?> dueDate = const Value.absent(),
    Value<DateTime?> paidDate = const Value.absent(),
    String? status,
    Value<String?> paidByMemberId = const Value.absent(),
    String? distributionMethod,
    Value<String?> receiptPath = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UtilityBill(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    accountingMonthId: accountingMonthId ?? this.accountingMonthId,
    billType: billType ?? this.billType,
    amountMinor: amountMinor ?? this.amountMinor,
    billingMonth: billingMonth ?? this.billingMonth,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    paidDate: paidDate.present ? paidDate.value : this.paidDate,
    status: status ?? this.status,
    paidByMemberId: paidByMemberId.present
        ? paidByMemberId.value
        : this.paidByMemberId,
    distributionMethod: distributionMethod ?? this.distributionMethod,
    receiptPath: receiptPath.present ? receiptPath.value : this.receiptPath,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UtilityBill copyWithCompanion(UtilityBillsCompanion data) {
    return UtilityBill(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      accountingMonthId: data.accountingMonthId.present
          ? data.accountingMonthId.value
          : this.accountingMonthId,
      billType: data.billType.present ? data.billType.value : this.billType,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      billingMonth: data.billingMonth.present
          ? data.billingMonth.value
          : this.billingMonth,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      paidDate: data.paidDate.present ? data.paidDate.value : this.paidDate,
      status: data.status.present ? data.status.value : this.status,
      paidByMemberId: data.paidByMemberId.present
          ? data.paidByMemberId.value
          : this.paidByMemberId,
      distributionMethod: data.distributionMethod.present
          ? data.distributionMethod.value
          : this.distributionMethod,
      receiptPath: data.receiptPath.present
          ? data.receiptPath.value
          : this.receiptPath,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UtilityBill(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('billType: $billType, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('billingMonth: $billingMonth, ')
          ..write('dueDate: $dueDate, ')
          ..write('paidDate: $paidDate, ')
          ..write('status: $status, ')
          ..write('paidByMemberId: $paidByMemberId, ')
          ..write('distributionMethod: $distributionMethod, ')
          ..write('receiptPath: $receiptPath, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    accountingMonthId,
    billType,
    amountMinor,
    billingMonth,
    dueDate,
    paidDate,
    status,
    paidByMemberId,
    distributionMethod,
    receiptPath,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UtilityBill &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.accountingMonthId == this.accountingMonthId &&
          other.billType == this.billType &&
          other.amountMinor == this.amountMinor &&
          other.billingMonth == this.billingMonth &&
          other.dueDate == this.dueDate &&
          other.paidDate == this.paidDate &&
          other.status == this.status &&
          other.paidByMemberId == this.paidByMemberId &&
          other.distributionMethod == this.distributionMethod &&
          other.receiptPath == this.receiptPath &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UtilityBillsCompanion extends UpdateCompanion<UtilityBill> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> accountingMonthId;
  final Value<String> billType;
  final Value<int> amountMinor;
  final Value<DateTime> billingMonth;
  final Value<DateTime?> dueDate;
  final Value<DateTime?> paidDate;
  final Value<String> status;
  final Value<String?> paidByMemberId;
  final Value<String> distributionMethod;
  final Value<String?> receiptPath;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UtilityBillsCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.accountingMonthId = const Value.absent(),
    this.billType = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.billingMonth = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.paidDate = const Value.absent(),
    this.status = const Value.absent(),
    this.paidByMemberId = const Value.absent(),
    this.distributionMethod = const Value.absent(),
    this.receiptPath = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UtilityBillsCompanion.insert({
    required String id,
    required String messId,
    required String accountingMonthId,
    required String billType,
    required int amountMinor,
    required DateTime billingMonth,
    this.dueDate = const Value.absent(),
    this.paidDate = const Value.absent(),
    this.status = const Value.absent(),
    this.paidByMemberId = const Value.absent(),
    required String distributionMethod,
    this.receiptPath = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       accountingMonthId = Value(accountingMonthId),
       billType = Value(billType),
       amountMinor = Value(amountMinor),
       billingMonth = Value(billingMonth),
       distributionMethod = Value(distributionMethod);
  static Insertable<UtilityBill> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? accountingMonthId,
    Expression<String>? billType,
    Expression<int>? amountMinor,
    Expression<DateTime>? billingMonth,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? paidDate,
    Expression<String>? status,
    Expression<String>? paidByMemberId,
    Expression<String>? distributionMethod,
    Expression<String>? receiptPath,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (accountingMonthId != null) 'accounting_month_id': accountingMonthId,
      if (billType != null) 'bill_type': billType,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (billingMonth != null) 'billing_month': billingMonth,
      if (dueDate != null) 'due_date': dueDate,
      if (paidDate != null) 'paid_date': paidDate,
      if (status != null) 'status': status,
      if (paidByMemberId != null) 'paid_by_member_id': paidByMemberId,
      if (distributionMethod != null) 'distribution_method': distributionMethod,
      if (receiptPath != null) 'receipt_path': receiptPath,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UtilityBillsCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? accountingMonthId,
    Value<String>? billType,
    Value<int>? amountMinor,
    Value<DateTime>? billingMonth,
    Value<DateTime?>? dueDate,
    Value<DateTime?>? paidDate,
    Value<String>? status,
    Value<String?>? paidByMemberId,
    Value<String>? distributionMethod,
    Value<String?>? receiptPath,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UtilityBillsCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      accountingMonthId: accountingMonthId ?? this.accountingMonthId,
      billType: billType ?? this.billType,
      amountMinor: amountMinor ?? this.amountMinor,
      billingMonth: billingMonth ?? this.billingMonth,
      dueDate: dueDate ?? this.dueDate,
      paidDate: paidDate ?? this.paidDate,
      status: status ?? this.status,
      paidByMemberId: paidByMemberId ?? this.paidByMemberId,
      distributionMethod: distributionMethod ?? this.distributionMethod,
      receiptPath: receiptPath ?? this.receiptPath,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (accountingMonthId.present) {
      map['accounting_month_id'] = Variable<String>(accountingMonthId.value);
    }
    if (billType.present) {
      map['bill_type'] = Variable<String>(billType.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (billingMonth.present) {
      map['billing_month'] = Variable<DateTime>(billingMonth.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (paidDate.present) {
      map['paid_date'] = Variable<DateTime>(paidDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (paidByMemberId.present) {
      map['paid_by_member_id'] = Variable<String>(paidByMemberId.value);
    }
    if (distributionMethod.present) {
      map['distribution_method'] = Variable<String>(distributionMethod.value);
    }
    if (receiptPath.present) {
      map['receipt_path'] = Variable<String>(receiptPath.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UtilityBillsCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('billType: $billType, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('billingMonth: $billingMonth, ')
          ..write('dueDate: $dueDate, ')
          ..write('paidDate: $paidDate, ')
          ..write('status: $status, ')
          ..write('paidByMemberId: $paidByMemberId, ')
          ..write('distributionMethod: $distributionMethod, ')
          ..write('receiptPath: $receiptPath, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UtilityBillAllocationsTable extends UtilityBillAllocations
    with TableInfo<$UtilityBillAllocationsTable, UtilityBillAllocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UtilityBillAllocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _utilityBillIdMeta = const VerificationMeta(
    'utilityBillId',
  );
  @override
  late final GeneratedColumn<String> utilityBillId = GeneratedColumn<String>(
    'utility_bill_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES utility_bills (id)',
    ),
  );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
    'member_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    utilityBillId,
    memberId,
    amountMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'utility_bill_allocations';
  @override
  VerificationContext validateIntegrity(
    Insertable<UtilityBillAllocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('utility_bill_id')) {
      context.handle(
        _utilityBillIdMeta,
        utilityBillId.isAcceptableOrUnknown(
          data['utility_bill_id']!,
          _utilityBillIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_utilityBillIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UtilityBillAllocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UtilityBillAllocation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      utilityBillId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}utility_bill_id'],
      )!,
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}member_id'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
    );
  }

  @override
  $UtilityBillAllocationsTable createAlias(String alias) {
    return $UtilityBillAllocationsTable(attachedDatabase, alias);
  }
}

class UtilityBillAllocation extends DataClass
    implements Insertable<UtilityBillAllocation> {
  final String id;
  final String utilityBillId;
  final String memberId;
  final int amountMinor;
  const UtilityBillAllocation({
    required this.id,
    required this.utilityBillId,
    required this.memberId,
    required this.amountMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['utility_bill_id'] = Variable<String>(utilityBillId);
    map['member_id'] = Variable<String>(memberId);
    map['amount_minor'] = Variable<int>(amountMinor);
    return map;
  }

  UtilityBillAllocationsCompanion toCompanion(bool nullToAbsent) {
    return UtilityBillAllocationsCompanion(
      id: Value(id),
      utilityBillId: Value(utilityBillId),
      memberId: Value(memberId),
      amountMinor: Value(amountMinor),
    );
  }

  factory UtilityBillAllocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UtilityBillAllocation(
      id: serializer.fromJson<String>(json['id']),
      utilityBillId: serializer.fromJson<String>(json['utilityBillId']),
      memberId: serializer.fromJson<String>(json['memberId']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'utilityBillId': serializer.toJson<String>(utilityBillId),
      'memberId': serializer.toJson<String>(memberId),
      'amountMinor': serializer.toJson<int>(amountMinor),
    };
  }

  UtilityBillAllocation copyWith({
    String? id,
    String? utilityBillId,
    String? memberId,
    int? amountMinor,
  }) => UtilityBillAllocation(
    id: id ?? this.id,
    utilityBillId: utilityBillId ?? this.utilityBillId,
    memberId: memberId ?? this.memberId,
    amountMinor: amountMinor ?? this.amountMinor,
  );
  UtilityBillAllocation copyWithCompanion(
    UtilityBillAllocationsCompanion data,
  ) {
    return UtilityBillAllocation(
      id: data.id.present ? data.id.value : this.id,
      utilityBillId: data.utilityBillId.present
          ? data.utilityBillId.value
          : this.utilityBillId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UtilityBillAllocation(')
          ..write('id: $id, ')
          ..write('utilityBillId: $utilityBillId, ')
          ..write('memberId: $memberId, ')
          ..write('amountMinor: $amountMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, utilityBillId, memberId, amountMinor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UtilityBillAllocation &&
          other.id == this.id &&
          other.utilityBillId == this.utilityBillId &&
          other.memberId == this.memberId &&
          other.amountMinor == this.amountMinor);
}

class UtilityBillAllocationsCompanion
    extends UpdateCompanion<UtilityBillAllocation> {
  final Value<String> id;
  final Value<String> utilityBillId;
  final Value<String> memberId;
  final Value<int> amountMinor;
  final Value<int> rowid;
  const UtilityBillAllocationsCompanion({
    this.id = const Value.absent(),
    this.utilityBillId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UtilityBillAllocationsCompanion.insert({
    required String id,
    required String utilityBillId,
    required String memberId,
    required int amountMinor,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       utilityBillId = Value(utilityBillId),
       memberId = Value(memberId),
       amountMinor = Value(amountMinor);
  static Insertable<UtilityBillAllocation> custom({
    Expression<String>? id,
    Expression<String>? utilityBillId,
    Expression<String>? memberId,
    Expression<int>? amountMinor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (utilityBillId != null) 'utility_bill_id': utilityBillId,
      if (memberId != null) 'member_id': memberId,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UtilityBillAllocationsCompanion copyWith({
    Value<String>? id,
    Value<String>? utilityBillId,
    Value<String>? memberId,
    Value<int>? amountMinor,
    Value<int>? rowid,
  }) {
    return UtilityBillAllocationsCompanion(
      id: id ?? this.id,
      utilityBillId: utilityBillId ?? this.utilityBillId,
      memberId: memberId ?? this.memberId,
      amountMinor: amountMinor ?? this.amountMinor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (utilityBillId.present) {
      map['utility_bill_id'] = Variable<String>(utilityBillId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UtilityBillAllocationsCompanion(')
          ..write('id: $id, ')
          ..write('utilityBillId: $utilityBillId, ')
          ..write('memberId: $memberId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DepositsTable extends Deposits with TableInfo<$DepositsTable, Deposit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DepositsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _accountingMonthIdMeta = const VerificationMeta(
    'accountingMonthId',
  );
  @override
  late final GeneratedColumn<String> accountingMonthId =
      GeneratedColumn<String>(
        'accounting_month_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounting_months (id)',
        ),
      );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
    'member_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    accountingMonthId,
    memberId,
    date,
    amountMinor,
    paymentMethod,
    reference,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deposits';
  @override
  VerificationContext validateIntegrity(
    Insertable<Deposit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('accounting_month_id')) {
      context.handle(
        _accountingMonthIdMeta,
        accountingMonthId.isAcceptableOrUnknown(
          data['accounting_month_id']!,
          _accountingMonthIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountingMonthIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Deposit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Deposit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      accountingMonthId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accounting_month_id'],
      )!,
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}member_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DepositsTable createAlias(String alias) {
    return $DepositsTable(attachedDatabase, alias);
  }
}

class Deposit extends DataClass implements Insertable<Deposit> {
  final String id;
  final String messId;
  final String accountingMonthId;
  final String memberId;
  final DateTime date;
  final int amountMinor;
  final String paymentMethod;
  final String? reference;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Deposit({
    required this.id,
    required this.messId,
    required this.accountingMonthId,
    required this.memberId,
    required this.date,
    required this.amountMinor,
    required this.paymentMethod,
    this.reference,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['accounting_month_id'] = Variable<String>(accountingMonthId);
    map['member_id'] = Variable<String>(memberId);
    map['date'] = Variable<DateTime>(date);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['payment_method'] = Variable<String>(paymentMethod);
    if (!nullToAbsent || reference != null) {
      map['reference'] = Variable<String>(reference);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DepositsCompanion toCompanion(bool nullToAbsent) {
    return DepositsCompanion(
      id: Value(id),
      messId: Value(messId),
      accountingMonthId: Value(accountingMonthId),
      memberId: Value(memberId),
      date: Value(date),
      amountMinor: Value(amountMinor),
      paymentMethod: Value(paymentMethod),
      reference: reference == null && nullToAbsent
          ? const Value.absent()
          : Value(reference),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Deposit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Deposit(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      accountingMonthId: serializer.fromJson<String>(json['accountingMonthId']),
      memberId: serializer.fromJson<String>(json['memberId']),
      date: serializer.fromJson<DateTime>(json['date']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      reference: serializer.fromJson<String?>(json['reference']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'accountingMonthId': serializer.toJson<String>(accountingMonthId),
      'memberId': serializer.toJson<String>(memberId),
      'date': serializer.toJson<DateTime>(date),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'reference': serializer.toJson<String?>(reference),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Deposit copyWith({
    String? id,
    String? messId,
    String? accountingMonthId,
    String? memberId,
    DateTime? date,
    int? amountMinor,
    String? paymentMethod,
    Value<String?> reference = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Deposit(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    accountingMonthId: accountingMonthId ?? this.accountingMonthId,
    memberId: memberId ?? this.memberId,
    date: date ?? this.date,
    amountMinor: amountMinor ?? this.amountMinor,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    reference: reference.present ? reference.value : this.reference,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Deposit copyWithCompanion(DepositsCompanion data) {
    return Deposit(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      accountingMonthId: data.accountingMonthId.present
          ? data.accountingMonthId.value
          : this.accountingMonthId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      date: data.date.present ? data.date.value : this.date,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      reference: data.reference.present ? data.reference.value : this.reference,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Deposit(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('memberId: $memberId, ')
          ..write('date: $date, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    accountingMonthId,
    memberId,
    date,
    amountMinor,
    paymentMethod,
    reference,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Deposit &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.accountingMonthId == this.accountingMonthId &&
          other.memberId == this.memberId &&
          other.date == this.date &&
          other.amountMinor == this.amountMinor &&
          other.paymentMethod == this.paymentMethod &&
          other.reference == this.reference &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DepositsCompanion extends UpdateCompanion<Deposit> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> accountingMonthId;
  final Value<String> memberId;
  final Value<DateTime> date;
  final Value<int> amountMinor;
  final Value<String> paymentMethod;
  final Value<String?> reference;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DepositsCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.accountingMonthId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.date = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DepositsCompanion.insert({
    required String id,
    required String messId,
    required String accountingMonthId,
    required String memberId,
    required DateTime date,
    required int amountMinor,
    required String paymentMethod,
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       accountingMonthId = Value(accountingMonthId),
       memberId = Value(memberId),
       date = Value(date),
       amountMinor = Value(amountMinor),
       paymentMethod = Value(paymentMethod);
  static Insertable<Deposit> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? accountingMonthId,
    Expression<String>? memberId,
    Expression<DateTime>? date,
    Expression<int>? amountMinor,
    Expression<String>? paymentMethod,
    Expression<String>? reference,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (accountingMonthId != null) 'accounting_month_id': accountingMonthId,
      if (memberId != null) 'member_id': memberId,
      if (date != null) 'date': date,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (reference != null) 'reference': reference,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DepositsCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? accountingMonthId,
    Value<String>? memberId,
    Value<DateTime>? date,
    Value<int>? amountMinor,
    Value<String>? paymentMethod,
    Value<String?>? reference,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return DepositsCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      accountingMonthId: accountingMonthId ?? this.accountingMonthId,
      memberId: memberId ?? this.memberId,
      date: date ?? this.date,
      amountMinor: amountMinor ?? this.amountMinor,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      reference: reference ?? this.reference,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (accountingMonthId.present) {
      map['accounting_month_id'] = Variable<String>(accountingMonthId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepositsCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('memberId: $memberId, ')
          ..write('date: $date, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemberAdjustmentsTable extends MemberAdjustments
    with TableInfo<$MemberAdjustmentsTable, MemberAdjustment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemberAdjustmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _accountingMonthIdMeta = const VerificationMeta(
    'accountingMonthId',
  );
  @override
  late final GeneratedColumn<String> accountingMonthId =
      GeneratedColumn<String>(
        'accounting_month_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounting_months (id)',
        ),
      );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
    'member_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _directionMeta = const VerificationMeta(
    'direction',
  );
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    accountingMonthId,
    memberId,
    date,
    type,
    direction,
    amountMinor,
    reason,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'member_adjustments';
  @override
  VerificationContext validateIntegrity(
    Insertable<MemberAdjustment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('accounting_month_id')) {
      context.handle(
        _accountingMonthIdMeta,
        accountingMonthId.isAcceptableOrUnknown(
          data['accounting_month_id']!,
          _accountingMonthIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountingMonthIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(
        _directionMeta,
        direction.isAcceptableOrUnknown(data['direction']!, _directionMeta),
      );
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemberAdjustment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemberAdjustment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      accountingMonthId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accounting_month_id'],
      )!,
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}member_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      direction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direction'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MemberAdjustmentsTable createAlias(String alias) {
    return $MemberAdjustmentsTable(attachedDatabase, alias);
  }
}

class MemberAdjustment extends DataClass
    implements Insertable<MemberAdjustment> {
  final String id;
  final String messId;
  final String accountingMonthId;
  final String memberId;
  final DateTime date;
  final String type;
  final String direction;
  final int amountMinor;
  final String reason;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const MemberAdjustment({
    required this.id,
    required this.messId,
    required this.accountingMonthId,
    required this.memberId,
    required this.date,
    required this.type,
    required this.direction,
    required this.amountMinor,
    required this.reason,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['accounting_month_id'] = Variable<String>(accountingMonthId);
    map['member_id'] = Variable<String>(memberId);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    map['direction'] = Variable<String>(direction);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['reason'] = Variable<String>(reason);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MemberAdjustmentsCompanion toCompanion(bool nullToAbsent) {
    return MemberAdjustmentsCompanion(
      id: Value(id),
      messId: Value(messId),
      accountingMonthId: Value(accountingMonthId),
      memberId: Value(memberId),
      date: Value(date),
      type: Value(type),
      direction: Value(direction),
      amountMinor: Value(amountMinor),
      reason: Value(reason),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory MemberAdjustment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemberAdjustment(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      accountingMonthId: serializer.fromJson<String>(json['accountingMonthId']),
      memberId: serializer.fromJson<String>(json['memberId']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
      direction: serializer.fromJson<String>(json['direction']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      reason: serializer.fromJson<String>(json['reason']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'accountingMonthId': serializer.toJson<String>(accountingMonthId),
      'memberId': serializer.toJson<String>(memberId),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
      'direction': serializer.toJson<String>(direction),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'reason': serializer.toJson<String>(reason),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MemberAdjustment copyWith({
    String? id,
    String? messId,
    String? accountingMonthId,
    String? memberId,
    DateTime? date,
    String? type,
    String? direction,
    int? amountMinor,
    String? reason,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => MemberAdjustment(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    accountingMonthId: accountingMonthId ?? this.accountingMonthId,
    memberId: memberId ?? this.memberId,
    date: date ?? this.date,
    type: type ?? this.type,
    direction: direction ?? this.direction,
    amountMinor: amountMinor ?? this.amountMinor,
    reason: reason ?? this.reason,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  MemberAdjustment copyWithCompanion(MemberAdjustmentsCompanion data) {
    return MemberAdjustment(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      accountingMonthId: data.accountingMonthId.present
          ? data.accountingMonthId.value
          : this.accountingMonthId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
      direction: data.direction.present ? data.direction.value : this.direction,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      reason: data.reason.present ? data.reason.value : this.reason,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemberAdjustment(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('memberId: $memberId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('direction: $direction, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('reason: $reason, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    accountingMonthId,
    memberId,
    date,
    type,
    direction,
    amountMinor,
    reason,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemberAdjustment &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.accountingMonthId == this.accountingMonthId &&
          other.memberId == this.memberId &&
          other.date == this.date &&
          other.type == this.type &&
          other.direction == this.direction &&
          other.amountMinor == this.amountMinor &&
          other.reason == this.reason &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MemberAdjustmentsCompanion extends UpdateCompanion<MemberAdjustment> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> accountingMonthId;
  final Value<String> memberId;
  final Value<DateTime> date;
  final Value<String> type;
  final Value<String> direction;
  final Value<int> amountMinor;
  final Value<String> reason;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MemberAdjustmentsCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.accountingMonthId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.direction = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.reason = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemberAdjustmentsCompanion.insert({
    required String id,
    required String messId,
    required String accountingMonthId,
    required String memberId,
    required DateTime date,
    required String type,
    required String direction,
    required int amountMinor,
    required String reason,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       accountingMonthId = Value(accountingMonthId),
       memberId = Value(memberId),
       date = Value(date),
       type = Value(type),
       direction = Value(direction),
       amountMinor = Value(amountMinor),
       reason = Value(reason);
  static Insertable<MemberAdjustment> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? accountingMonthId,
    Expression<String>? memberId,
    Expression<DateTime>? date,
    Expression<String>? type,
    Expression<String>? direction,
    Expression<int>? amountMinor,
    Expression<String>? reason,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (accountingMonthId != null) 'accounting_month_id': accountingMonthId,
      if (memberId != null) 'member_id': memberId,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (direction != null) 'direction': direction,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (reason != null) 'reason': reason,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemberAdjustmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? accountingMonthId,
    Value<String>? memberId,
    Value<DateTime>? date,
    Value<String>? type,
    Value<String>? direction,
    Value<int>? amountMinor,
    Value<String>? reason,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MemberAdjustmentsCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      accountingMonthId: accountingMonthId ?? this.accountingMonthId,
      memberId: memberId ?? this.memberId,
      date: date ?? this.date,
      type: type ?? this.type,
      direction: direction ?? this.direction,
      amountMinor: amountMinor ?? this.amountMinor,
      reason: reason ?? this.reason,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (accountingMonthId.present) {
      map['accounting_month_id'] = Variable<String>(accountingMonthId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemberAdjustmentsCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('memberId: $memberId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('direction: $direction, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('reason: $reason, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettlementsTable extends Settlements
    with TableInfo<$SettlementsTable, Settlement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettlementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _accountingMonthIdMeta = const VerificationMeta(
    'accountingMonthId',
  );
  @override
  late final GeneratedColumn<String> accountingMonthId =
      GeneratedColumn<String>(
        'accounting_month_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounting_months (id)',
        ),
      );
  static const VerificationMeta _totalMealUnitsMeta = const VerificationMeta(
    'totalMealUnits',
  );
  @override
  late final GeneratedColumn<int> totalMealUnits = GeneratedColumn<int>(
    'total_meal_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMealExpenseMinorMeta =
      const VerificationMeta('totalMealExpenseMinor');
  @override
  late final GeneratedColumn<int> totalMealExpenseMinor = GeneratedColumn<int>(
    'total_meal_expense_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealRateScaledMeta = const VerificationMeta(
    'mealRateScaled',
  );
  @override
  late final GeneratedColumn<int> mealRateScaled = GeneratedColumn<int>(
    'meal_rate_scaled',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalSharedExpenseMinorMeta =
      const VerificationMeta('totalSharedExpenseMinor');
  @override
  late final GeneratedColumn<int> totalSharedExpenseMinor =
      GeneratedColumn<int>(
        'total_shared_expense_minor',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _totalDepositMinorMeta = const VerificationMeta(
    'totalDepositMinor',
  );
  @override
  late final GeneratedColumn<int> totalDepositMinor = GeneratedColumn<int>(
    'total_deposit_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _closedAtMeta = const VerificationMeta(
    'closedAt',
  );
  @override
  late final GeneratedColumn<DateTime> closedAt = GeneratedColumn<DateTime>(
    'closed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    accountingMonthId,
    totalMealUnits,
    totalMealExpenseMinor,
    mealRateScaled,
    totalSharedExpenseMinor,
    totalDepositMinor,
    createdAt,
    closedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settlements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Settlement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('accounting_month_id')) {
      context.handle(
        _accountingMonthIdMeta,
        accountingMonthId.isAcceptableOrUnknown(
          data['accounting_month_id']!,
          _accountingMonthIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountingMonthIdMeta);
    }
    if (data.containsKey('total_meal_units')) {
      context.handle(
        _totalMealUnitsMeta,
        totalMealUnits.isAcceptableOrUnknown(
          data['total_meal_units']!,
          _totalMealUnitsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalMealUnitsMeta);
    }
    if (data.containsKey('total_meal_expense_minor')) {
      context.handle(
        _totalMealExpenseMinorMeta,
        totalMealExpenseMinor.isAcceptableOrUnknown(
          data['total_meal_expense_minor']!,
          _totalMealExpenseMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalMealExpenseMinorMeta);
    }
    if (data.containsKey('meal_rate_scaled')) {
      context.handle(
        _mealRateScaledMeta,
        mealRateScaled.isAcceptableOrUnknown(
          data['meal_rate_scaled']!,
          _mealRateScaledMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mealRateScaledMeta);
    }
    if (data.containsKey('total_shared_expense_minor')) {
      context.handle(
        _totalSharedExpenseMinorMeta,
        totalSharedExpenseMinor.isAcceptableOrUnknown(
          data['total_shared_expense_minor']!,
          _totalSharedExpenseMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalSharedExpenseMinorMeta);
    }
    if (data.containsKey('total_deposit_minor')) {
      context.handle(
        _totalDepositMinorMeta,
        totalDepositMinor.isAcceptableOrUnknown(
          data['total_deposit_minor']!,
          _totalDepositMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalDepositMinorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('closed_at')) {
      context.handle(
        _closedAtMeta,
        closedAt.isAcceptableOrUnknown(data['closed_at']!, _closedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Settlement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Settlement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      accountingMonthId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accounting_month_id'],
      )!,
      totalMealUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_meal_units'],
      )!,
      totalMealExpenseMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_meal_expense_minor'],
      )!,
      mealRateScaled: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meal_rate_scaled'],
      )!,
      totalSharedExpenseMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_shared_expense_minor'],
      )!,
      totalDepositMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_deposit_minor'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      closedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}closed_at'],
      ),
    );
  }

  @override
  $SettlementsTable createAlias(String alias) {
    return $SettlementsTable(attachedDatabase, alias);
  }
}

class Settlement extends DataClass implements Insertable<Settlement> {
  final String id;
  final String messId;
  final String accountingMonthId;
  final int totalMealUnits;
  final int totalMealExpenseMinor;
  final int mealRateScaled;
  final int totalSharedExpenseMinor;
  final int totalDepositMinor;
  final DateTime createdAt;
  final DateTime? closedAt;
  const Settlement({
    required this.id,
    required this.messId,
    required this.accountingMonthId,
    required this.totalMealUnits,
    required this.totalMealExpenseMinor,
    required this.mealRateScaled,
    required this.totalSharedExpenseMinor,
    required this.totalDepositMinor,
    required this.createdAt,
    this.closedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['accounting_month_id'] = Variable<String>(accountingMonthId);
    map['total_meal_units'] = Variable<int>(totalMealUnits);
    map['total_meal_expense_minor'] = Variable<int>(totalMealExpenseMinor);
    map['meal_rate_scaled'] = Variable<int>(mealRateScaled);
    map['total_shared_expense_minor'] = Variable<int>(totalSharedExpenseMinor);
    map['total_deposit_minor'] = Variable<int>(totalDepositMinor);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || closedAt != null) {
      map['closed_at'] = Variable<DateTime>(closedAt);
    }
    return map;
  }

  SettlementsCompanion toCompanion(bool nullToAbsent) {
    return SettlementsCompanion(
      id: Value(id),
      messId: Value(messId),
      accountingMonthId: Value(accountingMonthId),
      totalMealUnits: Value(totalMealUnits),
      totalMealExpenseMinor: Value(totalMealExpenseMinor),
      mealRateScaled: Value(mealRateScaled),
      totalSharedExpenseMinor: Value(totalSharedExpenseMinor),
      totalDepositMinor: Value(totalDepositMinor),
      createdAt: Value(createdAt),
      closedAt: closedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(closedAt),
    );
  }

  factory Settlement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Settlement(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      accountingMonthId: serializer.fromJson<String>(json['accountingMonthId']),
      totalMealUnits: serializer.fromJson<int>(json['totalMealUnits']),
      totalMealExpenseMinor: serializer.fromJson<int>(
        json['totalMealExpenseMinor'],
      ),
      mealRateScaled: serializer.fromJson<int>(json['mealRateScaled']),
      totalSharedExpenseMinor: serializer.fromJson<int>(
        json['totalSharedExpenseMinor'],
      ),
      totalDepositMinor: serializer.fromJson<int>(json['totalDepositMinor']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      closedAt: serializer.fromJson<DateTime?>(json['closedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'accountingMonthId': serializer.toJson<String>(accountingMonthId),
      'totalMealUnits': serializer.toJson<int>(totalMealUnits),
      'totalMealExpenseMinor': serializer.toJson<int>(totalMealExpenseMinor),
      'mealRateScaled': serializer.toJson<int>(mealRateScaled),
      'totalSharedExpenseMinor': serializer.toJson<int>(
        totalSharedExpenseMinor,
      ),
      'totalDepositMinor': serializer.toJson<int>(totalDepositMinor),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'closedAt': serializer.toJson<DateTime?>(closedAt),
    };
  }

  Settlement copyWith({
    String? id,
    String? messId,
    String? accountingMonthId,
    int? totalMealUnits,
    int? totalMealExpenseMinor,
    int? mealRateScaled,
    int? totalSharedExpenseMinor,
    int? totalDepositMinor,
    DateTime? createdAt,
    Value<DateTime?> closedAt = const Value.absent(),
  }) => Settlement(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    accountingMonthId: accountingMonthId ?? this.accountingMonthId,
    totalMealUnits: totalMealUnits ?? this.totalMealUnits,
    totalMealExpenseMinor: totalMealExpenseMinor ?? this.totalMealExpenseMinor,
    mealRateScaled: mealRateScaled ?? this.mealRateScaled,
    totalSharedExpenseMinor:
        totalSharedExpenseMinor ?? this.totalSharedExpenseMinor,
    totalDepositMinor: totalDepositMinor ?? this.totalDepositMinor,
    createdAt: createdAt ?? this.createdAt,
    closedAt: closedAt.present ? closedAt.value : this.closedAt,
  );
  Settlement copyWithCompanion(SettlementsCompanion data) {
    return Settlement(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      accountingMonthId: data.accountingMonthId.present
          ? data.accountingMonthId.value
          : this.accountingMonthId,
      totalMealUnits: data.totalMealUnits.present
          ? data.totalMealUnits.value
          : this.totalMealUnits,
      totalMealExpenseMinor: data.totalMealExpenseMinor.present
          ? data.totalMealExpenseMinor.value
          : this.totalMealExpenseMinor,
      mealRateScaled: data.mealRateScaled.present
          ? data.mealRateScaled.value
          : this.mealRateScaled,
      totalSharedExpenseMinor: data.totalSharedExpenseMinor.present
          ? data.totalSharedExpenseMinor.value
          : this.totalSharedExpenseMinor,
      totalDepositMinor: data.totalDepositMinor.present
          ? data.totalDepositMinor.value
          : this.totalDepositMinor,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      closedAt: data.closedAt.present ? data.closedAt.value : this.closedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Settlement(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('totalMealUnits: $totalMealUnits, ')
          ..write('totalMealExpenseMinor: $totalMealExpenseMinor, ')
          ..write('mealRateScaled: $mealRateScaled, ')
          ..write('totalSharedExpenseMinor: $totalSharedExpenseMinor, ')
          ..write('totalDepositMinor: $totalDepositMinor, ')
          ..write('createdAt: $createdAt, ')
          ..write('closedAt: $closedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    accountingMonthId,
    totalMealUnits,
    totalMealExpenseMinor,
    mealRateScaled,
    totalSharedExpenseMinor,
    totalDepositMinor,
    createdAt,
    closedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Settlement &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.accountingMonthId == this.accountingMonthId &&
          other.totalMealUnits == this.totalMealUnits &&
          other.totalMealExpenseMinor == this.totalMealExpenseMinor &&
          other.mealRateScaled == this.mealRateScaled &&
          other.totalSharedExpenseMinor == this.totalSharedExpenseMinor &&
          other.totalDepositMinor == this.totalDepositMinor &&
          other.createdAt == this.createdAt &&
          other.closedAt == this.closedAt);
}

class SettlementsCompanion extends UpdateCompanion<Settlement> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> accountingMonthId;
  final Value<int> totalMealUnits;
  final Value<int> totalMealExpenseMinor;
  final Value<int> mealRateScaled;
  final Value<int> totalSharedExpenseMinor;
  final Value<int> totalDepositMinor;
  final Value<DateTime> createdAt;
  final Value<DateTime?> closedAt;
  final Value<int> rowid;
  const SettlementsCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.accountingMonthId = const Value.absent(),
    this.totalMealUnits = const Value.absent(),
    this.totalMealExpenseMinor = const Value.absent(),
    this.mealRateScaled = const Value.absent(),
    this.totalSharedExpenseMinor = const Value.absent(),
    this.totalDepositMinor = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.closedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettlementsCompanion.insert({
    required String id,
    required String messId,
    required String accountingMonthId,
    required int totalMealUnits,
    required int totalMealExpenseMinor,
    required int mealRateScaled,
    required int totalSharedExpenseMinor,
    required int totalDepositMinor,
    this.createdAt = const Value.absent(),
    this.closedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       accountingMonthId = Value(accountingMonthId),
       totalMealUnits = Value(totalMealUnits),
       totalMealExpenseMinor = Value(totalMealExpenseMinor),
       mealRateScaled = Value(mealRateScaled),
       totalSharedExpenseMinor = Value(totalSharedExpenseMinor),
       totalDepositMinor = Value(totalDepositMinor);
  static Insertable<Settlement> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? accountingMonthId,
    Expression<int>? totalMealUnits,
    Expression<int>? totalMealExpenseMinor,
    Expression<int>? mealRateScaled,
    Expression<int>? totalSharedExpenseMinor,
    Expression<int>? totalDepositMinor,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? closedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (accountingMonthId != null) 'accounting_month_id': accountingMonthId,
      if (totalMealUnits != null) 'total_meal_units': totalMealUnits,
      if (totalMealExpenseMinor != null)
        'total_meal_expense_minor': totalMealExpenseMinor,
      if (mealRateScaled != null) 'meal_rate_scaled': mealRateScaled,
      if (totalSharedExpenseMinor != null)
        'total_shared_expense_minor': totalSharedExpenseMinor,
      if (totalDepositMinor != null) 'total_deposit_minor': totalDepositMinor,
      if (createdAt != null) 'created_at': createdAt,
      if (closedAt != null) 'closed_at': closedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettlementsCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? accountingMonthId,
    Value<int>? totalMealUnits,
    Value<int>? totalMealExpenseMinor,
    Value<int>? mealRateScaled,
    Value<int>? totalSharedExpenseMinor,
    Value<int>? totalDepositMinor,
    Value<DateTime>? createdAt,
    Value<DateTime?>? closedAt,
    Value<int>? rowid,
  }) {
    return SettlementsCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      accountingMonthId: accountingMonthId ?? this.accountingMonthId,
      totalMealUnits: totalMealUnits ?? this.totalMealUnits,
      totalMealExpenseMinor:
          totalMealExpenseMinor ?? this.totalMealExpenseMinor,
      mealRateScaled: mealRateScaled ?? this.mealRateScaled,
      totalSharedExpenseMinor:
          totalSharedExpenseMinor ?? this.totalSharedExpenseMinor,
      totalDepositMinor: totalDepositMinor ?? this.totalDepositMinor,
      createdAt: createdAt ?? this.createdAt,
      closedAt: closedAt ?? this.closedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (accountingMonthId.present) {
      map['accounting_month_id'] = Variable<String>(accountingMonthId.value);
    }
    if (totalMealUnits.present) {
      map['total_meal_units'] = Variable<int>(totalMealUnits.value);
    }
    if (totalMealExpenseMinor.present) {
      map['total_meal_expense_minor'] = Variable<int>(
        totalMealExpenseMinor.value,
      );
    }
    if (mealRateScaled.present) {
      map['meal_rate_scaled'] = Variable<int>(mealRateScaled.value);
    }
    if (totalSharedExpenseMinor.present) {
      map['total_shared_expense_minor'] = Variable<int>(
        totalSharedExpenseMinor.value,
      );
    }
    if (totalDepositMinor.present) {
      map['total_deposit_minor'] = Variable<int>(totalDepositMinor.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (closedAt.present) {
      map['closed_at'] = Variable<DateTime>(closedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettlementsCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('accountingMonthId: $accountingMonthId, ')
          ..write('totalMealUnits: $totalMealUnits, ')
          ..write('totalMealExpenseMinor: $totalMealExpenseMinor, ')
          ..write('mealRateScaled: $mealRateScaled, ')
          ..write('totalSharedExpenseMinor: $totalSharedExpenseMinor, ')
          ..write('totalDepositMinor: $totalDepositMinor, ')
          ..write('createdAt: $createdAt, ')
          ..write('closedAt: $closedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemberSettlementsTable extends MemberSettlements
    with TableInfo<$MemberSettlementsTable, MemberSettlement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemberSettlementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _settlementIdMeta = const VerificationMeta(
    'settlementId',
  );
  @override
  late final GeneratedColumn<String> settlementId = GeneratedColumn<String>(
    'settlement_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES settlements (id)',
    ),
  );
  static const VerificationMeta _memberIdMeta = const VerificationMeta(
    'memberId',
  );
  @override
  late final GeneratedColumn<String> memberId = GeneratedColumn<String>(
    'member_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES members (id)',
    ),
  );
  static const VerificationMeta _mealUnitsMeta = const VerificationMeta(
    'mealUnits',
  );
  @override
  late final GeneratedColumn<int> mealUnits = GeneratedColumn<int>(
    'meal_units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _mealCostMinorMeta = const VerificationMeta(
    'mealCostMinor',
  );
  @override
  late final GeneratedColumn<int> mealCostMinor = GeneratedColumn<int>(
    'meal_cost_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _guestChargeMinorMeta = const VerificationMeta(
    'guestChargeMinor',
  );
  @override
  late final GeneratedColumn<int> guestChargeMinor = GeneratedColumn<int>(
    'guest_charge_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _specialMealChargeMinorMeta =
      const VerificationMeta('specialMealChargeMinor');
  @override
  late final GeneratedColumn<int> specialMealChargeMinor = GeneratedColumn<int>(
    'special_meal_charge_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _utilityShareMinorMeta = const VerificationMeta(
    'utilityShareMinor',
  );
  @override
  late final GeneratedColumn<int> utilityShareMinor = GeneratedColumn<int>(
    'utility_share_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sharedExpenseShareMinorMeta =
      const VerificationMeta('sharedExpenseShareMinor');
  @override
  late final GeneratedColumn<int> sharedExpenseShareMinor =
      GeneratedColumn<int>(
        'shared_expense_share_minor',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _adjustmentDebitMinorMeta =
      const VerificationMeta('adjustmentDebitMinor');
  @override
  late final GeneratedColumn<int> adjustmentDebitMinor = GeneratedColumn<int>(
    'adjustment_debit_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _adjustmentCreditMinorMeta =
      const VerificationMeta('adjustmentCreditMinor');
  @override
  late final GeneratedColumn<int> adjustmentCreditMinor = GeneratedColumn<int>(
    'adjustment_credit_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _previousBalanceMinorMeta =
      const VerificationMeta('previousBalanceMinor');
  @override
  late final GeneratedColumn<int> previousBalanceMinor = GeneratedColumn<int>(
    'previous_balance_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _depositMinorMeta = const VerificationMeta(
    'depositMinor',
  );
  @override
  late final GeneratedColumn<int> depositMinor = GeneratedColumn<int>(
    'deposit_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _memberPaidExpenseMinorMeta =
      const VerificationMeta('memberPaidExpenseMinor');
  @override
  late final GeneratedColumn<int> memberPaidExpenseMinor = GeneratedColumn<int>(
    'member_paid_expense_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalPayableMinorMeta = const VerificationMeta(
    'totalPayableMinor',
  );
  @override
  late final GeneratedColumn<int> totalPayableMinor = GeneratedColumn<int>(
    'total_payable_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalCreditMinorMeta = const VerificationMeta(
    'totalCreditMinor',
  );
  @override
  late final GeneratedColumn<int> totalCreditMinor = GeneratedColumn<int>(
    'total_credit_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finalBalanceMinorMeta = const VerificationMeta(
    'finalBalanceMinor',
  );
  @override
  late final GeneratedColumn<int> finalBalanceMinor = GeneratedColumn<int>(
    'final_balance_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    settlementId,
    memberId,
    mealUnits,
    mealCostMinor,
    guestChargeMinor,
    specialMealChargeMinor,
    utilityShareMinor,
    sharedExpenseShareMinor,
    adjustmentDebitMinor,
    adjustmentCreditMinor,
    previousBalanceMinor,
    depositMinor,
    memberPaidExpenseMinor,
    totalPayableMinor,
    totalCreditMinor,
    finalBalanceMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'member_settlements';
  @override
  VerificationContext validateIntegrity(
    Insertable<MemberSettlement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('settlement_id')) {
      context.handle(
        _settlementIdMeta,
        settlementId.isAcceptableOrUnknown(
          data['settlement_id']!,
          _settlementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_settlementIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(
        _memberIdMeta,
        memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta),
      );
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('meal_units')) {
      context.handle(
        _mealUnitsMeta,
        mealUnits.isAcceptableOrUnknown(data['meal_units']!, _mealUnitsMeta),
      );
    }
    if (data.containsKey('meal_cost_minor')) {
      context.handle(
        _mealCostMinorMeta,
        mealCostMinor.isAcceptableOrUnknown(
          data['meal_cost_minor']!,
          _mealCostMinorMeta,
        ),
      );
    }
    if (data.containsKey('guest_charge_minor')) {
      context.handle(
        _guestChargeMinorMeta,
        guestChargeMinor.isAcceptableOrUnknown(
          data['guest_charge_minor']!,
          _guestChargeMinorMeta,
        ),
      );
    }
    if (data.containsKey('special_meal_charge_minor')) {
      context.handle(
        _specialMealChargeMinorMeta,
        specialMealChargeMinor.isAcceptableOrUnknown(
          data['special_meal_charge_minor']!,
          _specialMealChargeMinorMeta,
        ),
      );
    }
    if (data.containsKey('utility_share_minor')) {
      context.handle(
        _utilityShareMinorMeta,
        utilityShareMinor.isAcceptableOrUnknown(
          data['utility_share_minor']!,
          _utilityShareMinorMeta,
        ),
      );
    }
    if (data.containsKey('shared_expense_share_minor')) {
      context.handle(
        _sharedExpenseShareMinorMeta,
        sharedExpenseShareMinor.isAcceptableOrUnknown(
          data['shared_expense_share_minor']!,
          _sharedExpenseShareMinorMeta,
        ),
      );
    }
    if (data.containsKey('adjustment_debit_minor')) {
      context.handle(
        _adjustmentDebitMinorMeta,
        adjustmentDebitMinor.isAcceptableOrUnknown(
          data['adjustment_debit_minor']!,
          _adjustmentDebitMinorMeta,
        ),
      );
    }
    if (data.containsKey('adjustment_credit_minor')) {
      context.handle(
        _adjustmentCreditMinorMeta,
        adjustmentCreditMinor.isAcceptableOrUnknown(
          data['adjustment_credit_minor']!,
          _adjustmentCreditMinorMeta,
        ),
      );
    }
    if (data.containsKey('previous_balance_minor')) {
      context.handle(
        _previousBalanceMinorMeta,
        previousBalanceMinor.isAcceptableOrUnknown(
          data['previous_balance_minor']!,
          _previousBalanceMinorMeta,
        ),
      );
    }
    if (data.containsKey('deposit_minor')) {
      context.handle(
        _depositMinorMeta,
        depositMinor.isAcceptableOrUnknown(
          data['deposit_minor']!,
          _depositMinorMeta,
        ),
      );
    }
    if (data.containsKey('member_paid_expense_minor')) {
      context.handle(
        _memberPaidExpenseMinorMeta,
        memberPaidExpenseMinor.isAcceptableOrUnknown(
          data['member_paid_expense_minor']!,
          _memberPaidExpenseMinorMeta,
        ),
      );
    }
    if (data.containsKey('total_payable_minor')) {
      context.handle(
        _totalPayableMinorMeta,
        totalPayableMinor.isAcceptableOrUnknown(
          data['total_payable_minor']!,
          _totalPayableMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalPayableMinorMeta);
    }
    if (data.containsKey('total_credit_minor')) {
      context.handle(
        _totalCreditMinorMeta,
        totalCreditMinor.isAcceptableOrUnknown(
          data['total_credit_minor']!,
          _totalCreditMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalCreditMinorMeta);
    }
    if (data.containsKey('final_balance_minor')) {
      context.handle(
        _finalBalanceMinorMeta,
        finalBalanceMinor.isAcceptableOrUnknown(
          data['final_balance_minor']!,
          _finalBalanceMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_finalBalanceMinorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemberSettlement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemberSettlement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      settlementId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}settlement_id'],
      )!,
      memberId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}member_id'],
      )!,
      mealUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meal_units'],
      )!,
      mealCostMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meal_cost_minor'],
      )!,
      guestChargeMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guest_charge_minor'],
      )!,
      specialMealChargeMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}special_meal_charge_minor'],
      )!,
      utilityShareMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}utility_share_minor'],
      )!,
      sharedExpenseShareMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shared_expense_share_minor'],
      )!,
      adjustmentDebitMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}adjustment_debit_minor'],
      )!,
      adjustmentCreditMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}adjustment_credit_minor'],
      )!,
      previousBalanceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}previous_balance_minor'],
      )!,
      depositMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}deposit_minor'],
      )!,
      memberPaidExpenseMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}member_paid_expense_minor'],
      )!,
      totalPayableMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_payable_minor'],
      )!,
      totalCreditMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_credit_minor'],
      )!,
      finalBalanceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}final_balance_minor'],
      )!,
    );
  }

  @override
  $MemberSettlementsTable createAlias(String alias) {
    return $MemberSettlementsTable(attachedDatabase, alias);
  }
}

class MemberSettlement extends DataClass
    implements Insertable<MemberSettlement> {
  final String id;
  final String settlementId;
  final String memberId;
  final int mealUnits;
  final int mealCostMinor;
  final int guestChargeMinor;
  final int specialMealChargeMinor;
  final int utilityShareMinor;
  final int sharedExpenseShareMinor;
  final int adjustmentDebitMinor;
  final int adjustmentCreditMinor;
  final int previousBalanceMinor;
  final int depositMinor;
  final int memberPaidExpenseMinor;
  final int totalPayableMinor;
  final int totalCreditMinor;
  final int finalBalanceMinor;
  const MemberSettlement({
    required this.id,
    required this.settlementId,
    required this.memberId,
    required this.mealUnits,
    required this.mealCostMinor,
    required this.guestChargeMinor,
    required this.specialMealChargeMinor,
    required this.utilityShareMinor,
    required this.sharedExpenseShareMinor,
    required this.adjustmentDebitMinor,
    required this.adjustmentCreditMinor,
    required this.previousBalanceMinor,
    required this.depositMinor,
    required this.memberPaidExpenseMinor,
    required this.totalPayableMinor,
    required this.totalCreditMinor,
    required this.finalBalanceMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['settlement_id'] = Variable<String>(settlementId);
    map['member_id'] = Variable<String>(memberId);
    map['meal_units'] = Variable<int>(mealUnits);
    map['meal_cost_minor'] = Variable<int>(mealCostMinor);
    map['guest_charge_minor'] = Variable<int>(guestChargeMinor);
    map['special_meal_charge_minor'] = Variable<int>(specialMealChargeMinor);
    map['utility_share_minor'] = Variable<int>(utilityShareMinor);
    map['shared_expense_share_minor'] = Variable<int>(sharedExpenseShareMinor);
    map['adjustment_debit_minor'] = Variable<int>(adjustmentDebitMinor);
    map['adjustment_credit_minor'] = Variable<int>(adjustmentCreditMinor);
    map['previous_balance_minor'] = Variable<int>(previousBalanceMinor);
    map['deposit_minor'] = Variable<int>(depositMinor);
    map['member_paid_expense_minor'] = Variable<int>(memberPaidExpenseMinor);
    map['total_payable_minor'] = Variable<int>(totalPayableMinor);
    map['total_credit_minor'] = Variable<int>(totalCreditMinor);
    map['final_balance_minor'] = Variable<int>(finalBalanceMinor);
    return map;
  }

  MemberSettlementsCompanion toCompanion(bool nullToAbsent) {
    return MemberSettlementsCompanion(
      id: Value(id),
      settlementId: Value(settlementId),
      memberId: Value(memberId),
      mealUnits: Value(mealUnits),
      mealCostMinor: Value(mealCostMinor),
      guestChargeMinor: Value(guestChargeMinor),
      specialMealChargeMinor: Value(specialMealChargeMinor),
      utilityShareMinor: Value(utilityShareMinor),
      sharedExpenseShareMinor: Value(sharedExpenseShareMinor),
      adjustmentDebitMinor: Value(adjustmentDebitMinor),
      adjustmentCreditMinor: Value(adjustmentCreditMinor),
      previousBalanceMinor: Value(previousBalanceMinor),
      depositMinor: Value(depositMinor),
      memberPaidExpenseMinor: Value(memberPaidExpenseMinor),
      totalPayableMinor: Value(totalPayableMinor),
      totalCreditMinor: Value(totalCreditMinor),
      finalBalanceMinor: Value(finalBalanceMinor),
    );
  }

  factory MemberSettlement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemberSettlement(
      id: serializer.fromJson<String>(json['id']),
      settlementId: serializer.fromJson<String>(json['settlementId']),
      memberId: serializer.fromJson<String>(json['memberId']),
      mealUnits: serializer.fromJson<int>(json['mealUnits']),
      mealCostMinor: serializer.fromJson<int>(json['mealCostMinor']),
      guestChargeMinor: serializer.fromJson<int>(json['guestChargeMinor']),
      specialMealChargeMinor: serializer.fromJson<int>(
        json['specialMealChargeMinor'],
      ),
      utilityShareMinor: serializer.fromJson<int>(json['utilityShareMinor']),
      sharedExpenseShareMinor: serializer.fromJson<int>(
        json['sharedExpenseShareMinor'],
      ),
      adjustmentDebitMinor: serializer.fromJson<int>(
        json['adjustmentDebitMinor'],
      ),
      adjustmentCreditMinor: serializer.fromJson<int>(
        json['adjustmentCreditMinor'],
      ),
      previousBalanceMinor: serializer.fromJson<int>(
        json['previousBalanceMinor'],
      ),
      depositMinor: serializer.fromJson<int>(json['depositMinor']),
      memberPaidExpenseMinor: serializer.fromJson<int>(
        json['memberPaidExpenseMinor'],
      ),
      totalPayableMinor: serializer.fromJson<int>(json['totalPayableMinor']),
      totalCreditMinor: serializer.fromJson<int>(json['totalCreditMinor']),
      finalBalanceMinor: serializer.fromJson<int>(json['finalBalanceMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'settlementId': serializer.toJson<String>(settlementId),
      'memberId': serializer.toJson<String>(memberId),
      'mealUnits': serializer.toJson<int>(mealUnits),
      'mealCostMinor': serializer.toJson<int>(mealCostMinor),
      'guestChargeMinor': serializer.toJson<int>(guestChargeMinor),
      'specialMealChargeMinor': serializer.toJson<int>(specialMealChargeMinor),
      'utilityShareMinor': serializer.toJson<int>(utilityShareMinor),
      'sharedExpenseShareMinor': serializer.toJson<int>(
        sharedExpenseShareMinor,
      ),
      'adjustmentDebitMinor': serializer.toJson<int>(adjustmentDebitMinor),
      'adjustmentCreditMinor': serializer.toJson<int>(adjustmentCreditMinor),
      'previousBalanceMinor': serializer.toJson<int>(previousBalanceMinor),
      'depositMinor': serializer.toJson<int>(depositMinor),
      'memberPaidExpenseMinor': serializer.toJson<int>(memberPaidExpenseMinor),
      'totalPayableMinor': serializer.toJson<int>(totalPayableMinor),
      'totalCreditMinor': serializer.toJson<int>(totalCreditMinor),
      'finalBalanceMinor': serializer.toJson<int>(finalBalanceMinor),
    };
  }

  MemberSettlement copyWith({
    String? id,
    String? settlementId,
    String? memberId,
    int? mealUnits,
    int? mealCostMinor,
    int? guestChargeMinor,
    int? specialMealChargeMinor,
    int? utilityShareMinor,
    int? sharedExpenseShareMinor,
    int? adjustmentDebitMinor,
    int? adjustmentCreditMinor,
    int? previousBalanceMinor,
    int? depositMinor,
    int? memberPaidExpenseMinor,
    int? totalPayableMinor,
    int? totalCreditMinor,
    int? finalBalanceMinor,
  }) => MemberSettlement(
    id: id ?? this.id,
    settlementId: settlementId ?? this.settlementId,
    memberId: memberId ?? this.memberId,
    mealUnits: mealUnits ?? this.mealUnits,
    mealCostMinor: mealCostMinor ?? this.mealCostMinor,
    guestChargeMinor: guestChargeMinor ?? this.guestChargeMinor,
    specialMealChargeMinor:
        specialMealChargeMinor ?? this.specialMealChargeMinor,
    utilityShareMinor: utilityShareMinor ?? this.utilityShareMinor,
    sharedExpenseShareMinor:
        sharedExpenseShareMinor ?? this.sharedExpenseShareMinor,
    adjustmentDebitMinor: adjustmentDebitMinor ?? this.adjustmentDebitMinor,
    adjustmentCreditMinor: adjustmentCreditMinor ?? this.adjustmentCreditMinor,
    previousBalanceMinor: previousBalanceMinor ?? this.previousBalanceMinor,
    depositMinor: depositMinor ?? this.depositMinor,
    memberPaidExpenseMinor:
        memberPaidExpenseMinor ?? this.memberPaidExpenseMinor,
    totalPayableMinor: totalPayableMinor ?? this.totalPayableMinor,
    totalCreditMinor: totalCreditMinor ?? this.totalCreditMinor,
    finalBalanceMinor: finalBalanceMinor ?? this.finalBalanceMinor,
  );
  MemberSettlement copyWithCompanion(MemberSettlementsCompanion data) {
    return MemberSettlement(
      id: data.id.present ? data.id.value : this.id,
      settlementId: data.settlementId.present
          ? data.settlementId.value
          : this.settlementId,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      mealUnits: data.mealUnits.present ? data.mealUnits.value : this.mealUnits,
      mealCostMinor: data.mealCostMinor.present
          ? data.mealCostMinor.value
          : this.mealCostMinor,
      guestChargeMinor: data.guestChargeMinor.present
          ? data.guestChargeMinor.value
          : this.guestChargeMinor,
      specialMealChargeMinor: data.specialMealChargeMinor.present
          ? data.specialMealChargeMinor.value
          : this.specialMealChargeMinor,
      utilityShareMinor: data.utilityShareMinor.present
          ? data.utilityShareMinor.value
          : this.utilityShareMinor,
      sharedExpenseShareMinor: data.sharedExpenseShareMinor.present
          ? data.sharedExpenseShareMinor.value
          : this.sharedExpenseShareMinor,
      adjustmentDebitMinor: data.adjustmentDebitMinor.present
          ? data.adjustmentDebitMinor.value
          : this.adjustmentDebitMinor,
      adjustmentCreditMinor: data.adjustmentCreditMinor.present
          ? data.adjustmentCreditMinor.value
          : this.adjustmentCreditMinor,
      previousBalanceMinor: data.previousBalanceMinor.present
          ? data.previousBalanceMinor.value
          : this.previousBalanceMinor,
      depositMinor: data.depositMinor.present
          ? data.depositMinor.value
          : this.depositMinor,
      memberPaidExpenseMinor: data.memberPaidExpenseMinor.present
          ? data.memberPaidExpenseMinor.value
          : this.memberPaidExpenseMinor,
      totalPayableMinor: data.totalPayableMinor.present
          ? data.totalPayableMinor.value
          : this.totalPayableMinor,
      totalCreditMinor: data.totalCreditMinor.present
          ? data.totalCreditMinor.value
          : this.totalCreditMinor,
      finalBalanceMinor: data.finalBalanceMinor.present
          ? data.finalBalanceMinor.value
          : this.finalBalanceMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemberSettlement(')
          ..write('id: $id, ')
          ..write('settlementId: $settlementId, ')
          ..write('memberId: $memberId, ')
          ..write('mealUnits: $mealUnits, ')
          ..write('mealCostMinor: $mealCostMinor, ')
          ..write('guestChargeMinor: $guestChargeMinor, ')
          ..write('specialMealChargeMinor: $specialMealChargeMinor, ')
          ..write('utilityShareMinor: $utilityShareMinor, ')
          ..write('sharedExpenseShareMinor: $sharedExpenseShareMinor, ')
          ..write('adjustmentDebitMinor: $adjustmentDebitMinor, ')
          ..write('adjustmentCreditMinor: $adjustmentCreditMinor, ')
          ..write('previousBalanceMinor: $previousBalanceMinor, ')
          ..write('depositMinor: $depositMinor, ')
          ..write('memberPaidExpenseMinor: $memberPaidExpenseMinor, ')
          ..write('totalPayableMinor: $totalPayableMinor, ')
          ..write('totalCreditMinor: $totalCreditMinor, ')
          ..write('finalBalanceMinor: $finalBalanceMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    settlementId,
    memberId,
    mealUnits,
    mealCostMinor,
    guestChargeMinor,
    specialMealChargeMinor,
    utilityShareMinor,
    sharedExpenseShareMinor,
    adjustmentDebitMinor,
    adjustmentCreditMinor,
    previousBalanceMinor,
    depositMinor,
    memberPaidExpenseMinor,
    totalPayableMinor,
    totalCreditMinor,
    finalBalanceMinor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemberSettlement &&
          other.id == this.id &&
          other.settlementId == this.settlementId &&
          other.memberId == this.memberId &&
          other.mealUnits == this.mealUnits &&
          other.mealCostMinor == this.mealCostMinor &&
          other.guestChargeMinor == this.guestChargeMinor &&
          other.specialMealChargeMinor == this.specialMealChargeMinor &&
          other.utilityShareMinor == this.utilityShareMinor &&
          other.sharedExpenseShareMinor == this.sharedExpenseShareMinor &&
          other.adjustmentDebitMinor == this.adjustmentDebitMinor &&
          other.adjustmentCreditMinor == this.adjustmentCreditMinor &&
          other.previousBalanceMinor == this.previousBalanceMinor &&
          other.depositMinor == this.depositMinor &&
          other.memberPaidExpenseMinor == this.memberPaidExpenseMinor &&
          other.totalPayableMinor == this.totalPayableMinor &&
          other.totalCreditMinor == this.totalCreditMinor &&
          other.finalBalanceMinor == this.finalBalanceMinor);
}

class MemberSettlementsCompanion extends UpdateCompanion<MemberSettlement> {
  final Value<String> id;
  final Value<String> settlementId;
  final Value<String> memberId;
  final Value<int> mealUnits;
  final Value<int> mealCostMinor;
  final Value<int> guestChargeMinor;
  final Value<int> specialMealChargeMinor;
  final Value<int> utilityShareMinor;
  final Value<int> sharedExpenseShareMinor;
  final Value<int> adjustmentDebitMinor;
  final Value<int> adjustmentCreditMinor;
  final Value<int> previousBalanceMinor;
  final Value<int> depositMinor;
  final Value<int> memberPaidExpenseMinor;
  final Value<int> totalPayableMinor;
  final Value<int> totalCreditMinor;
  final Value<int> finalBalanceMinor;
  final Value<int> rowid;
  const MemberSettlementsCompanion({
    this.id = const Value.absent(),
    this.settlementId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.mealUnits = const Value.absent(),
    this.mealCostMinor = const Value.absent(),
    this.guestChargeMinor = const Value.absent(),
    this.specialMealChargeMinor = const Value.absent(),
    this.utilityShareMinor = const Value.absent(),
    this.sharedExpenseShareMinor = const Value.absent(),
    this.adjustmentDebitMinor = const Value.absent(),
    this.adjustmentCreditMinor = const Value.absent(),
    this.previousBalanceMinor = const Value.absent(),
    this.depositMinor = const Value.absent(),
    this.memberPaidExpenseMinor = const Value.absent(),
    this.totalPayableMinor = const Value.absent(),
    this.totalCreditMinor = const Value.absent(),
    this.finalBalanceMinor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemberSettlementsCompanion.insert({
    required String id,
    required String settlementId,
    required String memberId,
    this.mealUnits = const Value.absent(),
    this.mealCostMinor = const Value.absent(),
    this.guestChargeMinor = const Value.absent(),
    this.specialMealChargeMinor = const Value.absent(),
    this.utilityShareMinor = const Value.absent(),
    this.sharedExpenseShareMinor = const Value.absent(),
    this.adjustmentDebitMinor = const Value.absent(),
    this.adjustmentCreditMinor = const Value.absent(),
    this.previousBalanceMinor = const Value.absent(),
    this.depositMinor = const Value.absent(),
    this.memberPaidExpenseMinor = const Value.absent(),
    required int totalPayableMinor,
    required int totalCreditMinor,
    required int finalBalanceMinor,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       settlementId = Value(settlementId),
       memberId = Value(memberId),
       totalPayableMinor = Value(totalPayableMinor),
       totalCreditMinor = Value(totalCreditMinor),
       finalBalanceMinor = Value(finalBalanceMinor);
  static Insertable<MemberSettlement> custom({
    Expression<String>? id,
    Expression<String>? settlementId,
    Expression<String>? memberId,
    Expression<int>? mealUnits,
    Expression<int>? mealCostMinor,
    Expression<int>? guestChargeMinor,
    Expression<int>? specialMealChargeMinor,
    Expression<int>? utilityShareMinor,
    Expression<int>? sharedExpenseShareMinor,
    Expression<int>? adjustmentDebitMinor,
    Expression<int>? adjustmentCreditMinor,
    Expression<int>? previousBalanceMinor,
    Expression<int>? depositMinor,
    Expression<int>? memberPaidExpenseMinor,
    Expression<int>? totalPayableMinor,
    Expression<int>? totalCreditMinor,
    Expression<int>? finalBalanceMinor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (settlementId != null) 'settlement_id': settlementId,
      if (memberId != null) 'member_id': memberId,
      if (mealUnits != null) 'meal_units': mealUnits,
      if (mealCostMinor != null) 'meal_cost_minor': mealCostMinor,
      if (guestChargeMinor != null) 'guest_charge_minor': guestChargeMinor,
      if (specialMealChargeMinor != null)
        'special_meal_charge_minor': specialMealChargeMinor,
      if (utilityShareMinor != null) 'utility_share_minor': utilityShareMinor,
      if (sharedExpenseShareMinor != null)
        'shared_expense_share_minor': sharedExpenseShareMinor,
      if (adjustmentDebitMinor != null)
        'adjustment_debit_minor': adjustmentDebitMinor,
      if (adjustmentCreditMinor != null)
        'adjustment_credit_minor': adjustmentCreditMinor,
      if (previousBalanceMinor != null)
        'previous_balance_minor': previousBalanceMinor,
      if (depositMinor != null) 'deposit_minor': depositMinor,
      if (memberPaidExpenseMinor != null)
        'member_paid_expense_minor': memberPaidExpenseMinor,
      if (totalPayableMinor != null) 'total_payable_minor': totalPayableMinor,
      if (totalCreditMinor != null) 'total_credit_minor': totalCreditMinor,
      if (finalBalanceMinor != null) 'final_balance_minor': finalBalanceMinor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemberSettlementsCompanion copyWith({
    Value<String>? id,
    Value<String>? settlementId,
    Value<String>? memberId,
    Value<int>? mealUnits,
    Value<int>? mealCostMinor,
    Value<int>? guestChargeMinor,
    Value<int>? specialMealChargeMinor,
    Value<int>? utilityShareMinor,
    Value<int>? sharedExpenseShareMinor,
    Value<int>? adjustmentDebitMinor,
    Value<int>? adjustmentCreditMinor,
    Value<int>? previousBalanceMinor,
    Value<int>? depositMinor,
    Value<int>? memberPaidExpenseMinor,
    Value<int>? totalPayableMinor,
    Value<int>? totalCreditMinor,
    Value<int>? finalBalanceMinor,
    Value<int>? rowid,
  }) {
    return MemberSettlementsCompanion(
      id: id ?? this.id,
      settlementId: settlementId ?? this.settlementId,
      memberId: memberId ?? this.memberId,
      mealUnits: mealUnits ?? this.mealUnits,
      mealCostMinor: mealCostMinor ?? this.mealCostMinor,
      guestChargeMinor: guestChargeMinor ?? this.guestChargeMinor,
      specialMealChargeMinor:
          specialMealChargeMinor ?? this.specialMealChargeMinor,
      utilityShareMinor: utilityShareMinor ?? this.utilityShareMinor,
      sharedExpenseShareMinor:
          sharedExpenseShareMinor ?? this.sharedExpenseShareMinor,
      adjustmentDebitMinor: adjustmentDebitMinor ?? this.adjustmentDebitMinor,
      adjustmentCreditMinor:
          adjustmentCreditMinor ?? this.adjustmentCreditMinor,
      previousBalanceMinor: previousBalanceMinor ?? this.previousBalanceMinor,
      depositMinor: depositMinor ?? this.depositMinor,
      memberPaidExpenseMinor:
          memberPaidExpenseMinor ?? this.memberPaidExpenseMinor,
      totalPayableMinor: totalPayableMinor ?? this.totalPayableMinor,
      totalCreditMinor: totalCreditMinor ?? this.totalCreditMinor,
      finalBalanceMinor: finalBalanceMinor ?? this.finalBalanceMinor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (settlementId.present) {
      map['settlement_id'] = Variable<String>(settlementId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<String>(memberId.value);
    }
    if (mealUnits.present) {
      map['meal_units'] = Variable<int>(mealUnits.value);
    }
    if (mealCostMinor.present) {
      map['meal_cost_minor'] = Variable<int>(mealCostMinor.value);
    }
    if (guestChargeMinor.present) {
      map['guest_charge_minor'] = Variable<int>(guestChargeMinor.value);
    }
    if (specialMealChargeMinor.present) {
      map['special_meal_charge_minor'] = Variable<int>(
        specialMealChargeMinor.value,
      );
    }
    if (utilityShareMinor.present) {
      map['utility_share_minor'] = Variable<int>(utilityShareMinor.value);
    }
    if (sharedExpenseShareMinor.present) {
      map['shared_expense_share_minor'] = Variable<int>(
        sharedExpenseShareMinor.value,
      );
    }
    if (adjustmentDebitMinor.present) {
      map['adjustment_debit_minor'] = Variable<int>(adjustmentDebitMinor.value);
    }
    if (adjustmentCreditMinor.present) {
      map['adjustment_credit_minor'] = Variable<int>(
        adjustmentCreditMinor.value,
      );
    }
    if (previousBalanceMinor.present) {
      map['previous_balance_minor'] = Variable<int>(previousBalanceMinor.value);
    }
    if (depositMinor.present) {
      map['deposit_minor'] = Variable<int>(depositMinor.value);
    }
    if (memberPaidExpenseMinor.present) {
      map['member_paid_expense_minor'] = Variable<int>(
        memberPaidExpenseMinor.value,
      );
    }
    if (totalPayableMinor.present) {
      map['total_payable_minor'] = Variable<int>(totalPayableMinor.value);
    }
    if (totalCreditMinor.present) {
      map['total_credit_minor'] = Variable<int>(totalCreditMinor.value);
    }
    if (finalBalanceMinor.present) {
      map['final_balance_minor'] = Variable<int>(finalBalanceMinor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemberSettlementsCompanion(')
          ..write('id: $id, ')
          ..write('settlementId: $settlementId, ')
          ..write('memberId: $memberId, ')
          ..write('mealUnits: $mealUnits, ')
          ..write('mealCostMinor: $mealCostMinor, ')
          ..write('guestChargeMinor: $guestChargeMinor, ')
          ..write('specialMealChargeMinor: $specialMealChargeMinor, ')
          ..write('utilityShareMinor: $utilityShareMinor, ')
          ..write('sharedExpenseShareMinor: $sharedExpenseShareMinor, ')
          ..write('adjustmentDebitMinor: $adjustmentDebitMinor, ')
          ..write('adjustmentCreditMinor: $adjustmentCreditMinor, ')
          ..write('previousBalanceMinor: $previousBalanceMinor, ')
          ..write('depositMinor: $depositMinor, ')
          ..write('memberPaidExpenseMinor: $memberPaidExpenseMinor, ')
          ..write('totalPayableMinor: $totalPayableMinor, ')
          ..write('totalCreditMinor: $totalCreditMinor, ')
          ..write('finalBalanceMinor: $finalBalanceMinor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relativePathMeta = const VerificationMeta(
    'relativePath',
  );
  @override
  late final GeneratedColumn<String> relativePath = GeneratedColumn<String>(
    'relative_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _byteSizeMeta = const VerificationMeta(
    'byteSize',
  );
  @override
  late final GeneratedColumn<int> byteSize = GeneratedColumn<int>(
    'byte_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    entityType,
    entityId,
    relativePath,
    mimeType,
    byteSize,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Attachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('relative_path')) {
      context.handle(
        _relativePathMeta,
        relativePath.isAcceptableOrUnknown(
          data['relative_path']!,
          _relativePathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relativePathMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    }
    if (data.containsKey('byte_size')) {
      context.handle(
        _byteSizeMeta,
        byteSize.isAcceptableOrUnknown(data['byte_size']!, _byteSizeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      relativePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relative_path'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      ),
      byteSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}byte_size'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final String id;
  final String messId;
  final String entityType;
  final String entityId;
  final String relativePath;
  final String? mimeType;
  final int byteSize;
  final DateTime createdAt;
  const Attachment({
    required this.id,
    required this.messId,
    required this.entityType,
    required this.entityId,
    required this.relativePath,
    this.mimeType,
    required this.byteSize,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['relative_path'] = Variable<String>(relativePath);
    if (!nullToAbsent || mimeType != null) {
      map['mime_type'] = Variable<String>(mimeType);
    }
    map['byte_size'] = Variable<int>(byteSize);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      messId: Value(messId),
      entityType: Value(entityType),
      entityId: Value(entityId),
      relativePath: Value(relativePath),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
      byteSize: Value(byteSize),
      createdAt: Value(createdAt),
    );
  }

  factory Attachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attachment(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      relativePath: serializer.fromJson<String>(json['relativePath']),
      mimeType: serializer.fromJson<String?>(json['mimeType']),
      byteSize: serializer.fromJson<int>(json['byteSize']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'relativePath': serializer.toJson<String>(relativePath),
      'mimeType': serializer.toJson<String?>(mimeType),
      'byteSize': serializer.toJson<int>(byteSize),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Attachment copyWith({
    String? id,
    String? messId,
    String? entityType,
    String? entityId,
    String? relativePath,
    Value<String?> mimeType = const Value.absent(),
    int? byteSize,
    DateTime? createdAt,
  }) => Attachment(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    relativePath: relativePath ?? this.relativePath,
    mimeType: mimeType.present ? mimeType.value : this.mimeType,
    byteSize: byteSize ?? this.byteSize,
    createdAt: createdAt ?? this.createdAt,
  );
  Attachment copyWithCompanion(AttachmentsCompanion data) {
    return Attachment(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      relativePath: data.relativePath.present
          ? data.relativePath.value
          : this.relativePath,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      byteSize: data.byteSize.present ? data.byteSize.value : this.byteSize,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('relativePath: $relativePath, ')
          ..write('mimeType: $mimeType, ')
          ..write('byteSize: $byteSize, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    entityType,
    entityId,
    relativePath,
    mimeType,
    byteSize,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.relativePath == this.relativePath &&
          other.mimeType == this.mimeType &&
          other.byteSize == this.byteSize &&
          other.createdAt == this.createdAt);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> relativePath;
  final Value<String?> mimeType;
  final Value<int> byteSize;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.relativePath = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.byteSize = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    required String id,
    required String messId,
    required String entityType,
    required String entityId,
    required String relativePath,
    this.mimeType = const Value.absent(),
    this.byteSize = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       entityType = Value(entityType),
       entityId = Value(entityId),
       relativePath = Value(relativePath);
  static Insertable<Attachment> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? relativePath,
    Expression<String>? mimeType,
    Expression<int>? byteSize,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (relativePath != null) 'relative_path': relativePath,
      if (mimeType != null) 'mime_type': mimeType,
      if (byteSize != null) 'byte_size': byteSize,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttachmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? relativePath,
    Value<String?>? mimeType,
    Value<int>? byteSize,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      relativePath: relativePath ?? this.relativePath,
      mimeType: mimeType ?? this.mimeType,
      byteSize: byteSize ?? this.byteSize,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (relativePath.present) {
      map['relative_path'] = Variable<String>(relativePath.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (byteSize.present) {
      map['byte_size'] = Variable<int>(byteSize.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('relativePath: $relativePath, ')
          ..write('mimeType: $mimeType, ')
          ..write('byteSize: $byteSize, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _scheduleJsonMeta = const VerificationMeta(
    'scheduleJson',
  );
  @override
  late final GeneratedColumn<String> scheduleJson = GeneratedColumn<String>(
    'schedule_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    type,
    isEnabled,
    scheduleJson,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('schedule_json')) {
      context.handle(
        _scheduleJsonMeta,
        scheduleJson.isAcceptableOrUnknown(
          data['schedule_json']!,
          _scheduleJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduleJsonMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      scheduleJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}schedule_json'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final String id;
  final String messId;
  final String type;
  final bool isEnabled;
  final String scheduleJson;
  final DateTime updatedAt;
  const Reminder({
    required this.id,
    required this.messId,
    required this.type,
    required this.isEnabled,
    required this.scheduleJson,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['type'] = Variable<String>(type);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['schedule_json'] = Variable<String>(scheduleJson);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      messId: Value(messId),
      type: Value(type),
      isEnabled: Value(isEnabled),
      scheduleJson: Value(scheduleJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      type: serializer.fromJson<String>(json['type']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      scheduleJson: serializer.fromJson<String>(json['scheduleJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'type': serializer.toJson<String>(type),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'scheduleJson': serializer.toJson<String>(scheduleJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Reminder copyWith({
    String? id,
    String? messId,
    String? type,
    bool? isEnabled,
    String? scheduleJson,
    DateTime? updatedAt,
  }) => Reminder(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    type: type ?? this.type,
    isEnabled: isEnabled ?? this.isEnabled,
    scheduleJson: scheduleJson ?? this.scheduleJson,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      type: data.type.present ? data.type.value : this.type,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      scheduleJson: data.scheduleJson.present
          ? data.scheduleJson.value
          : this.scheduleJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('type: $type, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('scheduleJson: $scheduleJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, messId, type, isEnabled, scheduleJson, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.type == this.type &&
          other.isEnabled == this.isEnabled &&
          other.scheduleJson == this.scheduleJson &&
          other.updatedAt == this.updatedAt);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> type;
  final Value<bool> isEnabled;
  final Value<String> scheduleJson;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.type = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.scheduleJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required String messId,
    required String type,
    this.isEnabled = const Value.absent(),
    required String scheduleJson,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       type = Value(type),
       scheduleJson = Value(scheduleJson);
  static Insertable<Reminder> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? type,
    Expression<bool>? isEnabled,
    Expression<String>? scheduleJson,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (type != null) 'type': type,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (scheduleJson != null) 'schedule_json': scheduleJson,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? type,
    Value<bool>? isEnabled,
    Value<String>? scheduleJson,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      type: type ?? this.type,
      isEnabled: isEnabled ?? this.isEnabled,
      scheduleJson: scheduleJson ?? this.scheduleJson,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (scheduleJson.present) {
      map['schedule_json'] = Variable<String>(scheduleJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('type: $type, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('scheduleJson: $scheduleJson, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _settingKeyMeta = const VerificationMeta(
    'settingKey',
  );
  @override
  late final GeneratedColumn<String> settingKey = GeneratedColumn<String>(
    'setting_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueJsonMeta = const VerificationMeta(
    'valueJson',
  );
  @override
  late final GeneratedColumn<String> valueJson = GeneratedColumn<String>(
    'value_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    settingKey,
    valueJson,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    }
    if (data.containsKey('setting_key')) {
      context.handle(
        _settingKeyMeta,
        settingKey.isAcceptableOrUnknown(data['setting_key']!, _settingKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_settingKeyMeta);
    }
    if (data.containsKey('value_json')) {
      context.handle(
        _valueJsonMeta,
        valueJson.isAcceptableOrUnknown(data['value_json']!, _valueJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_valueJsonMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      ),
      settingKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setting_key'],
      )!,
      valueJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_json'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String id;
  final String? messId;
  final String settingKey;
  final String valueJson;
  final DateTime updatedAt;
  const AppSetting({
    required this.id,
    this.messId,
    required this.settingKey,
    required this.valueJson,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || messId != null) {
      map['mess_id'] = Variable<String>(messId);
    }
    map['setting_key'] = Variable<String>(settingKey);
    map['value_json'] = Variable<String>(valueJson);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      messId: messId == null && nullToAbsent
          ? const Value.absent()
          : Value(messId),
      settingKey: Value(settingKey),
      valueJson: Value(valueJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String?>(json['messId']),
      settingKey: serializer.fromJson<String>(json['settingKey']),
      valueJson: serializer.fromJson<String>(json['valueJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String?>(messId),
      'settingKey': serializer.toJson<String>(settingKey),
      'valueJson': serializer.toJson<String>(valueJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({
    String? id,
    Value<String?> messId = const Value.absent(),
    String? settingKey,
    String? valueJson,
    DateTime? updatedAt,
  }) => AppSetting(
    id: id ?? this.id,
    messId: messId.present ? messId.value : this.messId,
    settingKey: settingKey ?? this.settingKey,
    valueJson: valueJson ?? this.valueJson,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      settingKey: data.settingKey.present
          ? data.settingKey.value
          : this.settingKey,
      valueJson: data.valueJson.present ? data.valueJson.value : this.valueJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('settingKey: $settingKey, ')
          ..write('valueJson: $valueJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, messId, settingKey, valueJson, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.settingKey == this.settingKey &&
          other.valueJson == this.valueJson &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> id;
  final Value<String?> messId;
  final Value<String> settingKey;
  final Value<String> valueJson;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.settingKey = const Value.absent(),
    this.valueJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String id,
    this.messId = const Value.absent(),
    required String settingKey,
    required String valueJson,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       settingKey = Value(settingKey),
       valueJson = Value(valueJson);
  static Insertable<AppSetting> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? settingKey,
    Expression<String>? valueJson,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (settingKey != null) 'setting_key': settingKey,
      if (valueJson != null) 'value_json': valueJson,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? id,
    Value<String?>? messId,
    Value<String>? settingKey,
    Value<String>? valueJson,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      settingKey: settingKey ?? this.settingKey,
      valueJson: valueJson ?? this.valueJson,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (settingKey.present) {
      map['setting_key'] = Variable<String>(settingKey.value);
    }
    if (valueJson.present) {
      map['value_json'] = Variable<String>(valueJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('settingKey: $settingKey, ')
          ..write('valueJson: $valueJson, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditEntriesTable extends AuditEntries
    with TableInfo<$AuditEntriesTable, AuditEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _oldValueJsonMeta = const VerificationMeta(
    'oldValueJson',
  );
  @override
  late final GeneratedColumn<String> oldValueJson = GeneratedColumn<String>(
    'old_value_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _newValueJsonMeta = const VerificationMeta(
    'newValueJson',
  );
  @override
  late final GeneratedColumn<String> newValueJson = GeneratedColumn<String>(
    'new_value_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    entityType,
    entityId,
    action,
    oldValueJson,
    newValueJson,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('old_value_json')) {
      context.handle(
        _oldValueJsonMeta,
        oldValueJson.isAcceptableOrUnknown(
          data['old_value_json']!,
          _oldValueJsonMeta,
        ),
      );
    }
    if (data.containsKey('new_value_json')) {
      context.handle(
        _newValueJsonMeta,
        newValueJson.isAcceptableOrUnknown(
          data['new_value_json']!,
          _newValueJsonMeta,
        ),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      oldValueJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}old_value_json'],
      ),
      newValueJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}new_value_json'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $AuditEntriesTable createAlias(String alias) {
    return $AuditEntriesTable(attachedDatabase, alias);
  }
}

class AuditEntry extends DataClass implements Insertable<AuditEntry> {
  final String id;
  final String messId;
  final String entityType;
  final String entityId;
  final String action;
  final String? oldValueJson;
  final String? newValueJson;
  final DateTime timestamp;
  const AuditEntry({
    required this.id,
    required this.messId,
    required this.entityType,
    required this.entityId,
    required this.action,
    this.oldValueJson,
    this.newValueJson,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mess_id'] = Variable<String>(messId);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['action'] = Variable<String>(action);
    if (!nullToAbsent || oldValueJson != null) {
      map['old_value_json'] = Variable<String>(oldValueJson);
    }
    if (!nullToAbsent || newValueJson != null) {
      map['new_value_json'] = Variable<String>(newValueJson);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  AuditEntriesCompanion toCompanion(bool nullToAbsent) {
    return AuditEntriesCompanion(
      id: Value(id),
      messId: Value(messId),
      entityType: Value(entityType),
      entityId: Value(entityId),
      action: Value(action),
      oldValueJson: oldValueJson == null && nullToAbsent
          ? const Value.absent()
          : Value(oldValueJson),
      newValueJson: newValueJson == null && nullToAbsent
          ? const Value.absent()
          : Value(newValueJson),
      timestamp: Value(timestamp),
    );
  }

  factory AuditEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditEntry(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String>(json['messId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      action: serializer.fromJson<String>(json['action']),
      oldValueJson: serializer.fromJson<String?>(json['oldValueJson']),
      newValueJson: serializer.fromJson<String?>(json['newValueJson']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String>(messId),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'action': serializer.toJson<String>(action),
      'oldValueJson': serializer.toJson<String?>(oldValueJson),
      'newValueJson': serializer.toJson<String?>(newValueJson),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  AuditEntry copyWith({
    String? id,
    String? messId,
    String? entityType,
    String? entityId,
    String? action,
    Value<String?> oldValueJson = const Value.absent(),
    Value<String?> newValueJson = const Value.absent(),
    DateTime? timestamp,
  }) => AuditEntry(
    id: id ?? this.id,
    messId: messId ?? this.messId,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    action: action ?? this.action,
    oldValueJson: oldValueJson.present ? oldValueJson.value : this.oldValueJson,
    newValueJson: newValueJson.present ? newValueJson.value : this.newValueJson,
    timestamp: timestamp ?? this.timestamp,
  );
  AuditEntry copyWithCompanion(AuditEntriesCompanion data) {
    return AuditEntry(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      action: data.action.present ? data.action.value : this.action,
      oldValueJson: data.oldValueJson.present
          ? data.oldValueJson.value
          : this.oldValueJson,
      newValueJson: data.newValueJson.present
          ? data.newValueJson.value
          : this.newValueJson,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditEntry(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('oldValueJson: $oldValueJson, ')
          ..write('newValueJson: $newValueJson, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    entityType,
    entityId,
    action,
    oldValueJson,
    newValueJson,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditEntry &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.action == this.action &&
          other.oldValueJson == this.oldValueJson &&
          other.newValueJson == this.newValueJson &&
          other.timestamp == this.timestamp);
}

class AuditEntriesCompanion extends UpdateCompanion<AuditEntry> {
  final Value<String> id;
  final Value<String> messId;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> action;
  final Value<String?> oldValueJson;
  final Value<String?> newValueJson;
  final Value<DateTime> timestamp;
  final Value<int> rowid;
  const AuditEntriesCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.action = const Value.absent(),
    this.oldValueJson = const Value.absent(),
    this.newValueJson = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuditEntriesCompanion.insert({
    required String id,
    required String messId,
    required String entityType,
    required String entityId,
    required String action,
    this.oldValueJson = const Value.absent(),
    this.newValueJson = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       messId = Value(messId),
       entityType = Value(entityType),
       entityId = Value(entityId),
       action = Value(action);
  static Insertable<AuditEntry> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? action,
    Expression<String>? oldValueJson,
    Expression<String>? newValueJson,
    Expression<DateTime>? timestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (action != null) 'action': action,
      if (oldValueJson != null) 'old_value_json': oldValueJson,
      if (newValueJson != null) 'new_value_json': newValueJson,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuditEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? messId,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? action,
    Value<String?>? oldValueJson,
    Value<String?>? newValueJson,
    Value<DateTime>? timestamp,
    Value<int>? rowid,
  }) {
    return AuditEntriesCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      action: action ?? this.action,
      oldValueJson: oldValueJson ?? this.oldValueJson,
      newValueJson: newValueJson ?? this.newValueJson,
      timestamp: timestamp ?? this.timestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (oldValueJson.present) {
      map['old_value_json'] = Variable<String>(oldValueJson.value);
    }
    if (newValueJson.present) {
      map['new_value_json'] = Variable<String>(newValueJson.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditEntriesCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('oldValueJson: $oldValueJson, ')
          ..write('newValueJson: $newValueJson, ')
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BackupMetadataTable extends BackupMetadata
    with TableInfo<$BackupMetadataTable, BackupMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messIdMeta = const VerificationMeta('messId');
  @override
  late final GeneratedColumn<String> messId = GeneratedColumn<String>(
    'mess_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messes (id)',
    ),
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relativePathMeta = const VerificationMeta(
    'relativePath',
  );
  @override
  late final GeneratedColumn<String> relativePath = GeneratedColumn<String>(
    'relative_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formatVersionMeta = const VerificationMeta(
    'formatVersion',
  );
  @override
  late final GeneratedColumn<int> formatVersion = GeneratedColumn<int>(
    'format_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _databaseVersionMeta = const VerificationMeta(
    'databaseVersion',
  );
  @override
  late final GeneratedColumn<int> databaseVersion = GeneratedColumn<int>(
    'database_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _byteSizeMeta = const VerificationMeta(
    'byteSize',
  );
  @override
  late final GeneratedColumn<int> byteSize = GeneratedColumn<int>(
    'byte_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    messId,
    fileName,
    relativePath,
    formatVersion,
    databaseVersion,
    byteSize,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<BackupMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mess_id')) {
      context.handle(
        _messIdMeta,
        messId.isAcceptableOrUnknown(data['mess_id']!, _messIdMeta),
      );
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('relative_path')) {
      context.handle(
        _relativePathMeta,
        relativePath.isAcceptableOrUnknown(
          data['relative_path']!,
          _relativePathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relativePathMeta);
    }
    if (data.containsKey('format_version')) {
      context.handle(
        _formatVersionMeta,
        formatVersion.isAcceptableOrUnknown(
          data['format_version']!,
          _formatVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_formatVersionMeta);
    }
    if (data.containsKey('database_version')) {
      context.handle(
        _databaseVersionMeta,
        databaseVersion.isAcceptableOrUnknown(
          data['database_version']!,
          _databaseVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_databaseVersionMeta);
    }
    if (data.containsKey('byte_size')) {
      context.handle(
        _byteSizeMeta,
        byteSize.isAcceptableOrUnknown(data['byte_size']!, _byteSizeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupMetadataData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      messId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mess_id'],
      ),
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      relativePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relative_path'],
      )!,
      formatVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}format_version'],
      )!,
      databaseVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}database_version'],
      )!,
      byteSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}byte_size'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BackupMetadataTable createAlias(String alias) {
    return $BackupMetadataTable(attachedDatabase, alias);
  }
}

class BackupMetadataData extends DataClass
    implements Insertable<BackupMetadataData> {
  final String id;
  final String? messId;
  final String fileName;
  final String relativePath;
  final int formatVersion;
  final int databaseVersion;
  final int byteSize;
  final DateTime createdAt;
  const BackupMetadataData({
    required this.id,
    this.messId,
    required this.fileName,
    required this.relativePath,
    required this.formatVersion,
    required this.databaseVersion,
    required this.byteSize,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || messId != null) {
      map['mess_id'] = Variable<String>(messId);
    }
    map['file_name'] = Variable<String>(fileName);
    map['relative_path'] = Variable<String>(relativePath);
    map['format_version'] = Variable<int>(formatVersion);
    map['database_version'] = Variable<int>(databaseVersion);
    map['byte_size'] = Variable<int>(byteSize);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BackupMetadataCompanion toCompanion(bool nullToAbsent) {
    return BackupMetadataCompanion(
      id: Value(id),
      messId: messId == null && nullToAbsent
          ? const Value.absent()
          : Value(messId),
      fileName: Value(fileName),
      relativePath: Value(relativePath),
      formatVersion: Value(formatVersion),
      databaseVersion: Value(databaseVersion),
      byteSize: Value(byteSize),
      createdAt: Value(createdAt),
    );
  }

  factory BackupMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupMetadataData(
      id: serializer.fromJson<String>(json['id']),
      messId: serializer.fromJson<String?>(json['messId']),
      fileName: serializer.fromJson<String>(json['fileName']),
      relativePath: serializer.fromJson<String>(json['relativePath']),
      formatVersion: serializer.fromJson<int>(json['formatVersion']),
      databaseVersion: serializer.fromJson<int>(json['databaseVersion']),
      byteSize: serializer.fromJson<int>(json['byteSize']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messId': serializer.toJson<String?>(messId),
      'fileName': serializer.toJson<String>(fileName),
      'relativePath': serializer.toJson<String>(relativePath),
      'formatVersion': serializer.toJson<int>(formatVersion),
      'databaseVersion': serializer.toJson<int>(databaseVersion),
      'byteSize': serializer.toJson<int>(byteSize),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BackupMetadataData copyWith({
    String? id,
    Value<String?> messId = const Value.absent(),
    String? fileName,
    String? relativePath,
    int? formatVersion,
    int? databaseVersion,
    int? byteSize,
    DateTime? createdAt,
  }) => BackupMetadataData(
    id: id ?? this.id,
    messId: messId.present ? messId.value : this.messId,
    fileName: fileName ?? this.fileName,
    relativePath: relativePath ?? this.relativePath,
    formatVersion: formatVersion ?? this.formatVersion,
    databaseVersion: databaseVersion ?? this.databaseVersion,
    byteSize: byteSize ?? this.byteSize,
    createdAt: createdAt ?? this.createdAt,
  );
  BackupMetadataData copyWithCompanion(BackupMetadataCompanion data) {
    return BackupMetadataData(
      id: data.id.present ? data.id.value : this.id,
      messId: data.messId.present ? data.messId.value : this.messId,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      relativePath: data.relativePath.present
          ? data.relativePath.value
          : this.relativePath,
      formatVersion: data.formatVersion.present
          ? data.formatVersion.value
          : this.formatVersion,
      databaseVersion: data.databaseVersion.present
          ? data.databaseVersion.value
          : this.databaseVersion,
      byteSize: data.byteSize.present ? data.byteSize.value : this.byteSize,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupMetadataData(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('fileName: $fileName, ')
          ..write('relativePath: $relativePath, ')
          ..write('formatVersion: $formatVersion, ')
          ..write('databaseVersion: $databaseVersion, ')
          ..write('byteSize: $byteSize, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    messId,
    fileName,
    relativePath,
    formatVersion,
    databaseVersion,
    byteSize,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupMetadataData &&
          other.id == this.id &&
          other.messId == this.messId &&
          other.fileName == this.fileName &&
          other.relativePath == this.relativePath &&
          other.formatVersion == this.formatVersion &&
          other.databaseVersion == this.databaseVersion &&
          other.byteSize == this.byteSize &&
          other.createdAt == this.createdAt);
}

class BackupMetadataCompanion extends UpdateCompanion<BackupMetadataData> {
  final Value<String> id;
  final Value<String?> messId;
  final Value<String> fileName;
  final Value<String> relativePath;
  final Value<int> formatVersion;
  final Value<int> databaseVersion;
  final Value<int> byteSize;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BackupMetadataCompanion({
    this.id = const Value.absent(),
    this.messId = const Value.absent(),
    this.fileName = const Value.absent(),
    this.relativePath = const Value.absent(),
    this.formatVersion = const Value.absent(),
    this.databaseVersion = const Value.absent(),
    this.byteSize = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BackupMetadataCompanion.insert({
    required String id,
    this.messId = const Value.absent(),
    required String fileName,
    required String relativePath,
    required int formatVersion,
    required int databaseVersion,
    this.byteSize = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fileName = Value(fileName),
       relativePath = Value(relativePath),
       formatVersion = Value(formatVersion),
       databaseVersion = Value(databaseVersion);
  static Insertable<BackupMetadataData> custom({
    Expression<String>? id,
    Expression<String>? messId,
    Expression<String>? fileName,
    Expression<String>? relativePath,
    Expression<int>? formatVersion,
    Expression<int>? databaseVersion,
    Expression<int>? byteSize,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messId != null) 'mess_id': messId,
      if (fileName != null) 'file_name': fileName,
      if (relativePath != null) 'relative_path': relativePath,
      if (formatVersion != null) 'format_version': formatVersion,
      if (databaseVersion != null) 'database_version': databaseVersion,
      if (byteSize != null) 'byte_size': byteSize,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BackupMetadataCompanion copyWith({
    Value<String>? id,
    Value<String?>? messId,
    Value<String>? fileName,
    Value<String>? relativePath,
    Value<int>? formatVersion,
    Value<int>? databaseVersion,
    Value<int>? byteSize,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return BackupMetadataCompanion(
      id: id ?? this.id,
      messId: messId ?? this.messId,
      fileName: fileName ?? this.fileName,
      relativePath: relativePath ?? this.relativePath,
      formatVersion: formatVersion ?? this.formatVersion,
      databaseVersion: databaseVersion ?? this.databaseVersion,
      byteSize: byteSize ?? this.byteSize,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messId.present) {
      map['mess_id'] = Variable<String>(messId.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (relativePath.present) {
      map['relative_path'] = Variable<String>(relativePath.value);
    }
    if (formatVersion.present) {
      map['format_version'] = Variable<int>(formatVersion.value);
    }
    if (databaseVersion.present) {
      map['database_version'] = Variable<int>(databaseVersion.value);
    }
    if (byteSize.present) {
      map['byte_size'] = Variable<int>(byteSize.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupMetadataCompanion(')
          ..write('id: $id, ')
          ..write('messId: $messId, ')
          ..write('fileName: $fileName, ')
          ..write('relativePath: $relativePath, ')
          ..write('formatVersion: $formatVersion, ')
          ..write('databaseVersion: $databaseVersion, ')
          ..write('byteSize: $byteSize, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MessesTable messes = $MessesTable(this);
  late final $MembersTable members = $MembersTable(this);
  late final $AccountingMonthsTable accountingMonths = $AccountingMonthsTable(
    this,
  );
  late final $MealEntriesTable mealEntries = $MealEntriesTable(this);
  late final $GuestMealsTable guestMeals = $GuestMealsTable(this);
  late final $SpecialMealsTable specialMeals = $SpecialMealsTable(this);
  late final $SpecialMealMembersTable specialMealMembers =
      $SpecialMealMembersTable(this);
  late final $ExpenseCategoriesTable expenseCategories =
      $ExpenseCategoriesTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $UtilityBillsTable utilityBills = $UtilityBillsTable(this);
  late final $UtilityBillAllocationsTable utilityBillAllocations =
      $UtilityBillAllocationsTable(this);
  late final $DepositsTable deposits = $DepositsTable(this);
  late final $MemberAdjustmentsTable memberAdjustments =
      $MemberAdjustmentsTable(this);
  late final $SettlementsTable settlements = $SettlementsTable(this);
  late final $MemberSettlementsTable memberSettlements =
      $MemberSettlementsTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $AuditEntriesTable auditEntries = $AuditEntriesTable(this);
  late final $BackupMetadataTable backupMetadata = $BackupMetadataTable(this);
  late final MessDao messDao = MessDao(this as AppDatabase);
  late final MemberDao memberDao = MemberDao(this as AppDatabase);
  late final AccountingMonthDao accountingMonthDao = AccountingMonthDao(
    this as AppDatabase,
  );
  late final MealDao mealDao = MealDao(this as AppDatabase);
  late final ExpenseDao expenseDao = ExpenseDao(this as AppDatabase);
  late final DepositDao depositDao = DepositDao(this as AppDatabase);
  late final UtilityDao utilityDao = UtilityDao(this as AppDatabase);
  late final SettlementDao settlementDao = SettlementDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    messes,
    members,
    accountingMonths,
    mealEntries,
    guestMeals,
    specialMeals,
    specialMealMembers,
    expenseCategories,
    expenses,
    utilityBills,
    utilityBillAllocations,
    deposits,
    memberAdjustments,
    settlements,
    memberSettlements,
    attachments,
    reminders,
    appSettings,
    auditEntries,
    backupMetadata,
  ];
}

typedef $$MessesTableCreateCompanionBuilder = MessesCompanion Function({
  required String id,
  required String name,
  Value<String?> address,
  required String managerName,
  Value<String?> managerPhone,
  Value<String> currencyCode,
  Value<String> defaultLanguage,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$MessesTableUpdateCompanionBuilder = MessesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> address,
  Value<String> managerName,
  Value<String?> managerPhone,
  Value<String> currencyCode,
  Value<String> defaultLanguage,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$MessesTableReferences
    extends BaseReferences<_$AppDatabase, $MessesTable, MessesData> {
  $$MessesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MembersTable, List<Member>> _membersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.members,
    aliasName: 'messes__id__members__mess_id',
  );

  $$MembersTableProcessedTableManager get membersRefs {
    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_membersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AccountingMonthsTable, List<AccountingMonth>>
  _accountingMonthsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.accountingMonths,
    aliasName: 'messes__id__accounting_months__mess_id',
  );

  $$AccountingMonthsTableProcessedTableManager get accountingMonthsRefs {
    final manager = $$AccountingMonthsTableTableManager(
      $_db,
      $_db.accountingMonths,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _accountingMonthsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MealEntriesTable, List<MealEntry>>
  _mealEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealEntries,
    aliasName: 'messes__id__meal_entries__mess_id',
  );

  $$MealEntriesTableProcessedTableManager get mealEntriesRefs {
    final manager = $$MealEntriesTableTableManager(
      $_db,
      $_db.mealEntries,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GuestMealsTable, List<GuestMeal>>
  _guestMealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.guestMeals,
    aliasName: 'messes__id__guest_meals__mess_id',
  );

  $$GuestMealsTableProcessedTableManager get guestMealsRefs {
    final manager = $$GuestMealsTableTableManager(
      $_db,
      $_db.guestMeals,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_guestMealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SpecialMealsTable, List<SpecialMeal>>
  _specialMealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.specialMeals,
    aliasName: 'messes__id__special_meals__mess_id',
  );

  $$SpecialMealsTableProcessedTableManager get specialMealsRefs {
    final manager = $$SpecialMealsTableTableManager(
      $_db,
      $_db.specialMeals,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_specialMealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExpenseCategoriesTable, List<ExpenseCategory>>
  _expenseCategoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.expenseCategories,
        aliasName: 'messes__id__expense_categories__mess_id',
      );

  $$ExpenseCategoriesTableProcessedTableManager get expenseCategoriesRefs {
    final manager = $$ExpenseCategoriesTableTableManager(
      $_db,
      $_db.expenseCategories,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _expenseCategoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.expenses,
    aliasName: 'messes__id__expenses__mess_id',
  );

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager(
      $_db,
      $_db.expenses,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UtilityBillsTable, List<UtilityBill>>
  _utilityBillsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.utilityBills,
    aliasName: 'messes__id__utility_bills__mess_id',
  );

  $$UtilityBillsTableProcessedTableManager get utilityBillsRefs {
    final manager = $$UtilityBillsTableTableManager(
      $_db,
      $_db.utilityBills,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_utilityBillsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DepositsTable, List<Deposit>> _depositsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.deposits,
    aliasName: 'messes__id__deposits__mess_id',
  );

  $$DepositsTableProcessedTableManager get depositsRefs {
    final manager = $$DepositsTableTableManager(
      $_db,
      $_db.deposits,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_depositsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MemberAdjustmentsTable, List<MemberAdjustment>>
  _memberAdjustmentsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.memberAdjustments,
        aliasName: 'messes__id__member_adjustments__mess_id',
      );

  $$MemberAdjustmentsTableProcessedTableManager get memberAdjustmentsRefs {
    final manager = $$MemberAdjustmentsTableTableManager(
      $_db,
      $_db.memberAdjustments,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _memberAdjustmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SettlementsTable, List<Settlement>>
  _settlementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.settlements,
    aliasName: 'messes__id__settlements__mess_id',
  );

  $$SettlementsTableProcessedTableManager get settlementsRefs {
    final manager = $$SettlementsTableTableManager(
      $_db,
      $_db.settlements,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_settlementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AttachmentsTable, List<Attachment>>
  _attachmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.attachments,
    aliasName: 'messes__id__attachments__mess_id',
  );

  $$AttachmentsTableProcessedTableManager get attachmentsRefs {
    final manager = $$AttachmentsTableTableManager(
      $_db,
      $_db.attachments,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_attachmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RemindersTable, List<Reminder>>
  _remindersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reminders,
    aliasName: 'messes__id__reminders__mess_id',
  );

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager(
      $_db,
      $_db.reminders,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AppSettingsTable, List<AppSetting>>
  _appSettingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.appSettings,
    aliasName: 'messes__id__app_settings__mess_id',
  );

  $$AppSettingsTableProcessedTableManager get appSettingsRefs {
    final manager = $$AppSettingsTableTableManager(
      $_db,
      $_db.appSettings,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_appSettingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AuditEntriesTable, List<AuditEntry>>
  _auditEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.auditEntries,
    aliasName: 'messes__id__audit_entries__mess_id',
  );

  $$AuditEntriesTableProcessedTableManager get auditEntriesRefs {
    final manager = $$AuditEntriesTableTableManager(
      $_db,
      $_db.auditEntries,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_auditEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BackupMetadataTable, List<BackupMetadataData>>
  _backupMetadataRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.backupMetadata,
    aliasName: 'messes__id__backup_metadata__mess_id',
  );

  $$BackupMetadataTableProcessedTableManager get backupMetadataRefs {
    final manager = $$BackupMetadataTableTableManager(
      $_db,
      $_db.backupMetadata,
    ).filter((f) => f.messId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_backupMetadataRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MessesTableFilterComposer
    extends Composer<_$AppDatabase, $MessesTable> {
  $$MessesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get managerName => $composableBuilder(
    column: $table.managerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get managerPhone => $composableBuilder(
    column: $table.managerPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultLanguage => $composableBuilder(
    column: $table.defaultLanguage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> membersRefs(
    Expression<bool> Function($$MembersTableFilterComposer f) f,
  ) {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> accountingMonthsRefs(
    Expression<bool> Function($$AccountingMonthsTableFilterComposer f) f,
  ) {
    final $$AccountingMonthsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableFilterComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealEntriesRefs(
    Expression<bool> Function($$MealEntriesTableFilterComposer f) f,
  ) {
    final $$MealEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableFilterComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> guestMealsRefs(
    Expression<bool> Function($$GuestMealsTableFilterComposer f) f,
  ) {
    final $$GuestMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestMeals,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestMealsTableFilterComposer(
            $db: $db,
            $table: $db.guestMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> specialMealsRefs(
    Expression<bool> Function($$SpecialMealsTableFilterComposer f) f,
  ) {
    final $$SpecialMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.specialMeals,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpecialMealsTableFilterComposer(
            $db: $db,
            $table: $db.specialMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> expenseCategoriesRefs(
    Expression<bool> Function($$ExpenseCategoriesTableFilterComposer f) f,
  ) {
    final $$ExpenseCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenseCategories,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpenseCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.expenseCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> expensesRefs(
    Expression<bool> Function($$ExpensesTableFilterComposer f) f,
  ) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableFilterComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> utilityBillsRefs(
    Expression<bool> Function($$UtilityBillsTableFilterComposer f) f,
  ) {
    final $$UtilityBillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableFilterComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> depositsRefs(
    Expression<bool> Function($$DepositsTableFilterComposer f) f,
  ) {
    final $$DepositsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.deposits,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepositsTableFilterComposer(
            $db: $db,
            $table: $db.deposits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> memberAdjustmentsRefs(
    Expression<bool> Function($$MemberAdjustmentsTableFilterComposer f) f,
  ) {
    final $$MemberAdjustmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.memberAdjustments,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemberAdjustmentsTableFilterComposer(
            $db: $db,
            $table: $db.memberAdjustments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> settlementsRefs(
    Expression<bool> Function($$SettlementsTableFilterComposer f) f,
  ) {
    final $$SettlementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.settlements,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SettlementsTableFilterComposer(
            $db: $db,
            $table: $db.settlements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> attachmentsRefs(
    Expression<bool> Function($$AttachmentsTableFilterComposer f) f,
  ) {
    final $$AttachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attachments,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttachmentsTableFilterComposer(
            $db: $db,
            $table: $db.attachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> remindersRefs(
    Expression<bool> Function($$RemindersTableFilterComposer f) f,
  ) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableFilterComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> appSettingsRefs(
    Expression<bool> Function($$AppSettingsTableFilterComposer f) f,
  ) {
    final $$AppSettingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appSettings,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppSettingsTableFilterComposer(
            $db: $db,
            $table: $db.appSettings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> auditEntriesRefs(
    Expression<bool> Function($$AuditEntriesTableFilterComposer f) f,
  ) {
    final $$AuditEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.auditEntries,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditEntriesTableFilterComposer(
            $db: $db,
            $table: $db.auditEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> backupMetadataRefs(
    Expression<bool> Function($$BackupMetadataTableFilterComposer f) f,
  ) {
    final $$BackupMetadataTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.backupMetadata,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BackupMetadataTableFilterComposer(
            $db: $db,
            $table: $db.backupMetadata,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MessesTableOrderingComposer
    extends Composer<_$AppDatabase, $MessesTable> {
  $$MessesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get managerName => $composableBuilder(
    column: $table.managerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get managerPhone => $composableBuilder(
    column: $table.managerPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultLanguage => $composableBuilder(
    column: $table.defaultLanguage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MessesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessesTable> {
  $$MessesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get managerName => $composableBuilder(
    column: $table.managerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get managerPhone => $composableBuilder(
    column: $table.managerPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultLanguage => $composableBuilder(
    column: $table.defaultLanguage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> membersRefs<T extends Object>(
    Expression<T> Function($$MembersTableAnnotationComposer a) f,
  ) {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> accountingMonthsRefs<T extends Object>(
    Expression<T> Function($$AccountingMonthsTableAnnotationComposer a) f,
  ) {
    final $$AccountingMonthsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableAnnotationComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mealEntriesRefs<T extends Object>(
    Expression<T> Function($$MealEntriesTableAnnotationComposer a) f,
  ) {
    final $$MealEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> guestMealsRefs<T extends Object>(
    Expression<T> Function($$GuestMealsTableAnnotationComposer a) f,
  ) {
    final $$GuestMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestMeals,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.guestMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> specialMealsRefs<T extends Object>(
    Expression<T> Function($$SpecialMealsTableAnnotationComposer a) f,
  ) {
    final $$SpecialMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.specialMeals,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpecialMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.specialMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> expenseCategoriesRefs<T extends Object>(
    Expression<T> Function($$ExpenseCategoriesTableAnnotationComposer a) f,
  ) {
    final $$ExpenseCategoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.expenseCategories,
          getReferencedColumn: (t) => t.messId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExpenseCategoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.expenseCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> expensesRefs<T extends Object>(
    Expression<T> Function($$ExpensesTableAnnotationComposer a) f,
  ) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableAnnotationComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> utilityBillsRefs<T extends Object>(
    Expression<T> Function($$UtilityBillsTableAnnotationComposer a) f,
  ) {
    final $$UtilityBillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableAnnotationComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> depositsRefs<T extends Object>(
    Expression<T> Function($$DepositsTableAnnotationComposer a) f,
  ) {
    final $$DepositsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.deposits,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepositsTableAnnotationComposer(
            $db: $db,
            $table: $db.deposits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> memberAdjustmentsRefs<T extends Object>(
    Expression<T> Function($$MemberAdjustmentsTableAnnotationComposer a) f,
  ) {
    final $$MemberAdjustmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.memberAdjustments,
          getReferencedColumn: (t) => t.messId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MemberAdjustmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.memberAdjustments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> settlementsRefs<T extends Object>(
    Expression<T> Function($$SettlementsTableAnnotationComposer a) f,
  ) {
    final $$SettlementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.settlements,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SettlementsTableAnnotationComposer(
            $db: $db,
            $table: $db.settlements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> attachmentsRefs<T extends Object>(
    Expression<T> Function($$AttachmentsTableAnnotationComposer a) f,
  ) {
    final $$AttachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attachments,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.attachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> remindersRefs<T extends Object>(
    Expression<T> Function($$RemindersTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableAnnotationComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> appSettingsRefs<T extends Object>(
    Expression<T> Function($$AppSettingsTableAnnotationComposer a) f,
  ) {
    final $$AppSettingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appSettings,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppSettingsTableAnnotationComposer(
            $db: $db,
            $table: $db.appSettings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> auditEntriesRefs<T extends Object>(
    Expression<T> Function($$AuditEntriesTableAnnotationComposer a) f,
  ) {
    final $$AuditEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.auditEntries,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.auditEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> backupMetadataRefs<T extends Object>(
    Expression<T> Function($$BackupMetadataTableAnnotationComposer a) f,
  ) {
    final $$BackupMetadataTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.backupMetadata,
      getReferencedColumn: (t) => t.messId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BackupMetadataTableAnnotationComposer(
            $db: $db,
            $table: $db.backupMetadata,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MessesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MessesTable,
          MessesData,
          $$MessesTableFilterComposer,
          $$MessesTableOrderingComposer,
          $$MessesTableAnnotationComposer,
          $$MessesTableCreateCompanionBuilder,
          $$MessesTableUpdateCompanionBuilder,
          (MessesData, $$MessesTableReferences),
          MessesData,
          PrefetchHooks Function({
            bool membersRefs,
            bool accountingMonthsRefs,
            bool mealEntriesRefs,
            bool guestMealsRefs,
            bool specialMealsRefs,
            bool expenseCategoriesRefs,
            bool expensesRefs,
            bool utilityBillsRefs,
            bool depositsRefs,
            bool memberAdjustmentsRefs,
            bool settlementsRefs,
            bool attachmentsRefs,
            bool remindersRefs,
            bool appSettingsRefs,
            bool auditEntriesRefs,
            bool backupMetadataRefs,
          })
        > {
  $$MessesTableTableManager(_$AppDatabase db, $MessesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String> managerName = const Value.absent(),
                Value<String?> managerPhone = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String> defaultLanguage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MessesCompanion(
                id: id,
                name: name,
                address: address,
                managerName: managerName,
                managerPhone: managerPhone,
                currencyCode: currencyCode,
                defaultLanguage: defaultLanguage,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> address = const Value.absent(),
                required String managerName,
                Value<String?> managerPhone = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String> defaultLanguage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MessesCompanion.insert(
                id: id,
                name: name,
                address: address,
                managerName: managerName,
                managerPhone: managerPhone,
                currencyCode: currencyCode,
                defaultLanguage: defaultLanguage,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MessesTable, MessesData>(table),
                  $$MessesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                membersRefs = false,
                accountingMonthsRefs = false,
                mealEntriesRefs = false,
                guestMealsRefs = false,
                specialMealsRefs = false,
                expenseCategoriesRefs = false,
                expensesRefs = false,
                utilityBillsRefs = false,
                depositsRefs = false,
                memberAdjustmentsRefs = false,
                settlementsRefs = false,
                attachmentsRefs = false,
                remindersRefs = false,
                appSettingsRefs = false,
                auditEntriesRefs = false,
                backupMetadataRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (membersRefs) db.members,
                    if (accountingMonthsRefs) db.accountingMonths,
                    if (mealEntriesRefs) db.mealEntries,
                    if (guestMealsRefs) db.guestMeals,
                    if (specialMealsRefs) db.specialMeals,
                    if (expenseCategoriesRefs) db.expenseCategories,
                    if (expensesRefs) db.expenses,
                    if (utilityBillsRefs) db.utilityBills,
                    if (depositsRefs) db.deposits,
                    if (memberAdjustmentsRefs) db.memberAdjustments,
                    if (settlementsRefs) db.settlements,
                    if (attachmentsRefs) db.attachments,
                    if (remindersRefs) db.reminders,
                    if (appSettingsRefs) db.appSettings,
                    if (auditEntriesRefs) db.auditEntries,
                    if (backupMetadataRefs) db.backupMetadata,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (membersRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          Member
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._membersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).membersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (accountingMonthsRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          AccountingMonth
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._accountingMonthsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).accountingMonthsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mealEntriesRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          MealEntry
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._mealEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).mealEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (guestMealsRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          GuestMeal
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._guestMealsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).guestMealsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (specialMealsRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          SpecialMeal
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._specialMealsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).specialMealsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (expenseCategoriesRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          ExpenseCategory
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._expenseCategoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).expenseCategoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (expensesRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          Expense
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._expensesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).expensesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (utilityBillsRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          UtilityBill
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._utilityBillsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).utilityBillsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (depositsRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          Deposit
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._depositsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).depositsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (memberAdjustmentsRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          MemberAdjustment
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._memberAdjustmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).memberAdjustmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (settlementsRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          Settlement
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._settlementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).settlementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (attachmentsRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          Attachment
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._attachmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).attachmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (remindersRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          Reminder
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._remindersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).remindersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (appSettingsRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          AppSetting
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._appSettingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).appSettingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (auditEntriesRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          AuditEntry
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._auditEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).auditEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (backupMetadataRefs)
                        await $_getPrefetchedData<
                          MessesData,
                          $MessesTable,
                          BackupMetadataData
                        >(
                          currentTable: table,
                          referencedTable: $$MessesTableReferences
                              ._backupMetadataRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MessesTableReferences(
                                db,
                                table,
                                p0,
                              ).backupMetadataRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.messId == item.id,
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

typedef $$MessesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MessesTable,
      MessesData,
      $$MessesTableFilterComposer,
      $$MessesTableOrderingComposer,
      $$MessesTableAnnotationComposer,
      $$MessesTableCreateCompanionBuilder,
      $$MessesTableUpdateCompanionBuilder,
      (MessesData, $$MessesTableReferences),
      MessesData,
      PrefetchHooks Function({
        bool membersRefs,
        bool accountingMonthsRefs,
        bool mealEntriesRefs,
        bool guestMealsRefs,
        bool specialMealsRefs,
        bool expenseCategoriesRefs,
        bool expensesRefs,
        bool utilityBillsRefs,
        bool depositsRefs,
        bool memberAdjustmentsRefs,
        bool settlementsRefs,
        bool attachmentsRefs,
        bool remindersRefs,
        bool appSettingsRefs,
        bool auditEntriesRefs,
        bool backupMetadataRefs,
      })
    >;
typedef $$MembersTableCreateCompanionBuilder = MembersCompanion Function({
  required String id,
  required String messId,
  required String name,
  Value<String?> nickname,
  Value<String?> phone,
  Value<String?> roomNumber,
  Value<String?> avatarPath,
  required DateTime joinDate,
  Value<DateTime?> leaveDate,
  Value<int> openingBalanceMinor,
  Value<String> status,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$MembersTableUpdateCompanionBuilder = MembersCompanion Function({
  Value<String> id,
  Value<String> messId,
  Value<String> name,
  Value<String?> nickname,
  Value<String?> phone,
  Value<String?> roomNumber,
  Value<String?> avatarPath,
  Value<DateTime> joinDate,
  Value<DateTime?> leaveDate,
  Value<int> openingBalanceMinor,
  Value<String> status,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$MembersTableReferences
    extends BaseReferences<_$AppDatabase, $MembersTable, Member> {
  $$MembersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('members__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MealEntriesTable, List<MealEntry>>
  _mealEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealEntries,
    aliasName: 'members__id__meal_entries__member_id',
  );

  $$MealEntriesTableProcessedTableManager get mealEntriesRefs {
    final manager = $$MealEntriesTableTableManager(
      $_db,
      $_db.mealEntries,
    ).filter((f) => f.memberId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GuestMealsTable, List<GuestMeal>>
  _guestMealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.guestMeals,
    aliasName: 'members__id__guest_meals__host_member_id',
  );

  $$GuestMealsTableProcessedTableManager get guestMealsRefs {
    final manager = $$GuestMealsTableTableManager(
      $_db,
      $_db.guestMeals,
    ).filter((f) => f.hostMemberId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_guestMealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SpecialMealMembersTable, List<SpecialMealMember>>
  _specialMealMembersRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.specialMealMembers,
        aliasName: 'members__id__special_meal_members__member_id',
      );

  $$SpecialMealMembersTableProcessedTableManager get specialMealMembersRefs {
    final manager = $$SpecialMealMembersTableTableManager(
      $_db,
      $_db.specialMealMembers,
    ).filter((f) => f.memberId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _specialMealMembersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.expenses,
    aliasName: 'members__id__expenses__paid_by_member_id',
  );

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager(
      $_db,
      $_db.expenses,
    ).filter((f) => f.paidByMemberId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UtilityBillsTable, List<UtilityBill>>
  _utilityBillsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.utilityBills,
    aliasName: 'members__id__utility_bills__paid_by_member_id',
  );

  $$UtilityBillsTableProcessedTableManager get utilityBillsRefs {
    final manager = $$UtilityBillsTableTableManager(
      $_db,
      $_db.utilityBills,
    ).filter((f) => f.paidByMemberId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_utilityBillsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $UtilityBillAllocationsTable,
    List<UtilityBillAllocation>
  >
  _utilityBillAllocationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.utilityBillAllocations,
        aliasName: 'members__id__utility_bill_allocations__member_id',
      );

  $$UtilityBillAllocationsTableProcessedTableManager
  get utilityBillAllocationsRefs {
    final manager = $$UtilityBillAllocationsTableTableManager(
      $_db,
      $_db.utilityBillAllocations,
    ).filter((f) => f.memberId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _utilityBillAllocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DepositsTable, List<Deposit>> _depositsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.deposits,
    aliasName: 'members__id__deposits__member_id',
  );

  $$DepositsTableProcessedTableManager get depositsRefs {
    final manager = $$DepositsTableTableManager(
      $_db,
      $_db.deposits,
    ).filter((f) => f.memberId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_depositsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MemberAdjustmentsTable, List<MemberAdjustment>>
  _memberAdjustmentsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.memberAdjustments,
        aliasName: 'members__id__member_adjustments__member_id',
      );

  $$MemberAdjustmentsTableProcessedTableManager get memberAdjustmentsRefs {
    final manager = $$MemberAdjustmentsTableTableManager(
      $_db,
      $_db.memberAdjustments,
    ).filter((f) => f.memberId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _memberAdjustmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MemberSettlementsTable, List<MemberSettlement>>
  _memberSettlementsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.memberSettlements,
        aliasName: 'members__id__member_settlements__member_id',
      );

  $$MemberSettlementsTableProcessedTableManager get memberSettlementsRefs {
    final manager = $$MemberSettlementsTableTableManager(
      $_db,
      $_db.memberSettlements,
    ).filter((f) => f.memberId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _memberSettlementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MembersTableFilterComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomNumber => $composableBuilder(
    column: $table.roomNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get joinDate => $composableBuilder(
    column: $table.joinDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get leaveDate => $composableBuilder(
    column: $table.leaveDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openingBalanceMinor => $composableBuilder(
    column: $table.openingBalanceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> mealEntriesRefs(
    Expression<bool> Function($$MealEntriesTableFilterComposer f) f,
  ) {
    final $$MealEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableFilterComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> guestMealsRefs(
    Expression<bool> Function($$GuestMealsTableFilterComposer f) f,
  ) {
    final $$GuestMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestMeals,
      getReferencedColumn: (t) => t.hostMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestMealsTableFilterComposer(
            $db: $db,
            $table: $db.guestMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> specialMealMembersRefs(
    Expression<bool> Function($$SpecialMealMembersTableFilterComposer f) f,
  ) {
    final $$SpecialMealMembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.specialMealMembers,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpecialMealMembersTableFilterComposer(
            $db: $db,
            $table: $db.specialMealMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> expensesRefs(
    Expression<bool> Function($$ExpensesTableFilterComposer f) f,
  ) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.paidByMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableFilterComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> utilityBillsRefs(
    Expression<bool> Function($$UtilityBillsTableFilterComposer f) f,
  ) {
    final $$UtilityBillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.paidByMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableFilterComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> utilityBillAllocationsRefs(
    Expression<bool> Function($$UtilityBillAllocationsTableFilterComposer f) f,
  ) {
    final $$UtilityBillAllocationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.utilityBillAllocations,
          getReferencedColumn: (t) => t.memberId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UtilityBillAllocationsTableFilterComposer(
                $db: $db,
                $table: $db.utilityBillAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> depositsRefs(
    Expression<bool> Function($$DepositsTableFilterComposer f) f,
  ) {
    final $$DepositsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.deposits,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepositsTableFilterComposer(
            $db: $db,
            $table: $db.deposits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> memberAdjustmentsRefs(
    Expression<bool> Function($$MemberAdjustmentsTableFilterComposer f) f,
  ) {
    final $$MemberAdjustmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.memberAdjustments,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemberAdjustmentsTableFilterComposer(
            $db: $db,
            $table: $db.memberAdjustments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> memberSettlementsRefs(
    Expression<bool> Function($$MemberSettlementsTableFilterComposer f) f,
  ) {
    final $$MemberSettlementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.memberSettlements,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemberSettlementsTableFilterComposer(
            $db: $db,
            $table: $db.memberSettlements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MembersTableOrderingComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomNumber => $composableBuilder(
    column: $table.roomNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get joinDate => $composableBuilder(
    column: $table.joinDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get leaveDate => $composableBuilder(
    column: $table.leaveDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openingBalanceMinor => $composableBuilder(
    column: $table.openingBalanceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $MembersTable> {
  $$MembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nickname =>
      $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get roomNumber => $composableBuilder(
    column: $table.roomNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get joinDate =>
      $composableBuilder(column: $table.joinDate, builder: (column) => column);

  GeneratedColumn<DateTime> get leaveDate =>
      $composableBuilder(column: $table.leaveDate, builder: (column) => column);

  GeneratedColumn<int> get openingBalanceMinor => $composableBuilder(
    column: $table.openingBalanceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> mealEntriesRefs<T extends Object>(
    Expression<T> Function($$MealEntriesTableAnnotationComposer a) f,
  ) {
    final $$MealEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> guestMealsRefs<T extends Object>(
    Expression<T> Function($$GuestMealsTableAnnotationComposer a) f,
  ) {
    final $$GuestMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestMeals,
      getReferencedColumn: (t) => t.hostMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.guestMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> specialMealMembersRefs<T extends Object>(
    Expression<T> Function($$SpecialMealMembersTableAnnotationComposer a) f,
  ) {
    final $$SpecialMealMembersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.specialMealMembers,
          getReferencedColumn: (t) => t.memberId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SpecialMealMembersTableAnnotationComposer(
                $db: $db,
                $table: $db.specialMealMembers,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> expensesRefs<T extends Object>(
    Expression<T> Function($$ExpensesTableAnnotationComposer a) f,
  ) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.paidByMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableAnnotationComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> utilityBillsRefs<T extends Object>(
    Expression<T> Function($$UtilityBillsTableAnnotationComposer a) f,
  ) {
    final $$UtilityBillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.paidByMemberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableAnnotationComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> utilityBillAllocationsRefs<T extends Object>(
    Expression<T> Function($$UtilityBillAllocationsTableAnnotationComposer a) f,
  ) {
    final $$UtilityBillAllocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.utilityBillAllocations,
          getReferencedColumn: (t) => t.memberId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UtilityBillAllocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.utilityBillAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> depositsRefs<T extends Object>(
    Expression<T> Function($$DepositsTableAnnotationComposer a) f,
  ) {
    final $$DepositsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.deposits,
      getReferencedColumn: (t) => t.memberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepositsTableAnnotationComposer(
            $db: $db,
            $table: $db.deposits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> memberAdjustmentsRefs<T extends Object>(
    Expression<T> Function($$MemberAdjustmentsTableAnnotationComposer a) f,
  ) {
    final $$MemberAdjustmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.memberAdjustments,
          getReferencedColumn: (t) => t.memberId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MemberAdjustmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.memberAdjustments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> memberSettlementsRefs<T extends Object>(
    Expression<T> Function($$MemberSettlementsTableAnnotationComposer a) f,
  ) {
    final $$MemberSettlementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.memberSettlements,
          getReferencedColumn: (t) => t.memberId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MemberSettlementsTableAnnotationComposer(
                $db: $db,
                $table: $db.memberSettlements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MembersTable,
          Member,
          $$MembersTableFilterComposer,
          $$MembersTableOrderingComposer,
          $$MembersTableAnnotationComposer,
          $$MembersTableCreateCompanionBuilder,
          $$MembersTableUpdateCompanionBuilder,
          (Member, $$MembersTableReferences),
          Member,
          PrefetchHooks Function({
            bool messId,
            bool mealEntriesRefs,
            bool guestMealsRefs,
            bool specialMealMembersRefs,
            bool expensesRefs,
            bool utilityBillsRefs,
            bool utilityBillAllocationsRefs,
            bool depositsRefs,
            bool memberAdjustmentsRefs,
            bool memberSettlementsRefs,
          })
        > {
  $$MembersTableTableManager(_$AppDatabase db, $MembersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> roomNumber = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                Value<DateTime> joinDate = const Value.absent(),
                Value<DateTime?> leaveDate = const Value.absent(),
                Value<int> openingBalanceMinor = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MembersCompanion(
                id: id,
                messId: messId,
                name: name,
                nickname: nickname,
                phone: phone,
                roomNumber: roomNumber,
                avatarPath: avatarPath,
                joinDate: joinDate,
                leaveDate: leaveDate,
                openingBalanceMinor: openingBalanceMinor,
                status: status,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String name,
                Value<String?> nickname = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> roomNumber = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                required DateTime joinDate,
                Value<DateTime?> leaveDate = const Value.absent(),
                Value<int> openingBalanceMinor = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MembersCompanion.insert(
                id: id,
                messId: messId,
                name: name,
                nickname: nickname,
                phone: phone,
                roomNumber: roomNumber,
                avatarPath: avatarPath,
                joinDate: joinDate,
                leaveDate: leaveDate,
                openingBalanceMinor: openingBalanceMinor,
                status: status,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MembersTable, Member>(table),
                  $$MembersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                messId = false,
                mealEntriesRefs = false,
                guestMealsRefs = false,
                specialMealMembersRefs = false,
                expensesRefs = false,
                utilityBillsRefs = false,
                utilityBillAllocationsRefs = false,
                depositsRefs = false,
                memberAdjustmentsRefs = false,
                memberSettlementsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (mealEntriesRefs) db.mealEntries,
                    if (guestMealsRefs) db.guestMeals,
                    if (specialMealMembersRefs) db.specialMealMembers,
                    if (expensesRefs) db.expenses,
                    if (utilityBillsRefs) db.utilityBills,
                    if (utilityBillAllocationsRefs) db.utilityBillAllocations,
                    if (depositsRefs) db.deposits,
                    if (memberAdjustmentsRefs) db.memberAdjustments,
                    if (memberSettlementsRefs) db.memberSettlements,
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$MembersTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$MembersTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (mealEntriesRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          MealEntry
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._mealEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).mealEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.memberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (guestMealsRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          GuestMeal
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._guestMealsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).guestMealsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.hostMemberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (specialMealMembersRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          SpecialMealMember
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._specialMealMembersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).specialMealMembersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.memberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (expensesRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          Expense
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._expensesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).expensesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.paidByMemberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (utilityBillsRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          UtilityBill
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._utilityBillsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).utilityBillsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.paidByMemberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (utilityBillAllocationsRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          UtilityBillAllocation
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._utilityBillAllocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).utilityBillAllocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.memberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (depositsRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          Deposit
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._depositsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).depositsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.memberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (memberAdjustmentsRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          MemberAdjustment
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._memberAdjustmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).memberAdjustmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.memberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (memberSettlementsRefs)
                        await $_getPrefetchedData<
                          Member,
                          $MembersTable,
                          MemberSettlement
                        >(
                          currentTable: table,
                          referencedTable: $$MembersTableReferences
                              ._memberSettlementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MembersTableReferences(
                                db,
                                table,
                                p0,
                              ).memberSettlementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.memberId == item.id,
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

typedef $$MembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MembersTable,
      Member,
      $$MembersTableFilterComposer,
      $$MembersTableOrderingComposer,
      $$MembersTableAnnotationComposer,
      $$MembersTableCreateCompanionBuilder,
      $$MembersTableUpdateCompanionBuilder,
      (Member, $$MembersTableReferences),
      Member,
      PrefetchHooks Function({
        bool messId,
        bool mealEntriesRefs,
        bool guestMealsRefs,
        bool specialMealMembersRefs,
        bool expensesRefs,
        bool utilityBillsRefs,
        bool utilityBillAllocationsRefs,
        bool depositsRefs,
        bool memberAdjustmentsRefs,
        bool memberSettlementsRefs,
      })
    >;
typedef $$AccountingMonthsTableCreateCompanionBuilder =
    AccountingMonthsCompanion Function({
      required String id,
      required String messId,
      required int year,
      required int month,
      required DateTime startDate,
      Value<DateTime?> endDate,
      Value<String> status,
      Value<int?> finalMealRateScaled,
      Value<DateTime?> closedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$AccountingMonthsTableUpdateCompanionBuilder =
    AccountingMonthsCompanion Function({
      Value<String> id,
      Value<String> messId,
      Value<int> year,
      Value<int> month,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<String> status,
      Value<int?> finalMealRateScaled,
      Value<DateTime?> closedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$AccountingMonthsTableReferences
    extends
        BaseReferences<_$AppDatabase, $AccountingMonthsTable, AccountingMonth> {
  $$AccountingMonthsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('accounting_months__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MealEntriesTable, List<MealEntry>>
  _mealEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mealEntries,
    aliasName: 'accounting_months__id__meal_entries__accounting_month_id',
  );

  $$MealEntriesTableProcessedTableManager get mealEntriesRefs {
    final manager = $$MealEntriesTableTableManager($_db, $_db.mealEntries)
        .filter(
          (f) => f.accountingMonthId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_mealEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GuestMealsTable, List<GuestMeal>>
  _guestMealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.guestMeals,
    aliasName: 'accounting_months__id__guest_meals__accounting_month_id',
  );

  $$GuestMealsTableProcessedTableManager get guestMealsRefs {
    final manager = $$GuestMealsTableTableManager($_db, $_db.guestMeals).filter(
      (f) => f.accountingMonthId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_guestMealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SpecialMealsTable, List<SpecialMeal>>
  _specialMealsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.specialMeals,
    aliasName: 'accounting_months__id__special_meals__accounting_month_id',
  );

  $$SpecialMealsTableProcessedTableManager get specialMealsRefs {
    final manager = $$SpecialMealsTableTableManager($_db, $_db.specialMeals)
        .filter(
          (f) => f.accountingMonthId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_specialMealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.expenses,
    aliasName: 'accounting_months__id__expenses__accounting_month_id',
  );

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager($_db, $_db.expenses).filter(
      (f) => f.accountingMonthId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UtilityBillsTable, List<UtilityBill>>
  _utilityBillsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.utilityBills,
    aliasName: 'accounting_months__id__utility_bills__accounting_month_id',
  );

  $$UtilityBillsTableProcessedTableManager get utilityBillsRefs {
    final manager = $$UtilityBillsTableTableManager($_db, $_db.utilityBills)
        .filter(
          (f) => f.accountingMonthId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_utilityBillsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DepositsTable, List<Deposit>> _depositsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.deposits,
    aliasName: 'accounting_months__id__deposits__accounting_month_id',
  );

  $$DepositsTableProcessedTableManager get depositsRefs {
    final manager = $$DepositsTableTableManager($_db, $_db.deposits).filter(
      (f) => f.accountingMonthId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_depositsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MemberAdjustmentsTable, List<MemberAdjustment>>
  _memberAdjustmentsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.memberAdjustments,
        aliasName:
            'accounting_months__id__member_adjustments__accounting_month_id',
      );

  $$MemberAdjustmentsTableProcessedTableManager get memberAdjustmentsRefs {
    final manager =
        $$MemberAdjustmentsTableTableManager(
          $_db,
          $_db.memberAdjustments,
        ).filter(
          (f) => f.accountingMonthId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _memberAdjustmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SettlementsTable, List<Settlement>>
  _settlementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.settlements,
    aliasName: 'accounting_months__id__settlements__accounting_month_id',
  );

  $$SettlementsTableProcessedTableManager get settlementsRefs {
    final manager = $$SettlementsTableTableManager($_db, $_db.settlements)
        .filter(
          (f) => f.accountingMonthId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_settlementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AccountingMonthsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountingMonthsTable> {
  $$AccountingMonthsTableFilterComposer({
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

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get finalMealRateScaled => $composableBuilder(
    column: $table.finalMealRateScaled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> mealEntriesRefs(
    Expression<bool> Function($$MealEntriesTableFilterComposer f) f,
  ) {
    final $$MealEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableFilterComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> guestMealsRefs(
    Expression<bool> Function($$GuestMealsTableFilterComposer f) f,
  ) {
    final $$GuestMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestMeals,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestMealsTableFilterComposer(
            $db: $db,
            $table: $db.guestMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> specialMealsRefs(
    Expression<bool> Function($$SpecialMealsTableFilterComposer f) f,
  ) {
    final $$SpecialMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.specialMeals,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpecialMealsTableFilterComposer(
            $db: $db,
            $table: $db.specialMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> expensesRefs(
    Expression<bool> Function($$ExpensesTableFilterComposer f) f,
  ) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableFilterComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> utilityBillsRefs(
    Expression<bool> Function($$UtilityBillsTableFilterComposer f) f,
  ) {
    final $$UtilityBillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableFilterComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> depositsRefs(
    Expression<bool> Function($$DepositsTableFilterComposer f) f,
  ) {
    final $$DepositsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.deposits,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepositsTableFilterComposer(
            $db: $db,
            $table: $db.deposits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> memberAdjustmentsRefs(
    Expression<bool> Function($$MemberAdjustmentsTableFilterComposer f) f,
  ) {
    final $$MemberAdjustmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.memberAdjustments,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemberAdjustmentsTableFilterComposer(
            $db: $db,
            $table: $db.memberAdjustments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> settlementsRefs(
    Expression<bool> Function($$SettlementsTableFilterComposer f) f,
  ) {
    final $$SettlementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.settlements,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SettlementsTableFilterComposer(
            $db: $db,
            $table: $db.settlements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AccountingMonthsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountingMonthsTable> {
  $$AccountingMonthsTableOrderingComposer({
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

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get finalMealRateScaled => $composableBuilder(
    column: $table.finalMealRateScaled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountingMonthsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountingMonthsTable> {
  $$AccountingMonthsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get finalMealRateScaled => $composableBuilder(
    column: $table.finalMealRateScaled,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get closedAt =>
      $composableBuilder(column: $table.closedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> mealEntriesRefs<T extends Object>(
    Expression<T> Function($$MealEntriesTableAnnotationComposer a) f,
  ) {
    final $$MealEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealEntries,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.mealEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> guestMealsRefs<T extends Object>(
    Expression<T> Function($$GuestMealsTableAnnotationComposer a) f,
  ) {
    final $$GuestMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestMeals,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.guestMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> specialMealsRefs<T extends Object>(
    Expression<T> Function($$SpecialMealsTableAnnotationComposer a) f,
  ) {
    final $$SpecialMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.specialMeals,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpecialMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.specialMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> expensesRefs<T extends Object>(
    Expression<T> Function($$ExpensesTableAnnotationComposer a) f,
  ) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableAnnotationComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> utilityBillsRefs<T extends Object>(
    Expression<T> Function($$UtilityBillsTableAnnotationComposer a) f,
  ) {
    final $$UtilityBillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableAnnotationComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> depositsRefs<T extends Object>(
    Expression<T> Function($$DepositsTableAnnotationComposer a) f,
  ) {
    final $$DepositsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.deposits,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepositsTableAnnotationComposer(
            $db: $db,
            $table: $db.deposits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> memberAdjustmentsRefs<T extends Object>(
    Expression<T> Function($$MemberAdjustmentsTableAnnotationComposer a) f,
  ) {
    final $$MemberAdjustmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.memberAdjustments,
          getReferencedColumn: (t) => t.accountingMonthId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MemberAdjustmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.memberAdjustments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> settlementsRefs<T extends Object>(
    Expression<T> Function($$SettlementsTableAnnotationComposer a) f,
  ) {
    final $$SettlementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.settlements,
      getReferencedColumn: (t) => t.accountingMonthId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SettlementsTableAnnotationComposer(
            $db: $db,
            $table: $db.settlements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AccountingMonthsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountingMonthsTable,
          AccountingMonth,
          $$AccountingMonthsTableFilterComposer,
          $$AccountingMonthsTableOrderingComposer,
          $$AccountingMonthsTableAnnotationComposer,
          $$AccountingMonthsTableCreateCompanionBuilder,
          $$AccountingMonthsTableUpdateCompanionBuilder,
          (AccountingMonth, $$AccountingMonthsTableReferences),
          AccountingMonth,
          PrefetchHooks Function({
            bool messId,
            bool mealEntriesRefs,
            bool guestMealsRefs,
            bool specialMealsRefs,
            bool expensesRefs,
            bool utilityBillsRefs,
            bool depositsRefs,
            bool memberAdjustmentsRefs,
            bool settlementsRefs,
          })
        > {
  $$AccountingMonthsTableTableManager(
    _$AppDatabase db,
    $AccountingMonthsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountingMonthsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountingMonthsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountingMonthsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<int> month = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> finalMealRateScaled = const Value.absent(),
                Value<DateTime?> closedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountingMonthsCompanion(
                id: id,
                messId: messId,
                year: year,
                month: month,
                startDate: startDate,
                endDate: endDate,
                status: status,
                finalMealRateScaled: finalMealRateScaled,
                closedAt: closedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required int year,
                required int month,
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> finalMealRateScaled = const Value.absent(),
                Value<DateTime?> closedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountingMonthsCompanion.insert(
                id: id,
                messId: messId,
                year: year,
                month: month,
                startDate: startDate,
                endDate: endDate,
                status: status,
                finalMealRateScaled: finalMealRateScaled,
                closedAt: closedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AccountingMonthsTable, AccountingMonth>(table),
                  $$AccountingMonthsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                messId = false,
                mealEntriesRefs = false,
                guestMealsRefs = false,
                specialMealsRefs = false,
                expensesRefs = false,
                utilityBillsRefs = false,
                depositsRefs = false,
                memberAdjustmentsRefs = false,
                settlementsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (mealEntriesRefs) db.mealEntries,
                    if (guestMealsRefs) db.guestMeals,
                    if (specialMealsRefs) db.specialMeals,
                    if (expensesRefs) db.expenses,
                    if (utilityBillsRefs) db.utilityBills,
                    if (depositsRefs) db.deposits,
                    if (memberAdjustmentsRefs) db.memberAdjustments,
                    if (settlementsRefs) db.settlements,
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$AccountingMonthsTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$AccountingMonthsTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (mealEntriesRefs)
                        await $_getPrefetchedData<
                          AccountingMonth,
                          $AccountingMonthsTable,
                          MealEntry
                        >(
                          currentTable: table,
                          referencedTable: $$AccountingMonthsTableReferences
                              ._mealEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountingMonthsTableReferences(
                                db,
                                table,
                                p0,
                              ).mealEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountingMonthId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (guestMealsRefs)
                        await $_getPrefetchedData<
                          AccountingMonth,
                          $AccountingMonthsTable,
                          GuestMeal
                        >(
                          currentTable: table,
                          referencedTable: $$AccountingMonthsTableReferences
                              ._guestMealsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountingMonthsTableReferences(
                                db,
                                table,
                                p0,
                              ).guestMealsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountingMonthId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (specialMealsRefs)
                        await $_getPrefetchedData<
                          AccountingMonth,
                          $AccountingMonthsTable,
                          SpecialMeal
                        >(
                          currentTable: table,
                          referencedTable: $$AccountingMonthsTableReferences
                              ._specialMealsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountingMonthsTableReferences(
                                db,
                                table,
                                p0,
                              ).specialMealsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountingMonthId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (expensesRefs)
                        await $_getPrefetchedData<
                          AccountingMonth,
                          $AccountingMonthsTable,
                          Expense
                        >(
                          currentTable: table,
                          referencedTable: $$AccountingMonthsTableReferences
                              ._expensesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountingMonthsTableReferences(
                                db,
                                table,
                                p0,
                              ).expensesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountingMonthId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (utilityBillsRefs)
                        await $_getPrefetchedData<
                          AccountingMonth,
                          $AccountingMonthsTable,
                          UtilityBill
                        >(
                          currentTable: table,
                          referencedTable: $$AccountingMonthsTableReferences
                              ._utilityBillsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountingMonthsTableReferences(
                                db,
                                table,
                                p0,
                              ).utilityBillsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountingMonthId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (depositsRefs)
                        await $_getPrefetchedData<
                          AccountingMonth,
                          $AccountingMonthsTable,
                          Deposit
                        >(
                          currentTable: table,
                          referencedTable: $$AccountingMonthsTableReferences
                              ._depositsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountingMonthsTableReferences(
                                db,
                                table,
                                p0,
                              ).depositsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountingMonthId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (memberAdjustmentsRefs)
                        await $_getPrefetchedData<
                          AccountingMonth,
                          $AccountingMonthsTable,
                          MemberAdjustment
                        >(
                          currentTable: table,
                          referencedTable: $$AccountingMonthsTableReferences
                              ._memberAdjustmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountingMonthsTableReferences(
                                db,
                                table,
                                p0,
                              ).memberAdjustmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountingMonthId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (settlementsRefs)
                        await $_getPrefetchedData<
                          AccountingMonth,
                          $AccountingMonthsTable,
                          Settlement
                        >(
                          currentTable: table,
                          referencedTable: $$AccountingMonthsTableReferences
                              ._settlementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AccountingMonthsTableReferences(
                                db,
                                table,
                                p0,
                              ).settlementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.accountingMonthId == item.id,
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

typedef $$AccountingMonthsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountingMonthsTable,
      AccountingMonth,
      $$AccountingMonthsTableFilterComposer,
      $$AccountingMonthsTableOrderingComposer,
      $$AccountingMonthsTableAnnotationComposer,
      $$AccountingMonthsTableCreateCompanionBuilder,
      $$AccountingMonthsTableUpdateCompanionBuilder,
      (AccountingMonth, $$AccountingMonthsTableReferences),
      AccountingMonth,
      PrefetchHooks Function({
        bool messId,
        bool mealEntriesRefs,
        bool guestMealsRefs,
        bool specialMealsRefs,
        bool expensesRefs,
        bool utilityBillsRefs,
        bool depositsRefs,
        bool memberAdjustmentsRefs,
        bool settlementsRefs,
      })
    >;
typedef $$MealEntriesTableCreateCompanionBuilder =
    MealEntriesCompanion Function({
      required String id,
      required String messId,
      required String accountingMonthId,
      required String memberId,
      required DateTime mealDate,
      Value<int> breakfastUnits,
      Value<int> lunchUnits,
      Value<int> dinnerUnits,
      Value<int> extraUnits,
      Value<int> totalUnits,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$MealEntriesTableUpdateCompanionBuilder =
    MealEntriesCompanion Function({
      Value<String> id,
      Value<String> messId,
      Value<String> accountingMonthId,
      Value<String> memberId,
      Value<DateTime> mealDate,
      Value<int> breakfastUnits,
      Value<int> lunchUnits,
      Value<int> dinnerUnits,
      Value<int> extraUnits,
      Value<int> totalUnits,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MealEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $MealEntriesTable, MealEntry> {
  $$MealEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('meal_entries__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountingMonthsTable _accountingMonthIdTable(_$AppDatabase db) => db
      .accountingMonths
      .createAlias('meal_entries__accounting_month_id__accounting_months__id');

  $$AccountingMonthsTableProcessedTableManager get accountingMonthId {
    final $_column = $_itemColumn<String>('accounting_month_id')!;

    final manager = $$AccountingMonthsTableTableManager(
      $_db,
      $_db.accountingMonths,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountingMonthIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MembersTable _memberIdTable(_$AppDatabase db) =>
      db.members.createAlias('meal_entries__member_id__members__id');

  $$MembersTableProcessedTableManager get memberId {
    final $_column = $_itemColumn<String>('member_id')!;

    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MealEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $MealEntriesTable> {
  $$MealEntriesTableFilterComposer({
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

  ColumnFilters<DateTime> get mealDate => $composableBuilder(
    column: $table.mealDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get breakfastUnits => $composableBuilder(
    column: $table.breakfastUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lunchUnits => $composableBuilder(
    column: $table.lunchUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dinnerUnits => $composableBuilder(
    column: $table.dinnerUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get extraUnits => $composableBuilder(
    column: $table.extraUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalUnits => $composableBuilder(
    column: $table.totalUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableFilterComposer get accountingMonthId {
    final $$AccountingMonthsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableFilterComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableFilterComposer get memberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MealEntriesTable> {
  $$MealEntriesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get mealDate => $composableBuilder(
    column: $table.mealDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get breakfastUnits => $composableBuilder(
    column: $table.breakfastUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lunchUnits => $composableBuilder(
    column: $table.lunchUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dinnerUnits => $composableBuilder(
    column: $table.dinnerUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get extraUnits => $composableBuilder(
    column: $table.extraUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalUnits => $composableBuilder(
    column: $table.totalUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableOrderingComposer get accountingMonthId {
    final $$AccountingMonthsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableOrderingComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableOrderingComposer get memberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealEntriesTable> {
  $$MealEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get mealDate =>
      $composableBuilder(column: $table.mealDate, builder: (column) => column);

  GeneratedColumn<int> get breakfastUnits => $composableBuilder(
    column: $table.breakfastUnits,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lunchUnits => $composableBuilder(
    column: $table.lunchUnits,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dinnerUnits => $composableBuilder(
    column: $table.dinnerUnits,
    builder: (column) => column,
  );

  GeneratedColumn<int> get extraUnits => $composableBuilder(
    column: $table.extraUnits,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalUnits => $composableBuilder(
    column: $table.totalUnits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableAnnotationComposer get accountingMonthId {
    final $$AccountingMonthsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableAnnotationComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableAnnotationComposer get memberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealEntriesTable,
          MealEntry,
          $$MealEntriesTableFilterComposer,
          $$MealEntriesTableOrderingComposer,
          $$MealEntriesTableAnnotationComposer,
          $$MealEntriesTableCreateCompanionBuilder,
          $$MealEntriesTableUpdateCompanionBuilder,
          (MealEntry, $$MealEntriesTableReferences),
          MealEntry,
          PrefetchHooks Function({
            bool messId,
            bool accountingMonthId,
            bool memberId,
          })
        > {
  $$MealEntriesTableTableManager(_$AppDatabase db, $MealEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> accountingMonthId = const Value.absent(),
                Value<String> memberId = const Value.absent(),
                Value<DateTime> mealDate = const Value.absent(),
                Value<int> breakfastUnits = const Value.absent(),
                Value<int> lunchUnits = const Value.absent(),
                Value<int> dinnerUnits = const Value.absent(),
                Value<int> extraUnits = const Value.absent(),
                Value<int> totalUnits = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealEntriesCompanion(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                memberId: memberId,
                mealDate: mealDate,
                breakfastUnits: breakfastUnits,
                lunchUnits: lunchUnits,
                dinnerUnits: dinnerUnits,
                extraUnits: extraUnits,
                totalUnits: totalUnits,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String accountingMonthId,
                required String memberId,
                required DateTime mealDate,
                Value<int> breakfastUnits = const Value.absent(),
                Value<int> lunchUnits = const Value.absent(),
                Value<int> dinnerUnits = const Value.absent(),
                Value<int> extraUnits = const Value.absent(),
                Value<int> totalUnits = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealEntriesCompanion.insert(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                memberId: memberId,
                mealDate: mealDate,
                breakfastUnits: breakfastUnits,
                lunchUnits: lunchUnits,
                dinnerUnits: dinnerUnits,
                extraUnits: extraUnits,
                totalUnits: totalUnits,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MealEntriesTable, MealEntry>(table),
                  $$MealEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({messId = false, accountingMonthId = false, memberId = false}) {
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$MealEntriesTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$MealEntriesTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (accountingMonthId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountingMonthId,
                            referencedTable: $$MealEntriesTableReferences
                                ._accountingMonthIdTable(db),
                            referencedColumn: $$MealEntriesTableReferences
                                ._accountingMonthIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (memberId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.memberId,
                            referencedTable: $$MealEntriesTableReferences
                                ._memberIdTable(db),
                            referencedColumn: $$MealEntriesTableReferences
                                ._memberIdTable(db)
                                .id,
                          ) as T;
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

typedef $$MealEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealEntriesTable,
      MealEntry,
      $$MealEntriesTableFilterComposer,
      $$MealEntriesTableOrderingComposer,
      $$MealEntriesTableAnnotationComposer,
      $$MealEntriesTableCreateCompanionBuilder,
      $$MealEntriesTableUpdateCompanionBuilder,
      (MealEntry, $$MealEntriesTableReferences),
      MealEntry,
      PrefetchHooks Function({
        bool messId,
        bool accountingMonthId,
        bool memberId,
      })
    >;
typedef $$GuestMealsTableCreateCompanionBuilder = GuestMealsCompanion Function({
  required String id,
  required String messId,
  required String accountingMonthId,
  required String hostMemberId,
  required DateTime mealDate,
  Value<String?> guestName,
  Value<int> guestCount,
  required int mealUnits,
  required String chargeMethod,
  Value<int> directChargeMinor,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$GuestMealsTableUpdateCompanionBuilder = GuestMealsCompanion Function({
  Value<String> id,
  Value<String> messId,
  Value<String> accountingMonthId,
  Value<String> hostMemberId,
  Value<DateTime> mealDate,
  Value<String?> guestName,
  Value<int> guestCount,
  Value<int> mealUnits,
  Value<String> chargeMethod,
  Value<int> directChargeMinor,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$GuestMealsTableReferences
    extends BaseReferences<_$AppDatabase, $GuestMealsTable, GuestMeal> {
  $$GuestMealsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('guest_meals__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountingMonthsTable _accountingMonthIdTable(_$AppDatabase db) => db
      .accountingMonths
      .createAlias('guest_meals__accounting_month_id__accounting_months__id');

  $$AccountingMonthsTableProcessedTableManager get accountingMonthId {
    final $_column = $_itemColumn<String>('accounting_month_id')!;

    final manager = $$AccountingMonthsTableTableManager(
      $_db,
      $_db.accountingMonths,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountingMonthIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MembersTable _hostMemberIdTable(_$AppDatabase db) =>
      db.members.createAlias('guest_meals__host_member_id__members__id');

  $$MembersTableProcessedTableManager get hostMemberId {
    final $_column = $_itemColumn<String>('host_member_id')!;

    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_hostMemberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GuestMealsTableFilterComposer
    extends Composer<_$AppDatabase, $GuestMealsTable> {
  $$GuestMealsTableFilterComposer({
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

  ColumnFilters<DateTime> get mealDate => $composableBuilder(
    column: $table.mealDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guestName => $composableBuilder(
    column: $table.guestName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get guestCount => $composableBuilder(
    column: $table.guestCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mealUnits => $composableBuilder(
    column: $table.mealUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chargeMethod => $composableBuilder(
    column: $table.chargeMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get directChargeMinor => $composableBuilder(
    column: $table.directChargeMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableFilterComposer get accountingMonthId {
    final $$AccountingMonthsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableFilterComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableFilterComposer get hostMemberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hostMemberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuestMealsTableOrderingComposer
    extends Composer<_$AppDatabase, $GuestMealsTable> {
  $$GuestMealsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get mealDate => $composableBuilder(
    column: $table.mealDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guestName => $composableBuilder(
    column: $table.guestName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get guestCount => $composableBuilder(
    column: $table.guestCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mealUnits => $composableBuilder(
    column: $table.mealUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chargeMethod => $composableBuilder(
    column: $table.chargeMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get directChargeMinor => $composableBuilder(
    column: $table.directChargeMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableOrderingComposer get accountingMonthId {
    final $$AccountingMonthsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableOrderingComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableOrderingComposer get hostMemberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hostMemberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuestMealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GuestMealsTable> {
  $$GuestMealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get mealDate =>
      $composableBuilder(column: $table.mealDate, builder: (column) => column);

  GeneratedColumn<String> get guestName =>
      $composableBuilder(column: $table.guestName, builder: (column) => column);

  GeneratedColumn<int> get guestCount => $composableBuilder(
    column: $table.guestCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mealUnits =>
      $composableBuilder(column: $table.mealUnits, builder: (column) => column);

  GeneratedColumn<String> get chargeMethod => $composableBuilder(
    column: $table.chargeMethod,
    builder: (column) => column,
  );

  GeneratedColumn<int> get directChargeMinor => $composableBuilder(
    column: $table.directChargeMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableAnnotationComposer get accountingMonthId {
    final $$AccountingMonthsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableAnnotationComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableAnnotationComposer get hostMemberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hostMemberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuestMealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GuestMealsTable,
          GuestMeal,
          $$GuestMealsTableFilterComposer,
          $$GuestMealsTableOrderingComposer,
          $$GuestMealsTableAnnotationComposer,
          $$GuestMealsTableCreateCompanionBuilder,
          $$GuestMealsTableUpdateCompanionBuilder,
          (GuestMeal, $$GuestMealsTableReferences),
          GuestMeal,
          PrefetchHooks Function({
            bool messId,
            bool accountingMonthId,
            bool hostMemberId,
          })
        > {
  $$GuestMealsTableTableManager(_$AppDatabase db, $GuestMealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuestMealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuestMealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GuestMealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> accountingMonthId = const Value.absent(),
                Value<String> hostMemberId = const Value.absent(),
                Value<DateTime> mealDate = const Value.absent(),
                Value<String?> guestName = const Value.absent(),
                Value<int> guestCount = const Value.absent(),
                Value<int> mealUnits = const Value.absent(),
                Value<String> chargeMethod = const Value.absent(),
                Value<int> directChargeMinor = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GuestMealsCompanion(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                hostMemberId: hostMemberId,
                mealDate: mealDate,
                guestName: guestName,
                guestCount: guestCount,
                mealUnits: mealUnits,
                chargeMethod: chargeMethod,
                directChargeMinor: directChargeMinor,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String accountingMonthId,
                required String hostMemberId,
                required DateTime mealDate,
                Value<String?> guestName = const Value.absent(),
                Value<int> guestCount = const Value.absent(),
                required int mealUnits,
                required String chargeMethod,
                Value<int> directChargeMinor = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GuestMealsCompanion.insert(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                hostMemberId: hostMemberId,
                mealDate: mealDate,
                guestName: guestName,
                guestCount: guestCount,
                mealUnits: mealUnits,
                chargeMethod: chargeMethod,
                directChargeMinor: directChargeMinor,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GuestMealsTable, GuestMeal>(table),
                  $$GuestMealsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                messId = false,
                accountingMonthId = false,
                hostMemberId = false,
              }) {
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$GuestMealsTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$GuestMealsTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (accountingMonthId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountingMonthId,
                            referencedTable: $$GuestMealsTableReferences
                                ._accountingMonthIdTable(db),
                            referencedColumn: $$GuestMealsTableReferences
                                ._accountingMonthIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (hostMemberId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.hostMemberId,
                            referencedTable: $$GuestMealsTableReferences
                                ._hostMemberIdTable(db),
                            referencedColumn: $$GuestMealsTableReferences
                                ._hostMemberIdTable(db)
                                .id,
                          ) as T;
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

typedef $$GuestMealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GuestMealsTable,
      GuestMeal,
      $$GuestMealsTableFilterComposer,
      $$GuestMealsTableOrderingComposer,
      $$GuestMealsTableAnnotationComposer,
      $$GuestMealsTableCreateCompanionBuilder,
      $$GuestMealsTableUpdateCompanionBuilder,
      (GuestMeal, $$GuestMealsTableReferences),
      GuestMeal,
      PrefetchHooks Function({
        bool messId,
        bool accountingMonthId,
        bool hostMemberId,
      })
    >;
typedef $$SpecialMealsTableCreateCompanionBuilder =
    SpecialMealsCompanion Function({
      required String id,
      required String messId,
      required String accountingMonthId,
      required DateTime date,
      required String title,
      required int totalCostMinor,
      required String distributionMethod,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$SpecialMealsTableUpdateCompanionBuilder =
    SpecialMealsCompanion Function({
      Value<String> id,
      Value<String> messId,
      Value<String> accountingMonthId,
      Value<DateTime> date,
      Value<String> title,
      Value<int> totalCostMinor,
      Value<String> distributionMethod,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SpecialMealsTableReferences
    extends BaseReferences<_$AppDatabase, $SpecialMealsTable, SpecialMeal> {
  $$SpecialMealsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('special_meals__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountingMonthsTable _accountingMonthIdTable(_$AppDatabase db) => db
      .accountingMonths
      .createAlias('special_meals__accounting_month_id__accounting_months__id');

  $$AccountingMonthsTableProcessedTableManager get accountingMonthId {
    final $_column = $_itemColumn<String>('accounting_month_id')!;

    final manager = $$AccountingMonthsTableTableManager(
      $_db,
      $_db.accountingMonths,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountingMonthIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SpecialMealMembersTable, List<SpecialMealMember>>
  _specialMealMembersRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.specialMealMembers,
        aliasName: 'special_meals__id__special_meal_members__special_meal_id',
      );

  $$SpecialMealMembersTableProcessedTableManager get specialMealMembersRefs {
    final manager = $$SpecialMealMembersTableTableManager(
      $_db,
      $_db.specialMealMembers,
    ).filter((f) => f.specialMealId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _specialMealMembersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SpecialMealsTableFilterComposer
    extends Composer<_$AppDatabase, $SpecialMealsTable> {
  $$SpecialMealsTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalCostMinor => $composableBuilder(
    column: $table.totalCostMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get distributionMethod => $composableBuilder(
    column: $table.distributionMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableFilterComposer get accountingMonthId {
    final $$AccountingMonthsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableFilterComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> specialMealMembersRefs(
    Expression<bool> Function($$SpecialMealMembersTableFilterComposer f) f,
  ) {
    final $$SpecialMealMembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.specialMealMembers,
      getReferencedColumn: (t) => t.specialMealId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpecialMealMembersTableFilterComposer(
            $db: $db,
            $table: $db.specialMealMembers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpecialMealsTableOrderingComposer
    extends Composer<_$AppDatabase, $SpecialMealsTable> {
  $$SpecialMealsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalCostMinor => $composableBuilder(
    column: $table.totalCostMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distributionMethod => $composableBuilder(
    column: $table.distributionMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableOrderingComposer get accountingMonthId {
    final $$AccountingMonthsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableOrderingComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpecialMealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpecialMealsTable> {
  $$SpecialMealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get totalCostMinor => $composableBuilder(
    column: $table.totalCostMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get distributionMethod => $composableBuilder(
    column: $table.distributionMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableAnnotationComposer get accountingMonthId {
    final $$AccountingMonthsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableAnnotationComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> specialMealMembersRefs<T extends Object>(
    Expression<T> Function($$SpecialMealMembersTableAnnotationComposer a) f,
  ) {
    final $$SpecialMealMembersTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.specialMealMembers,
          getReferencedColumn: (t) => t.specialMealId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SpecialMealMembersTableAnnotationComposer(
                $db: $db,
                $table: $db.specialMealMembers,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SpecialMealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpecialMealsTable,
          SpecialMeal,
          $$SpecialMealsTableFilterComposer,
          $$SpecialMealsTableOrderingComposer,
          $$SpecialMealsTableAnnotationComposer,
          $$SpecialMealsTableCreateCompanionBuilder,
          $$SpecialMealsTableUpdateCompanionBuilder,
          (SpecialMeal, $$SpecialMealsTableReferences),
          SpecialMeal,
          PrefetchHooks Function({
            bool messId,
            bool accountingMonthId,
            bool specialMealMembersRefs,
          })
        > {
  $$SpecialMealsTableTableManager(_$AppDatabase db, $SpecialMealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpecialMealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpecialMealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpecialMealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> accountingMonthId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> totalCostMinor = const Value.absent(),
                Value<String> distributionMethod = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpecialMealsCompanion(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                date: date,
                title: title,
                totalCostMinor: totalCostMinor,
                distributionMethod: distributionMethod,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String accountingMonthId,
                required DateTime date,
                required String title,
                required int totalCostMinor,
                required String distributionMethod,
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpecialMealsCompanion.insert(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                date: date,
                title: title,
                totalCostMinor: totalCostMinor,
                distributionMethod: distributionMethod,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SpecialMealsTable, SpecialMeal>(table),
                  $$SpecialMealsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                messId = false,
                accountingMonthId = false,
                specialMealMembersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (specialMealMembersRefs) db.specialMealMembers,
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$SpecialMealsTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$SpecialMealsTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (accountingMonthId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountingMonthId,
                            referencedTable: $$SpecialMealsTableReferences
                                ._accountingMonthIdTable(db),
                            referencedColumn: $$SpecialMealsTableReferences
                                ._accountingMonthIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (specialMealMembersRefs)
                        await $_getPrefetchedData<
                          SpecialMeal,
                          $SpecialMealsTable,
                          SpecialMealMember
                        >(
                          currentTable: table,
                          referencedTable: $$SpecialMealsTableReferences
                              ._specialMealMembersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SpecialMealsTableReferences(
                                db,
                                table,
                                p0,
                              ).specialMealMembersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.specialMealId == item.id,
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

typedef $$SpecialMealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpecialMealsTable,
      SpecialMeal,
      $$SpecialMealsTableFilterComposer,
      $$SpecialMealsTableOrderingComposer,
      $$SpecialMealsTableAnnotationComposer,
      $$SpecialMealsTableCreateCompanionBuilder,
      $$SpecialMealsTableUpdateCompanionBuilder,
      (SpecialMeal, $$SpecialMealsTableReferences),
      SpecialMeal,
      PrefetchHooks Function({
        bool messId,
        bool accountingMonthId,
        bool specialMealMembersRefs,
      })
    >;
typedef $$SpecialMealMembersTableCreateCompanionBuilder =
    SpecialMealMembersCompanion Function({
      required String id,
      required String specialMealId,
      required String memberId,
      required int shareAmountMinor,
      Value<int> rowid,
    });
typedef $$SpecialMealMembersTableUpdateCompanionBuilder =
    SpecialMealMembersCompanion Function({
      Value<String> id,
      Value<String> specialMealId,
      Value<String> memberId,
      Value<int> shareAmountMinor,
      Value<int> rowid,
    });

final class $$SpecialMealMembersTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SpecialMealMembersTable,
          SpecialMealMember
        > {
  $$SpecialMealMembersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SpecialMealsTable _specialMealIdTable(_$AppDatabase db) => db
      .specialMeals
      .createAlias('special_meal_members__special_meal_id__special_meals__id');

  $$SpecialMealsTableProcessedTableManager get specialMealId {
    final $_column = $_itemColumn<String>('special_meal_id')!;

    final manager = $$SpecialMealsTableTableManager(
      $_db,
      $_db.specialMeals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_specialMealIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MembersTable _memberIdTable(_$AppDatabase db) =>
      db.members.createAlias('special_meal_members__member_id__members__id');

  $$MembersTableProcessedTableManager get memberId {
    final $_column = $_itemColumn<String>('member_id')!;

    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SpecialMealMembersTableFilterComposer
    extends Composer<_$AppDatabase, $SpecialMealMembersTable> {
  $$SpecialMealMembersTableFilterComposer({
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

  ColumnFilters<int> get shareAmountMinor => $composableBuilder(
    column: $table.shareAmountMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$SpecialMealsTableFilterComposer get specialMealId {
    final $$SpecialMealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.specialMealId,
      referencedTable: $db.specialMeals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpecialMealsTableFilterComposer(
            $db: $db,
            $table: $db.specialMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableFilterComposer get memberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpecialMealMembersTableOrderingComposer
    extends Composer<_$AppDatabase, $SpecialMealMembersTable> {
  $$SpecialMealMembersTableOrderingComposer({
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

  ColumnOrderings<int> get shareAmountMinor => $composableBuilder(
    column: $table.shareAmountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$SpecialMealsTableOrderingComposer get specialMealId {
    final $$SpecialMealsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.specialMealId,
      referencedTable: $db.specialMeals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpecialMealsTableOrderingComposer(
            $db: $db,
            $table: $db.specialMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableOrderingComposer get memberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpecialMealMembersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpecialMealMembersTable> {
  $$SpecialMealMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get shareAmountMinor => $composableBuilder(
    column: $table.shareAmountMinor,
    builder: (column) => column,
  );

  $$SpecialMealsTableAnnotationComposer get specialMealId {
    final $$SpecialMealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.specialMealId,
      referencedTable: $db.specialMeals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpecialMealsTableAnnotationComposer(
            $db: $db,
            $table: $db.specialMeals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableAnnotationComposer get memberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpecialMealMembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpecialMealMembersTable,
          SpecialMealMember,
          $$SpecialMealMembersTableFilterComposer,
          $$SpecialMealMembersTableOrderingComposer,
          $$SpecialMealMembersTableAnnotationComposer,
          $$SpecialMealMembersTableCreateCompanionBuilder,
          $$SpecialMealMembersTableUpdateCompanionBuilder,
          (SpecialMealMember, $$SpecialMealMembersTableReferences),
          SpecialMealMember,
          PrefetchHooks Function({bool specialMealId, bool memberId})
        > {
  $$SpecialMealMembersTableTableManager(
    _$AppDatabase db,
    $SpecialMealMembersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpecialMealMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpecialMealMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpecialMealMembersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> specialMealId = const Value.absent(),
                Value<String> memberId = const Value.absent(),
                Value<int> shareAmountMinor = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpecialMealMembersCompanion(
                id: id,
                specialMealId: specialMealId,
                memberId: memberId,
                shareAmountMinor: shareAmountMinor,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String specialMealId,
                required String memberId,
                required int shareAmountMinor,
                Value<int> rowid = const Value.absent(),
              }) => SpecialMealMembersCompanion.insert(
                id: id,
                specialMealId: specialMealId,
                memberId: memberId,
                shareAmountMinor: shareAmountMinor,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SpecialMealMembersTable, SpecialMealMember>(
                    table,
                  ),
                  $$SpecialMealMembersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({specialMealId = false, memberId = false}) {
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
                    if (specialMealId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.specialMealId,
                        referencedTable: $$SpecialMealMembersTableReferences
                            ._specialMealIdTable(db),
                        referencedColumn: $$SpecialMealMembersTableReferences
                            ._specialMealIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (memberId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.memberId,
                        referencedTable: $$SpecialMealMembersTableReferences
                            ._memberIdTable(db),
                        referencedColumn: $$SpecialMealMembersTableReferences
                            ._memberIdTable(db)
                            .id,
                      ) as T;
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

typedef $$SpecialMealMembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpecialMealMembersTable,
      SpecialMealMember,
      $$SpecialMealMembersTableFilterComposer,
      $$SpecialMealMembersTableOrderingComposer,
      $$SpecialMealMembersTableAnnotationComposer,
      $$SpecialMealMembersTableCreateCompanionBuilder,
      $$SpecialMealMembersTableUpdateCompanionBuilder,
      (SpecialMealMember, $$SpecialMealMembersTableReferences),
      SpecialMealMember,
      PrefetchHooks Function({bool specialMealId, bool memberId})
    >;
typedef $$ExpenseCategoriesTableCreateCompanionBuilder =
    ExpenseCategoriesCompanion Function({
      required String id,
      required String messId,
      required String name,
      Value<String?> nameBn,
      required String type,
      Value<bool> isSystem,
      Value<bool> isActive,
      Value<int> sortOrder,
      Value<int> rowid,
    });
typedef $$ExpenseCategoriesTableUpdateCompanionBuilder =
    ExpenseCategoriesCompanion Function({
      Value<String> id,
      Value<String> messId,
      Value<String> name,
      Value<String?> nameBn,
      Value<String> type,
      Value<bool> isSystem,
      Value<bool> isActive,
      Value<int> sortOrder,
      Value<int> rowid,
    });

final class $$ExpenseCategoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExpenseCategoriesTable,
          ExpenseCategory
        > {
  $$ExpenseCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('expense_categories__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.expenses,
    aliasName: 'expense_categories__id__expenses__category_id',
  );

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager(
      $_db,
      $_db.expenses,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExpenseCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTable> {
  $$ExpenseCategoriesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameBn => $composableBuilder(
    column: $table.nameBn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> expensesRefs(
    Expression<bool> Function($$ExpensesTableFilterComposer f) f,
  ) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableFilterComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExpenseCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTable> {
  $$ExpenseCategoriesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameBn => $composableBuilder(
    column: $table.nameBn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpenseCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTable> {
  $$ExpenseCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameBn =>
      $composableBuilder(column: $table.nameBn, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isSystem =>
      $composableBuilder(column: $table.isSystem, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> expensesRefs<T extends Object>(
    Expression<T> Function($$ExpensesTableAnnotationComposer a) f,
  ) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expenses,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpensesTableAnnotationComposer(
            $db: $db,
            $table: $db.expenses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExpenseCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpenseCategoriesTable,
          ExpenseCategory,
          $$ExpenseCategoriesTableFilterComposer,
          $$ExpenseCategoriesTableOrderingComposer,
          $$ExpenseCategoriesTableAnnotationComposer,
          $$ExpenseCategoriesTableCreateCompanionBuilder,
          $$ExpenseCategoriesTableUpdateCompanionBuilder,
          (ExpenseCategory, $$ExpenseCategoriesTableReferences),
          ExpenseCategory,
          PrefetchHooks Function({bool messId, bool expensesRefs})
        > {
  $$ExpenseCategoriesTableTableManager(
    _$AppDatabase db,
    $ExpenseCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nameBn = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpenseCategoriesCompanion(
                id: id,
                messId: messId,
                name: name,
                nameBn: nameBn,
                type: type,
                isSystem: isSystem,
                isActive: isActive,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String name,
                Value<String?> nameBn = const Value.absent(),
                required String type,
                Value<bool> isSystem = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpenseCategoriesCompanion.insert(
                id: id,
                messId: messId,
                name: name,
                nameBn: nameBn,
                type: type,
                isSystem: isSystem,
                isActive: isActive,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExpenseCategoriesTable, ExpenseCategory>(table),
                  $$ExpenseCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({messId = false, expensesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (expensesRefs) db.expenses],
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
                    if (messId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.messId,
                        referencedTable: $$ExpenseCategoriesTableReferences
                            ._messIdTable(db),
                        referencedColumn: $$ExpenseCategoriesTableReferences
                            ._messIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expensesRefs)
                    await $_getPrefetchedData<
                      ExpenseCategory,
                      $ExpenseCategoriesTable,
                      Expense
                    >(
                      currentTable: table,
                      referencedTable: $$ExpenseCategoriesTableReferences
                          ._expensesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ExpenseCategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).expensesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ExpenseCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpenseCategoriesTable,
      ExpenseCategory,
      $$ExpenseCategoriesTableFilterComposer,
      $$ExpenseCategoriesTableOrderingComposer,
      $$ExpenseCategoriesTableAnnotationComposer,
      $$ExpenseCategoriesTableCreateCompanionBuilder,
      $$ExpenseCategoriesTableUpdateCompanionBuilder,
      (ExpenseCategory, $$ExpenseCategoriesTableReferences),
      ExpenseCategory,
      PrefetchHooks Function({bool messId, bool expensesRefs})
    >;
typedef $$ExpensesTableCreateCompanionBuilder = ExpensesCompanion Function({
  required String id,
  required String messId,
  required String accountingMonthId,
  required DateTime date,
  required String categoryId,
  required int amountMinor,
  Value<String?> description,
  Value<String?> vendor,
  Value<String?> paidByMemberId,
  Value<String?> paymentSource,
  Value<bool> affectsMealRate,
  Value<String?> distributionMethod,
  Value<String?> receiptPath,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$ExpensesTableUpdateCompanionBuilder = ExpensesCompanion Function({
  Value<String> id,
  Value<String> messId,
  Value<String> accountingMonthId,
  Value<DateTime> date,
  Value<String> categoryId,
  Value<int> amountMinor,
  Value<String?> description,
  Value<String?> vendor,
  Value<String?> paidByMemberId,
  Value<String?> paymentSource,
  Value<bool> affectsMealRate,
  Value<String?> distributionMethod,
  Value<String?> receiptPath,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$ExpensesTableReferences
    extends BaseReferences<_$AppDatabase, $ExpensesTable, Expense> {
  $$ExpensesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('expenses__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountingMonthsTable _accountingMonthIdTable(_$AppDatabase db) => db
      .accountingMonths
      .createAlias('expenses__accounting_month_id__accounting_months__id');

  $$AccountingMonthsTableProcessedTableManager get accountingMonthId {
    final $_column = $_itemColumn<String>('accounting_month_id')!;

    final manager = $$AccountingMonthsTableTableManager(
      $_db,
      $_db.accountingMonths,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountingMonthIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExpenseCategoriesTable _categoryIdTable(_$AppDatabase db) => db
      .expenseCategories
      .createAlias('expenses__category_id__expense_categories__id');

  $$ExpenseCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<String>('category_id')!;

    final manager = $$ExpenseCategoriesTableTableManager(
      $_db,
      $_db.expenseCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MembersTable _paidByMemberIdTable(_$AppDatabase db) =>
      db.members.createAlias('expenses__paid_by_member_id__members__id');

  $$MembersTableProcessedTableManager? get paidByMemberId {
    final $_column = $_itemColumn<String>('paid_by_member_id');
    if ($_column == null) return null;
    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paidByMemberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentSource => $composableBuilder(
    column: $table.paymentSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get affectsMealRate => $composableBuilder(
    column: $table.affectsMealRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get distributionMethod => $composableBuilder(
    column: $table.distributionMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptPath => $composableBuilder(
    column: $table.receiptPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableFilterComposer get accountingMonthId {
    final $$AccountingMonthsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableFilterComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExpenseCategoriesTableFilterComposer get categoryId {
    final $$ExpenseCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.expenseCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpenseCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.expenseCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableFilterComposer get paidByMemberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paidByMemberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentSource => $composableBuilder(
    column: $table.paymentSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get affectsMealRate => $composableBuilder(
    column: $table.affectsMealRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distributionMethod => $composableBuilder(
    column: $table.distributionMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptPath => $composableBuilder(
    column: $table.receiptPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableOrderingComposer get accountingMonthId {
    final $$AccountingMonthsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableOrderingComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExpenseCategoriesTableOrderingComposer get categoryId {
    final $$ExpenseCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.expenseCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpenseCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.expenseCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableOrderingComposer get paidByMemberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paidByMemberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get vendor =>
      $composableBuilder(column: $table.vendor, builder: (column) => column);

  GeneratedColumn<String> get paymentSource => $composableBuilder(
    column: $table.paymentSource,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get affectsMealRate => $composableBuilder(
    column: $table.affectsMealRate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get distributionMethod => $composableBuilder(
    column: $table.distributionMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receiptPath => $composableBuilder(
    column: $table.receiptPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableAnnotationComposer get accountingMonthId {
    final $$AccountingMonthsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableAnnotationComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExpenseCategoriesTableAnnotationComposer get categoryId {
    final $$ExpenseCategoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.expenseCategories,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExpenseCategoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.expenseCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$MembersTableAnnotationComposer get paidByMemberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paidByMemberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTable,
          Expense,
          $$ExpensesTableFilterComposer,
          $$ExpensesTableOrderingComposer,
          $$ExpensesTableAnnotationComposer,
          $$ExpensesTableCreateCompanionBuilder,
          $$ExpensesTableUpdateCompanionBuilder,
          (Expense, $$ExpensesTableReferences),
          Expense,
          PrefetchHooks Function({
            bool messId,
            bool accountingMonthId,
            bool categoryId,
            bool paidByMemberId,
          })
        > {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> accountingMonthId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> vendor = const Value.absent(),
                Value<String?> paidByMemberId = const Value.absent(),
                Value<String?> paymentSource = const Value.absent(),
                Value<bool> affectsMealRate = const Value.absent(),
                Value<String?> distributionMethod = const Value.absent(),
                Value<String?> receiptPath = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                date: date,
                categoryId: categoryId,
                amountMinor: amountMinor,
                description: description,
                vendor: vendor,
                paidByMemberId: paidByMemberId,
                paymentSource: paymentSource,
                affectsMealRate: affectsMealRate,
                distributionMethod: distributionMethod,
                receiptPath: receiptPath,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String accountingMonthId,
                required DateTime date,
                required String categoryId,
                required int amountMinor,
                Value<String?> description = const Value.absent(),
                Value<String?> vendor = const Value.absent(),
                Value<String?> paidByMemberId = const Value.absent(),
                Value<String?> paymentSource = const Value.absent(),
                Value<bool> affectsMealRate = const Value.absent(),
                Value<String?> distributionMethod = const Value.absent(),
                Value<String?> receiptPath = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion.insert(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                date: date,
                categoryId: categoryId,
                amountMinor: amountMinor,
                description: description,
                vendor: vendor,
                paidByMemberId: paidByMemberId,
                paymentSource: paymentSource,
                affectsMealRate: affectsMealRate,
                distributionMethod: distributionMethod,
                receiptPath: receiptPath,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExpensesTable, Expense>(table),
                  $$ExpensesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                messId = false,
                accountingMonthId = false,
                categoryId = false,
                paidByMemberId = false,
              }) {
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$ExpensesTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$ExpensesTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (accountingMonthId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountingMonthId,
                            referencedTable: $$ExpensesTableReferences
                                ._accountingMonthIdTable(db),
                            referencedColumn: $$ExpensesTableReferences
                                ._accountingMonthIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (categoryId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$ExpensesTableReferences
                                ._categoryIdTable(db),
                            referencedColumn: $$ExpensesTableReferences
                                ._categoryIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (paidByMemberId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.paidByMemberId,
                            referencedTable: $$ExpensesTableReferences
                                ._paidByMemberIdTable(db),
                            referencedColumn: $$ExpensesTableReferences
                                ._paidByMemberIdTable(db)
                                .id,
                          ) as T;
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

typedef $$ExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTable,
      Expense,
      $$ExpensesTableFilterComposer,
      $$ExpensesTableOrderingComposer,
      $$ExpensesTableAnnotationComposer,
      $$ExpensesTableCreateCompanionBuilder,
      $$ExpensesTableUpdateCompanionBuilder,
      (Expense, $$ExpensesTableReferences),
      Expense,
      PrefetchHooks Function({
        bool messId,
        bool accountingMonthId,
        bool categoryId,
        bool paidByMemberId,
      })
    >;
typedef $$UtilityBillsTableCreateCompanionBuilder =
    UtilityBillsCompanion Function({
      required String id,
      required String messId,
      required String accountingMonthId,
      required String billType,
      required int amountMinor,
      required DateTime billingMonth,
      Value<DateTime?> dueDate,
      Value<DateTime?> paidDate,
      Value<String> status,
      Value<String?> paidByMemberId,
      required String distributionMethod,
      Value<String?> receiptPath,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$UtilityBillsTableUpdateCompanionBuilder =
    UtilityBillsCompanion Function({
      Value<String> id,
      Value<String> messId,
      Value<String> accountingMonthId,
      Value<String> billType,
      Value<int> amountMinor,
      Value<DateTime> billingMonth,
      Value<DateTime?> dueDate,
      Value<DateTime?> paidDate,
      Value<String> status,
      Value<String?> paidByMemberId,
      Value<String> distributionMethod,
      Value<String?> receiptPath,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$UtilityBillsTableReferences
    extends BaseReferences<_$AppDatabase, $UtilityBillsTable, UtilityBill> {
  $$UtilityBillsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('utility_bills__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountingMonthsTable _accountingMonthIdTable(_$AppDatabase db) => db
      .accountingMonths
      .createAlias('utility_bills__accounting_month_id__accounting_months__id');

  $$AccountingMonthsTableProcessedTableManager get accountingMonthId {
    final $_column = $_itemColumn<String>('accounting_month_id')!;

    final manager = $$AccountingMonthsTableTableManager(
      $_db,
      $_db.accountingMonths,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountingMonthIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MembersTable _paidByMemberIdTable(_$AppDatabase db) =>
      db.members.createAlias('utility_bills__paid_by_member_id__members__id');

  $$MembersTableProcessedTableManager? get paidByMemberId {
    final $_column = $_itemColumn<String>('paid_by_member_id');
    if ($_column == null) return null;
    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paidByMemberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $UtilityBillAllocationsTable,
    List<UtilityBillAllocation>
  >
  _utilityBillAllocationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.utilityBillAllocations,
        aliasName:
            'utility_bills__id__utility_bill_allocations__utility_bill_id',
      );

  $$UtilityBillAllocationsTableProcessedTableManager
  get utilityBillAllocationsRefs {
    final manager = $$UtilityBillAllocationsTableTableManager(
      $_db,
      $_db.utilityBillAllocations,
    ).filter((f) => f.utilityBillId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _utilityBillAllocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UtilityBillsTableFilterComposer
    extends Composer<_$AppDatabase, $UtilityBillsTable> {
  $$UtilityBillsTableFilterComposer({
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

  ColumnFilters<String> get billType => $composableBuilder(
    column: $table.billType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get billingMonth => $composableBuilder(
    column: $table.billingMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paidDate => $composableBuilder(
    column: $table.paidDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get distributionMethod => $composableBuilder(
    column: $table.distributionMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptPath => $composableBuilder(
    column: $table.receiptPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableFilterComposer get accountingMonthId {
    final $$AccountingMonthsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableFilterComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableFilterComposer get paidByMemberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paidByMemberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> utilityBillAllocationsRefs(
    Expression<bool> Function($$UtilityBillAllocationsTableFilterComposer f) f,
  ) {
    final $$UtilityBillAllocationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.utilityBillAllocations,
          getReferencedColumn: (t) => t.utilityBillId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UtilityBillAllocationsTableFilterComposer(
                $db: $db,
                $table: $db.utilityBillAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UtilityBillsTableOrderingComposer
    extends Composer<_$AppDatabase, $UtilityBillsTable> {
  $$UtilityBillsTableOrderingComposer({
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

  ColumnOrderings<String> get billType => $composableBuilder(
    column: $table.billType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get billingMonth => $composableBuilder(
    column: $table.billingMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paidDate => $composableBuilder(
    column: $table.paidDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distributionMethod => $composableBuilder(
    column: $table.distributionMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptPath => $composableBuilder(
    column: $table.receiptPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableOrderingComposer get accountingMonthId {
    final $$AccountingMonthsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableOrderingComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableOrderingComposer get paidByMemberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paidByMemberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UtilityBillsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UtilityBillsTable> {
  $$UtilityBillsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get billType =>
      $composableBuilder(column: $table.billType, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get billingMonth => $composableBuilder(
    column: $table.billingMonth,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get paidDate =>
      $composableBuilder(column: $table.paidDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get distributionMethod => $composableBuilder(
    column: $table.distributionMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receiptPath => $composableBuilder(
    column: $table.receiptPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableAnnotationComposer get accountingMonthId {
    final $$AccountingMonthsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableAnnotationComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableAnnotationComposer get paidByMemberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paidByMemberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> utilityBillAllocationsRefs<T extends Object>(
    Expression<T> Function($$UtilityBillAllocationsTableAnnotationComposer a) f,
  ) {
    final $$UtilityBillAllocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.utilityBillAllocations,
          getReferencedColumn: (t) => t.utilityBillId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UtilityBillAllocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.utilityBillAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UtilityBillsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UtilityBillsTable,
          UtilityBill,
          $$UtilityBillsTableFilterComposer,
          $$UtilityBillsTableOrderingComposer,
          $$UtilityBillsTableAnnotationComposer,
          $$UtilityBillsTableCreateCompanionBuilder,
          $$UtilityBillsTableUpdateCompanionBuilder,
          (UtilityBill, $$UtilityBillsTableReferences),
          UtilityBill,
          PrefetchHooks Function({
            bool messId,
            bool accountingMonthId,
            bool paidByMemberId,
            bool utilityBillAllocationsRefs,
          })
        > {
  $$UtilityBillsTableTableManager(_$AppDatabase db, $UtilityBillsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UtilityBillsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UtilityBillsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UtilityBillsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> accountingMonthId = const Value.absent(),
                Value<String> billType = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<DateTime> billingMonth = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<DateTime?> paidDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> paidByMemberId = const Value.absent(),
                Value<String> distributionMethod = const Value.absent(),
                Value<String?> receiptPath = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UtilityBillsCompanion(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                billType: billType,
                amountMinor: amountMinor,
                billingMonth: billingMonth,
                dueDate: dueDate,
                paidDate: paidDate,
                status: status,
                paidByMemberId: paidByMemberId,
                distributionMethod: distributionMethod,
                receiptPath: receiptPath,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String accountingMonthId,
                required String billType,
                required int amountMinor,
                required DateTime billingMonth,
                Value<DateTime?> dueDate = const Value.absent(),
                Value<DateTime?> paidDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> paidByMemberId = const Value.absent(),
                required String distributionMethod,
                Value<String?> receiptPath = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UtilityBillsCompanion.insert(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                billType: billType,
                amountMinor: amountMinor,
                billingMonth: billingMonth,
                dueDate: dueDate,
                paidDate: paidDate,
                status: status,
                paidByMemberId: paidByMemberId,
                distributionMethod: distributionMethod,
                receiptPath: receiptPath,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UtilityBillsTable, UtilityBill>(table),
                  $$UtilityBillsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                messId = false,
                accountingMonthId = false,
                paidByMemberId = false,
                utilityBillAllocationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (utilityBillAllocationsRefs) db.utilityBillAllocations,
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$UtilityBillsTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$UtilityBillsTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (accountingMonthId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountingMonthId,
                            referencedTable: $$UtilityBillsTableReferences
                                ._accountingMonthIdTable(db),
                            referencedColumn: $$UtilityBillsTableReferences
                                ._accountingMonthIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (paidByMemberId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.paidByMemberId,
                            referencedTable: $$UtilityBillsTableReferences
                                ._paidByMemberIdTable(db),
                            referencedColumn: $$UtilityBillsTableReferences
                                ._paidByMemberIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (utilityBillAllocationsRefs)
                        await $_getPrefetchedData<
                          UtilityBill,
                          $UtilityBillsTable,
                          UtilityBillAllocation
                        >(
                          currentTable: table,
                          referencedTable: $$UtilityBillsTableReferences
                              ._utilityBillAllocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UtilityBillsTableReferences(
                                db,
                                table,
                                p0,
                              ).utilityBillAllocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.utilityBillId == item.id,
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

typedef $$UtilityBillsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UtilityBillsTable,
      UtilityBill,
      $$UtilityBillsTableFilterComposer,
      $$UtilityBillsTableOrderingComposer,
      $$UtilityBillsTableAnnotationComposer,
      $$UtilityBillsTableCreateCompanionBuilder,
      $$UtilityBillsTableUpdateCompanionBuilder,
      (UtilityBill, $$UtilityBillsTableReferences),
      UtilityBill,
      PrefetchHooks Function({
        bool messId,
        bool accountingMonthId,
        bool paidByMemberId,
        bool utilityBillAllocationsRefs,
      })
    >;
typedef $$UtilityBillAllocationsTableCreateCompanionBuilder =
    UtilityBillAllocationsCompanion Function({
      required String id,
      required String utilityBillId,
      required String memberId,
      required int amountMinor,
      Value<int> rowid,
    });
typedef $$UtilityBillAllocationsTableUpdateCompanionBuilder =
    UtilityBillAllocationsCompanion Function({
      Value<String> id,
      Value<String> utilityBillId,
      Value<String> memberId,
      Value<int> amountMinor,
      Value<int> rowid,
    });

final class $$UtilityBillAllocationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UtilityBillAllocationsTable,
          UtilityBillAllocation
        > {
  $$UtilityBillAllocationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UtilityBillsTable _utilityBillIdTable(_$AppDatabase db) =>
      db.utilityBills.createAlias(
        'utility_bill_allocations__utility_bill_id__utility_bills__id',
      );

  $$UtilityBillsTableProcessedTableManager get utilityBillId {
    final $_column = $_itemColumn<String>('utility_bill_id')!;

    final manager = $$UtilityBillsTableTableManager(
      $_db,
      $_db.utilityBills,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_utilityBillIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MembersTable _memberIdTable(_$AppDatabase db) => db.members
      .createAlias('utility_bill_allocations__member_id__members__id');

  $$MembersTableProcessedTableManager get memberId {
    final $_column = $_itemColumn<String>('member_id')!;

    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UtilityBillAllocationsTableFilterComposer
    extends Composer<_$AppDatabase, $UtilityBillAllocationsTable> {
  $$UtilityBillAllocationsTableFilterComposer({
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

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$UtilityBillsTableFilterComposer get utilityBillId {
    final $$UtilityBillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.utilityBillId,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableFilterComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableFilterComposer get memberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UtilityBillAllocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $UtilityBillAllocationsTable> {
  $$UtilityBillAllocationsTableOrderingComposer({
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

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$UtilityBillsTableOrderingComposer get utilityBillId {
    final $$UtilityBillsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.utilityBillId,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableOrderingComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableOrderingComposer get memberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UtilityBillAllocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UtilityBillAllocationsTable> {
  $$UtilityBillAllocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  $$UtilityBillsTableAnnotationComposer get utilityBillId {
    final $$UtilityBillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.utilityBillId,
      referencedTable: $db.utilityBills,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UtilityBillsTableAnnotationComposer(
            $db: $db,
            $table: $db.utilityBills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableAnnotationComposer get memberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UtilityBillAllocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UtilityBillAllocationsTable,
          UtilityBillAllocation,
          $$UtilityBillAllocationsTableFilterComposer,
          $$UtilityBillAllocationsTableOrderingComposer,
          $$UtilityBillAllocationsTableAnnotationComposer,
          $$UtilityBillAllocationsTableCreateCompanionBuilder,
          $$UtilityBillAllocationsTableUpdateCompanionBuilder,
          (UtilityBillAllocation, $$UtilityBillAllocationsTableReferences),
          UtilityBillAllocation,
          PrefetchHooks Function({bool utilityBillId, bool memberId})
        > {
  $$UtilityBillAllocationsTableTableManager(
    _$AppDatabase db,
    $UtilityBillAllocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UtilityBillAllocationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$UtilityBillAllocationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UtilityBillAllocationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> utilityBillId = const Value.absent(),
                Value<String> memberId = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UtilityBillAllocationsCompanion(
                id: id,
                utilityBillId: utilityBillId,
                memberId: memberId,
                amountMinor: amountMinor,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String utilityBillId,
                required String memberId,
                required int amountMinor,
                Value<int> rowid = const Value.absent(),
              }) => UtilityBillAllocationsCompanion.insert(
                id: id,
                utilityBillId: utilityBillId,
                memberId: memberId,
                amountMinor: amountMinor,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $UtilityBillAllocationsTable,
                    UtilityBillAllocation
                  >(table),
                  $$UtilityBillAllocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({utilityBillId = false, memberId = false}) {
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
                    if (utilityBillId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.utilityBillId,
                        referencedTable: $$UtilityBillAllocationsTableReferences
                            ._utilityBillIdTable(db),
                        referencedColumn:
                            $$UtilityBillAllocationsTableReferences
                                ._utilityBillIdTable(db)
                                .id,
                      ) as T;
                    }
                    if (memberId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.memberId,
                        referencedTable: $$UtilityBillAllocationsTableReferences
                            ._memberIdTable(db),
                        referencedColumn:
                            $$UtilityBillAllocationsTableReferences
                                ._memberIdTable(db)
                                .id,
                      ) as T;
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

typedef $$UtilityBillAllocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UtilityBillAllocationsTable,
      UtilityBillAllocation,
      $$UtilityBillAllocationsTableFilterComposer,
      $$UtilityBillAllocationsTableOrderingComposer,
      $$UtilityBillAllocationsTableAnnotationComposer,
      $$UtilityBillAllocationsTableCreateCompanionBuilder,
      $$UtilityBillAllocationsTableUpdateCompanionBuilder,
      (UtilityBillAllocation, $$UtilityBillAllocationsTableReferences),
      UtilityBillAllocation,
      PrefetchHooks Function({bool utilityBillId, bool memberId})
    >;
typedef $$DepositsTableCreateCompanionBuilder = DepositsCompanion Function({
  required String id,
  required String messId,
  required String accountingMonthId,
  required String memberId,
  required DateTime date,
  required int amountMinor,
  required String paymentMethod,
  Value<String?> reference,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$DepositsTableUpdateCompanionBuilder = DepositsCompanion Function({
  Value<String> id,
  Value<String> messId,
  Value<String> accountingMonthId,
  Value<String> memberId,
  Value<DateTime> date,
  Value<int> amountMinor,
  Value<String> paymentMethod,
  Value<String?> reference,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$DepositsTableReferences
    extends BaseReferences<_$AppDatabase, $DepositsTable, Deposit> {
  $$DepositsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('deposits__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountingMonthsTable _accountingMonthIdTable(_$AppDatabase db) => db
      .accountingMonths
      .createAlias('deposits__accounting_month_id__accounting_months__id');

  $$AccountingMonthsTableProcessedTableManager get accountingMonthId {
    final $_column = $_itemColumn<String>('accounting_month_id')!;

    final manager = $$AccountingMonthsTableTableManager(
      $_db,
      $_db.accountingMonths,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountingMonthIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MembersTable _memberIdTable(_$AppDatabase db) =>
      db.members.createAlias('deposits__member_id__members__id');

  $$MembersTableProcessedTableManager get memberId {
    final $_column = $_itemColumn<String>('member_id')!;

    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DepositsTableFilterComposer
    extends Composer<_$AppDatabase, $DepositsTable> {
  $$DepositsTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableFilterComposer get accountingMonthId {
    final $$AccountingMonthsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableFilterComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableFilterComposer get memberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DepositsTableOrderingComposer
    extends Composer<_$AppDatabase, $DepositsTable> {
  $$DepositsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableOrderingComposer get accountingMonthId {
    final $$AccountingMonthsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableOrderingComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableOrderingComposer get memberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DepositsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DepositsTable> {
  $$DepositsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableAnnotationComposer get accountingMonthId {
    final $$AccountingMonthsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableAnnotationComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableAnnotationComposer get memberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DepositsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DepositsTable,
          Deposit,
          $$DepositsTableFilterComposer,
          $$DepositsTableOrderingComposer,
          $$DepositsTableAnnotationComposer,
          $$DepositsTableCreateCompanionBuilder,
          $$DepositsTableUpdateCompanionBuilder,
          (Deposit, $$DepositsTableReferences),
          Deposit,
          PrefetchHooks Function({
            bool messId,
            bool accountingMonthId,
            bool memberId,
          })
        > {
  $$DepositsTableTableManager(_$AppDatabase db, $DepositsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DepositsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DepositsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DepositsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> accountingMonthId = const Value.absent(),
                Value<String> memberId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DepositsCompanion(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                memberId: memberId,
                date: date,
                amountMinor: amountMinor,
                paymentMethod: paymentMethod,
                reference: reference,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String accountingMonthId,
                required String memberId,
                required DateTime date,
                required int amountMinor,
                required String paymentMethod,
                Value<String?> reference = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DepositsCompanion.insert(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                memberId: memberId,
                date: date,
                amountMinor: amountMinor,
                paymentMethod: paymentMethod,
                reference: reference,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DepositsTable, Deposit>(table),
                  $$DepositsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({messId = false, accountingMonthId = false, memberId = false}) {
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$DepositsTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$DepositsTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (accountingMonthId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountingMonthId,
                            referencedTable: $$DepositsTableReferences
                                ._accountingMonthIdTable(db),
                            referencedColumn: $$DepositsTableReferences
                                ._accountingMonthIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (memberId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.memberId,
                            referencedTable: $$DepositsTableReferences
                                ._memberIdTable(db),
                            referencedColumn: $$DepositsTableReferences
                                ._memberIdTable(db)
                                .id,
                          ) as T;
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

typedef $$DepositsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DepositsTable,
      Deposit,
      $$DepositsTableFilterComposer,
      $$DepositsTableOrderingComposer,
      $$DepositsTableAnnotationComposer,
      $$DepositsTableCreateCompanionBuilder,
      $$DepositsTableUpdateCompanionBuilder,
      (Deposit, $$DepositsTableReferences),
      Deposit,
      PrefetchHooks Function({
        bool messId,
        bool accountingMonthId,
        bool memberId,
      })
    >;
typedef $$MemberAdjustmentsTableCreateCompanionBuilder =
    MemberAdjustmentsCompanion Function({
      required String id,
      required String messId,
      required String accountingMonthId,
      required String memberId,
      required DateTime date,
      required String type,
      required String direction,
      required int amountMinor,
      required String reason,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$MemberAdjustmentsTableUpdateCompanionBuilder =
    MemberAdjustmentsCompanion Function({
      Value<String> id,
      Value<String> messId,
      Value<String> accountingMonthId,
      Value<String> memberId,
      Value<DateTime> date,
      Value<String> type,
      Value<String> direction,
      Value<int> amountMinor,
      Value<String> reason,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MemberAdjustmentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MemberAdjustmentsTable,
          MemberAdjustment
        > {
  $$MemberAdjustmentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('member_adjustments__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountingMonthsTable _accountingMonthIdTable(_$AppDatabase db) =>
      db.accountingMonths.createAlias(
        'member_adjustments__accounting_month_id__accounting_months__id',
      );

  $$AccountingMonthsTableProcessedTableManager get accountingMonthId {
    final $_column = $_itemColumn<String>('accounting_month_id')!;

    final manager = $$AccountingMonthsTableTableManager(
      $_db,
      $_db.accountingMonths,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountingMonthIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MembersTable _memberIdTable(_$AppDatabase db) =>
      db.members.createAlias('member_adjustments__member_id__members__id');

  $$MembersTableProcessedTableManager get memberId {
    final $_column = $_itemColumn<String>('member_id')!;

    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MemberAdjustmentsTableFilterComposer
    extends Composer<_$AppDatabase, $MemberAdjustmentsTable> {
  $$MemberAdjustmentsTableFilterComposer({
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

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableFilterComposer get accountingMonthId {
    final $$AccountingMonthsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableFilterComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableFilterComposer get memberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MemberAdjustmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $MemberAdjustmentsTable> {
  $$MemberAdjustmentsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableOrderingComposer get accountingMonthId {
    final $$AccountingMonthsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableOrderingComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableOrderingComposer get memberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MemberAdjustmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemberAdjustmentsTable> {
  $$MemberAdjustmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableAnnotationComposer get accountingMonthId {
    final $$AccountingMonthsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableAnnotationComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableAnnotationComposer get memberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MemberAdjustmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MemberAdjustmentsTable,
          MemberAdjustment,
          $$MemberAdjustmentsTableFilterComposer,
          $$MemberAdjustmentsTableOrderingComposer,
          $$MemberAdjustmentsTableAnnotationComposer,
          $$MemberAdjustmentsTableCreateCompanionBuilder,
          $$MemberAdjustmentsTableUpdateCompanionBuilder,
          (MemberAdjustment, $$MemberAdjustmentsTableReferences),
          MemberAdjustment,
          PrefetchHooks Function({
            bool messId,
            bool accountingMonthId,
            bool memberId,
          })
        > {
  $$MemberAdjustmentsTableTableManager(
    _$AppDatabase db,
    $MemberAdjustmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemberAdjustmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemberAdjustmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemberAdjustmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> accountingMonthId = const Value.absent(),
                Value<String> memberId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> direction = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemberAdjustmentsCompanion(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                memberId: memberId,
                date: date,
                type: type,
                direction: direction,
                amountMinor: amountMinor,
                reason: reason,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String accountingMonthId,
                required String memberId,
                required DateTime date,
                required String type,
                required String direction,
                required int amountMinor,
                required String reason,
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemberAdjustmentsCompanion.insert(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                memberId: memberId,
                date: date,
                type: type,
                direction: direction,
                amountMinor: amountMinor,
                reason: reason,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MemberAdjustmentsTable, MemberAdjustment>(table),
                  $$MemberAdjustmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({messId = false, accountingMonthId = false, memberId = false}) {
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$MemberAdjustmentsTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$MemberAdjustmentsTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (accountingMonthId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountingMonthId,
                            referencedTable: $$MemberAdjustmentsTableReferences
                                ._accountingMonthIdTable(db),
                            referencedColumn: $$MemberAdjustmentsTableReferences
                                ._accountingMonthIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (memberId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.memberId,
                            referencedTable: $$MemberAdjustmentsTableReferences
                                ._memberIdTable(db),
                            referencedColumn: $$MemberAdjustmentsTableReferences
                                ._memberIdTable(db)
                                .id,
                          ) as T;
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

typedef $$MemberAdjustmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MemberAdjustmentsTable,
      MemberAdjustment,
      $$MemberAdjustmentsTableFilterComposer,
      $$MemberAdjustmentsTableOrderingComposer,
      $$MemberAdjustmentsTableAnnotationComposer,
      $$MemberAdjustmentsTableCreateCompanionBuilder,
      $$MemberAdjustmentsTableUpdateCompanionBuilder,
      (MemberAdjustment, $$MemberAdjustmentsTableReferences),
      MemberAdjustment,
      PrefetchHooks Function({
        bool messId,
        bool accountingMonthId,
        bool memberId,
      })
    >;
typedef $$SettlementsTableCreateCompanionBuilder =
    SettlementsCompanion Function({
      required String id,
      required String messId,
      required String accountingMonthId,
      required int totalMealUnits,
      required int totalMealExpenseMinor,
      required int mealRateScaled,
      required int totalSharedExpenseMinor,
      required int totalDepositMinor,
      Value<DateTime> createdAt,
      Value<DateTime?> closedAt,
      Value<int> rowid,
    });
typedef $$SettlementsTableUpdateCompanionBuilder =
    SettlementsCompanion Function({
      Value<String> id,
      Value<String> messId,
      Value<String> accountingMonthId,
      Value<int> totalMealUnits,
      Value<int> totalMealExpenseMinor,
      Value<int> mealRateScaled,
      Value<int> totalSharedExpenseMinor,
      Value<int> totalDepositMinor,
      Value<DateTime> createdAt,
      Value<DateTime?> closedAt,
      Value<int> rowid,
    });

final class $$SettlementsTableReferences
    extends BaseReferences<_$AppDatabase, $SettlementsTable, Settlement> {
  $$SettlementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('settlements__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AccountingMonthsTable _accountingMonthIdTable(_$AppDatabase db) => db
      .accountingMonths
      .createAlias('settlements__accounting_month_id__accounting_months__id');

  $$AccountingMonthsTableProcessedTableManager get accountingMonthId {
    final $_column = $_itemColumn<String>('accounting_month_id')!;

    final manager = $$AccountingMonthsTableTableManager(
      $_db,
      $_db.accountingMonths,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountingMonthIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MemberSettlementsTable, List<MemberSettlement>>
  _memberSettlementsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.memberSettlements,
        aliasName: 'settlements__id__member_settlements__settlement_id',
      );

  $$MemberSettlementsTableProcessedTableManager get memberSettlementsRefs {
    final manager = $$MemberSettlementsTableTableManager(
      $_db,
      $_db.memberSettlements,
    ).filter((f) => f.settlementId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _memberSettlementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SettlementsTableFilterComposer
    extends Composer<_$AppDatabase, $SettlementsTable> {
  $$SettlementsTableFilterComposer({
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

  ColumnFilters<int> get totalMealUnits => $composableBuilder(
    column: $table.totalMealUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalMealExpenseMinor => $composableBuilder(
    column: $table.totalMealExpenseMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mealRateScaled => $composableBuilder(
    column: $table.mealRateScaled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSharedExpenseMinor => $composableBuilder(
    column: $table.totalSharedExpenseMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalDepositMinor => $composableBuilder(
    column: $table.totalDepositMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableFilterComposer get accountingMonthId {
    final $$AccountingMonthsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableFilterComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> memberSettlementsRefs(
    Expression<bool> Function($$MemberSettlementsTableFilterComposer f) f,
  ) {
    final $$MemberSettlementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.memberSettlements,
      getReferencedColumn: (t) => t.settlementId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MemberSettlementsTableFilterComposer(
            $db: $db,
            $table: $db.memberSettlements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SettlementsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettlementsTable> {
  $$SettlementsTableOrderingComposer({
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

  ColumnOrderings<int> get totalMealUnits => $composableBuilder(
    column: $table.totalMealUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMealExpenseMinor => $composableBuilder(
    column: $table.totalMealExpenseMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mealRateScaled => $composableBuilder(
    column: $table.mealRateScaled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSharedExpenseMinor => $composableBuilder(
    column: $table.totalSharedExpenseMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalDepositMinor => $composableBuilder(
    column: $table.totalDepositMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableOrderingComposer get accountingMonthId {
    final $$AccountingMonthsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableOrderingComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SettlementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettlementsTable> {
  $$SettlementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get totalMealUnits => $composableBuilder(
    column: $table.totalMealUnits,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalMealExpenseMinor => $composableBuilder(
    column: $table.totalMealExpenseMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mealRateScaled => $composableBuilder(
    column: $table.mealRateScaled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSharedExpenseMinor => $composableBuilder(
    column: $table.totalSharedExpenseMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalDepositMinor => $composableBuilder(
    column: $table.totalDepositMinor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get closedAt =>
      $composableBuilder(column: $table.closedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AccountingMonthsTableAnnotationComposer get accountingMonthId {
    final $$AccountingMonthsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.accountingMonthId,
      referencedTable: $db.accountingMonths,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountingMonthsTableAnnotationComposer(
            $db: $db,
            $table: $db.accountingMonths,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> memberSettlementsRefs<T extends Object>(
    Expression<T> Function($$MemberSettlementsTableAnnotationComposer a) f,
  ) {
    final $$MemberSettlementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.memberSettlements,
          getReferencedColumn: (t) => t.settlementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MemberSettlementsTableAnnotationComposer(
                $db: $db,
                $table: $db.memberSettlements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SettlementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettlementsTable,
          Settlement,
          $$SettlementsTableFilterComposer,
          $$SettlementsTableOrderingComposer,
          $$SettlementsTableAnnotationComposer,
          $$SettlementsTableCreateCompanionBuilder,
          $$SettlementsTableUpdateCompanionBuilder,
          (Settlement, $$SettlementsTableReferences),
          Settlement,
          PrefetchHooks Function({
            bool messId,
            bool accountingMonthId,
            bool memberSettlementsRefs,
          })
        > {
  $$SettlementsTableTableManager(_$AppDatabase db, $SettlementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettlementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettlementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettlementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> accountingMonthId = const Value.absent(),
                Value<int> totalMealUnits = const Value.absent(),
                Value<int> totalMealExpenseMinor = const Value.absent(),
                Value<int> mealRateScaled = const Value.absent(),
                Value<int> totalSharedExpenseMinor = const Value.absent(),
                Value<int> totalDepositMinor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> closedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettlementsCompanion(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                totalMealUnits: totalMealUnits,
                totalMealExpenseMinor: totalMealExpenseMinor,
                mealRateScaled: mealRateScaled,
                totalSharedExpenseMinor: totalSharedExpenseMinor,
                totalDepositMinor: totalDepositMinor,
                createdAt: createdAt,
                closedAt: closedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String accountingMonthId,
                required int totalMealUnits,
                required int totalMealExpenseMinor,
                required int mealRateScaled,
                required int totalSharedExpenseMinor,
                required int totalDepositMinor,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> closedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettlementsCompanion.insert(
                id: id,
                messId: messId,
                accountingMonthId: accountingMonthId,
                totalMealUnits: totalMealUnits,
                totalMealExpenseMinor: totalMealExpenseMinor,
                mealRateScaled: mealRateScaled,
                totalSharedExpenseMinor: totalSharedExpenseMinor,
                totalDepositMinor: totalDepositMinor,
                createdAt: createdAt,
                closedAt: closedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettlementsTable, Settlement>(table),
                  $$SettlementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                messId = false,
                accountingMonthId = false,
                memberSettlementsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (memberSettlementsRefs) db.memberSettlements,
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
                        if (messId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.messId,
                            referencedTable: $$SettlementsTableReferences
                                ._messIdTable(db),
                            referencedColumn: $$SettlementsTableReferences
                                ._messIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (accountingMonthId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.accountingMonthId,
                            referencedTable: $$SettlementsTableReferences
                                ._accountingMonthIdTable(db),
                            referencedColumn: $$SettlementsTableReferences
                                ._accountingMonthIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (memberSettlementsRefs)
                        await $_getPrefetchedData<
                          Settlement,
                          $SettlementsTable,
                          MemberSettlement
                        >(
                          currentTable: table,
                          referencedTable: $$SettlementsTableReferences
                              ._memberSettlementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SettlementsTableReferences(
                                db,
                                table,
                                p0,
                              ).memberSettlementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.settlementId == item.id,
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

typedef $$SettlementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettlementsTable,
      Settlement,
      $$SettlementsTableFilterComposer,
      $$SettlementsTableOrderingComposer,
      $$SettlementsTableAnnotationComposer,
      $$SettlementsTableCreateCompanionBuilder,
      $$SettlementsTableUpdateCompanionBuilder,
      (Settlement, $$SettlementsTableReferences),
      Settlement,
      PrefetchHooks Function({
        bool messId,
        bool accountingMonthId,
        bool memberSettlementsRefs,
      })
    >;
typedef $$MemberSettlementsTableCreateCompanionBuilder =
    MemberSettlementsCompanion Function({
      required String id,
      required String settlementId,
      required String memberId,
      Value<int> mealUnits,
      Value<int> mealCostMinor,
      Value<int> guestChargeMinor,
      Value<int> specialMealChargeMinor,
      Value<int> utilityShareMinor,
      Value<int> sharedExpenseShareMinor,
      Value<int> adjustmentDebitMinor,
      Value<int> adjustmentCreditMinor,
      Value<int> previousBalanceMinor,
      Value<int> depositMinor,
      Value<int> memberPaidExpenseMinor,
      required int totalPayableMinor,
      required int totalCreditMinor,
      required int finalBalanceMinor,
      Value<int> rowid,
    });
typedef $$MemberSettlementsTableUpdateCompanionBuilder =
    MemberSettlementsCompanion Function({
      Value<String> id,
      Value<String> settlementId,
      Value<String> memberId,
      Value<int> mealUnits,
      Value<int> mealCostMinor,
      Value<int> guestChargeMinor,
      Value<int> specialMealChargeMinor,
      Value<int> utilityShareMinor,
      Value<int> sharedExpenseShareMinor,
      Value<int> adjustmentDebitMinor,
      Value<int> adjustmentCreditMinor,
      Value<int> previousBalanceMinor,
      Value<int> depositMinor,
      Value<int> memberPaidExpenseMinor,
      Value<int> totalPayableMinor,
      Value<int> totalCreditMinor,
      Value<int> finalBalanceMinor,
      Value<int> rowid,
    });

final class $$MemberSettlementsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MemberSettlementsTable,
          MemberSettlement
        > {
  $$MemberSettlementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SettlementsTable _settlementIdTable(_$AppDatabase db) => db
      .settlements
      .createAlias('member_settlements__settlement_id__settlements__id');

  $$SettlementsTableProcessedTableManager get settlementId {
    final $_column = $_itemColumn<String>('settlement_id')!;

    final manager = $$SettlementsTableTableManager(
      $_db,
      $_db.settlements,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_settlementIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MembersTable _memberIdTable(_$AppDatabase db) =>
      db.members.createAlias('member_settlements__member_id__members__id');

  $$MembersTableProcessedTableManager get memberId {
    final $_column = $_itemColumn<String>('member_id')!;

    final manager = $$MembersTableTableManager(
      $_db,
      $_db.members,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MemberSettlementsTableFilterComposer
    extends Composer<_$AppDatabase, $MemberSettlementsTable> {
  $$MemberSettlementsTableFilterComposer({
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

  ColumnFilters<int> get mealUnits => $composableBuilder(
    column: $table.mealUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mealCostMinor => $composableBuilder(
    column: $table.mealCostMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get guestChargeMinor => $composableBuilder(
    column: $table.guestChargeMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get specialMealChargeMinor => $composableBuilder(
    column: $table.specialMealChargeMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get utilityShareMinor => $composableBuilder(
    column: $table.utilityShareMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sharedExpenseShareMinor => $composableBuilder(
    column: $table.sharedExpenseShareMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get adjustmentDebitMinor => $composableBuilder(
    column: $table.adjustmentDebitMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get adjustmentCreditMinor => $composableBuilder(
    column: $table.adjustmentCreditMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get previousBalanceMinor => $composableBuilder(
    column: $table.previousBalanceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get depositMinor => $composableBuilder(
    column: $table.depositMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get memberPaidExpenseMinor => $composableBuilder(
    column: $table.memberPaidExpenseMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalPayableMinor => $composableBuilder(
    column: $table.totalPayableMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalCreditMinor => $composableBuilder(
    column: $table.totalCreditMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get finalBalanceMinor => $composableBuilder(
    column: $table.finalBalanceMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$SettlementsTableFilterComposer get settlementId {
    final $$SettlementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.settlementId,
      referencedTable: $db.settlements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SettlementsTableFilterComposer(
            $db: $db,
            $table: $db.settlements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableFilterComposer get memberId {
    final $$MembersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableFilterComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MemberSettlementsTableOrderingComposer
    extends Composer<_$AppDatabase, $MemberSettlementsTable> {
  $$MemberSettlementsTableOrderingComposer({
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

  ColumnOrderings<int> get mealUnits => $composableBuilder(
    column: $table.mealUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mealCostMinor => $composableBuilder(
    column: $table.mealCostMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get guestChargeMinor => $composableBuilder(
    column: $table.guestChargeMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get specialMealChargeMinor => $composableBuilder(
    column: $table.specialMealChargeMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get utilityShareMinor => $composableBuilder(
    column: $table.utilityShareMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sharedExpenseShareMinor => $composableBuilder(
    column: $table.sharedExpenseShareMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get adjustmentDebitMinor => $composableBuilder(
    column: $table.adjustmentDebitMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get adjustmentCreditMinor => $composableBuilder(
    column: $table.adjustmentCreditMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get previousBalanceMinor => $composableBuilder(
    column: $table.previousBalanceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get depositMinor => $composableBuilder(
    column: $table.depositMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get memberPaidExpenseMinor => $composableBuilder(
    column: $table.memberPaidExpenseMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalPayableMinor => $composableBuilder(
    column: $table.totalPayableMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalCreditMinor => $composableBuilder(
    column: $table.totalCreditMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get finalBalanceMinor => $composableBuilder(
    column: $table.finalBalanceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$SettlementsTableOrderingComposer get settlementId {
    final $$SettlementsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.settlementId,
      referencedTable: $db.settlements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SettlementsTableOrderingComposer(
            $db: $db,
            $table: $db.settlements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableOrderingComposer get memberId {
    final $$MembersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableOrderingComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MemberSettlementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemberSettlementsTable> {
  $$MemberSettlementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get mealUnits =>
      $composableBuilder(column: $table.mealUnits, builder: (column) => column);

  GeneratedColumn<int> get mealCostMinor => $composableBuilder(
    column: $table.mealCostMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get guestChargeMinor => $composableBuilder(
    column: $table.guestChargeMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get specialMealChargeMinor => $composableBuilder(
    column: $table.specialMealChargeMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get utilityShareMinor => $composableBuilder(
    column: $table.utilityShareMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sharedExpenseShareMinor => $composableBuilder(
    column: $table.sharedExpenseShareMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get adjustmentDebitMinor => $composableBuilder(
    column: $table.adjustmentDebitMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get adjustmentCreditMinor => $composableBuilder(
    column: $table.adjustmentCreditMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get previousBalanceMinor => $composableBuilder(
    column: $table.previousBalanceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get depositMinor => $composableBuilder(
    column: $table.depositMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get memberPaidExpenseMinor => $composableBuilder(
    column: $table.memberPaidExpenseMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalPayableMinor => $composableBuilder(
    column: $table.totalPayableMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalCreditMinor => $composableBuilder(
    column: $table.totalCreditMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get finalBalanceMinor => $composableBuilder(
    column: $table.finalBalanceMinor,
    builder: (column) => column,
  );

  $$SettlementsTableAnnotationComposer get settlementId {
    final $$SettlementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.settlementId,
      referencedTable: $db.settlements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SettlementsTableAnnotationComposer(
            $db: $db,
            $table: $db.settlements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MembersTableAnnotationComposer get memberId {
    final $$MembersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.memberId,
      referencedTable: $db.members,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MembersTableAnnotationComposer(
            $db: $db,
            $table: $db.members,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MemberSettlementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MemberSettlementsTable,
          MemberSettlement,
          $$MemberSettlementsTableFilterComposer,
          $$MemberSettlementsTableOrderingComposer,
          $$MemberSettlementsTableAnnotationComposer,
          $$MemberSettlementsTableCreateCompanionBuilder,
          $$MemberSettlementsTableUpdateCompanionBuilder,
          (MemberSettlement, $$MemberSettlementsTableReferences),
          MemberSettlement,
          PrefetchHooks Function({bool settlementId, bool memberId})
        > {
  $$MemberSettlementsTableTableManager(
    _$AppDatabase db,
    $MemberSettlementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemberSettlementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemberSettlementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemberSettlementsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> settlementId = const Value.absent(),
                Value<String> memberId = const Value.absent(),
                Value<int> mealUnits = const Value.absent(),
                Value<int> mealCostMinor = const Value.absent(),
                Value<int> guestChargeMinor = const Value.absent(),
                Value<int> specialMealChargeMinor = const Value.absent(),
                Value<int> utilityShareMinor = const Value.absent(),
                Value<int> sharedExpenseShareMinor = const Value.absent(),
                Value<int> adjustmentDebitMinor = const Value.absent(),
                Value<int> adjustmentCreditMinor = const Value.absent(),
                Value<int> previousBalanceMinor = const Value.absent(),
                Value<int> depositMinor = const Value.absent(),
                Value<int> memberPaidExpenseMinor = const Value.absent(),
                Value<int> totalPayableMinor = const Value.absent(),
                Value<int> totalCreditMinor = const Value.absent(),
                Value<int> finalBalanceMinor = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemberSettlementsCompanion(
                id: id,
                settlementId: settlementId,
                memberId: memberId,
                mealUnits: mealUnits,
                mealCostMinor: mealCostMinor,
                guestChargeMinor: guestChargeMinor,
                specialMealChargeMinor: specialMealChargeMinor,
                utilityShareMinor: utilityShareMinor,
                sharedExpenseShareMinor: sharedExpenseShareMinor,
                adjustmentDebitMinor: adjustmentDebitMinor,
                adjustmentCreditMinor: adjustmentCreditMinor,
                previousBalanceMinor: previousBalanceMinor,
                depositMinor: depositMinor,
                memberPaidExpenseMinor: memberPaidExpenseMinor,
                totalPayableMinor: totalPayableMinor,
                totalCreditMinor: totalCreditMinor,
                finalBalanceMinor: finalBalanceMinor,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String settlementId,
                required String memberId,
                Value<int> mealUnits = const Value.absent(),
                Value<int> mealCostMinor = const Value.absent(),
                Value<int> guestChargeMinor = const Value.absent(),
                Value<int> specialMealChargeMinor = const Value.absent(),
                Value<int> utilityShareMinor = const Value.absent(),
                Value<int> sharedExpenseShareMinor = const Value.absent(),
                Value<int> adjustmentDebitMinor = const Value.absent(),
                Value<int> adjustmentCreditMinor = const Value.absent(),
                Value<int> previousBalanceMinor = const Value.absent(),
                Value<int> depositMinor = const Value.absent(),
                Value<int> memberPaidExpenseMinor = const Value.absent(),
                required int totalPayableMinor,
                required int totalCreditMinor,
                required int finalBalanceMinor,
                Value<int> rowid = const Value.absent(),
              }) => MemberSettlementsCompanion.insert(
                id: id,
                settlementId: settlementId,
                memberId: memberId,
                mealUnits: mealUnits,
                mealCostMinor: mealCostMinor,
                guestChargeMinor: guestChargeMinor,
                specialMealChargeMinor: specialMealChargeMinor,
                utilityShareMinor: utilityShareMinor,
                sharedExpenseShareMinor: sharedExpenseShareMinor,
                adjustmentDebitMinor: adjustmentDebitMinor,
                adjustmentCreditMinor: adjustmentCreditMinor,
                previousBalanceMinor: previousBalanceMinor,
                depositMinor: depositMinor,
                memberPaidExpenseMinor: memberPaidExpenseMinor,
                totalPayableMinor: totalPayableMinor,
                totalCreditMinor: totalCreditMinor,
                finalBalanceMinor: finalBalanceMinor,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MemberSettlementsTable, MemberSettlement>(table),
                  $$MemberSettlementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({settlementId = false, memberId = false}) {
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
                    if (settlementId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.settlementId,
                        referencedTable: $$MemberSettlementsTableReferences
                            ._settlementIdTable(db),
                        referencedColumn: $$MemberSettlementsTableReferences
                            ._settlementIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (memberId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.memberId,
                        referencedTable: $$MemberSettlementsTableReferences
                            ._memberIdTable(db),
                        referencedColumn: $$MemberSettlementsTableReferences
                            ._memberIdTable(db)
                            .id,
                      ) as T;
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

typedef $$MemberSettlementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MemberSettlementsTable,
      MemberSettlement,
      $$MemberSettlementsTableFilterComposer,
      $$MemberSettlementsTableOrderingComposer,
      $$MemberSettlementsTableAnnotationComposer,
      $$MemberSettlementsTableCreateCompanionBuilder,
      $$MemberSettlementsTableUpdateCompanionBuilder,
      (MemberSettlement, $$MemberSettlementsTableReferences),
      MemberSettlement,
      PrefetchHooks Function({bool settlementId, bool memberId})
    >;
typedef $$AttachmentsTableCreateCompanionBuilder =
    AttachmentsCompanion Function({
      required String id,
      required String messId,
      required String entityType,
      required String entityId,
      required String relativePath,
      Value<String?> mimeType,
      Value<int> byteSize,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$AttachmentsTableUpdateCompanionBuilder =
    AttachmentsCompanion Function({
      Value<String> id,
      Value<String> messId,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> relativePath,
      Value<String?> mimeType,
      Value<int> byteSize,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$AttachmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AttachmentsTable, Attachment> {
  $$AttachmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('attachments__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer({
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

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer({
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

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<int> get byteSize =>
      $composableBuilder(column: $table.byteSize, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttachmentsTable,
          Attachment,
          $$AttachmentsTableFilterComposer,
          $$AttachmentsTableOrderingComposer,
          $$AttachmentsTableAnnotationComposer,
          $$AttachmentsTableCreateCompanionBuilder,
          $$AttachmentsTableUpdateCompanionBuilder,
          (Attachment, $$AttachmentsTableReferences),
          Attachment,
          PrefetchHooks Function({bool messId})
        > {
  $$AttachmentsTableTableManager(_$AppDatabase db, $AttachmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> relativePath = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<int> byteSize = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AttachmentsCompanion(
                id: id,
                messId: messId,
                entityType: entityType,
                entityId: entityId,
                relativePath: relativePath,
                mimeType: mimeType,
                byteSize: byteSize,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String entityType,
                required String entityId,
                required String relativePath,
                Value<String?> mimeType = const Value.absent(),
                Value<int> byteSize = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AttachmentsCompanion.insert(
                id: id,
                messId: messId,
                entityType: entityType,
                entityId: entityId,
                relativePath: relativePath,
                mimeType: mimeType,
                byteSize: byteSize,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AttachmentsTable, Attachment>(table),
                  $$AttachmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({messId = false}) {
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
                    if (messId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.messId,
                        referencedTable: $$AttachmentsTableReferences
                            ._messIdTable(db),
                        referencedColumn: $$AttachmentsTableReferences
                            ._messIdTable(db)
                            .id,
                      ) as T;
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

typedef $$AttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttachmentsTable,
      Attachment,
      $$AttachmentsTableFilterComposer,
      $$AttachmentsTableOrderingComposer,
      $$AttachmentsTableAnnotationComposer,
      $$AttachmentsTableCreateCompanionBuilder,
      $$AttachmentsTableUpdateCompanionBuilder,
      (Attachment, $$AttachmentsTableReferences),
      Attachment,
      PrefetchHooks Function({bool messId})
    >;
typedef $$RemindersTableCreateCompanionBuilder = RemindersCompanion Function({
  required String id,
  required String messId,
  required String type,
  Value<bool> isEnabled,
  required String scheduleJson,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$RemindersTableUpdateCompanionBuilder = RemindersCompanion Function({
  Value<String> id,
  Value<String> messId,
  Value<String> type,
  Value<bool> isEnabled,
  Value<String> scheduleJson,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$RemindersTableReferences
    extends BaseReferences<_$AppDatabase, $RemindersTable, Reminder> {
  $$RemindersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('reminders__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
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

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scheduleJson => $composableBuilder(
    column: $table.scheduleJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scheduleJson => $composableBuilder(
    column: $table.scheduleJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<String> get scheduleJson => $composableBuilder(
    column: $table.scheduleJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          Reminder,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (Reminder, $$RemindersTableReferences),
          Reminder,
          PrefetchHooks Function({bool messId})
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<String> scheduleJson = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                messId: messId,
                type: type,
                isEnabled: isEnabled,
                scheduleJson: scheduleJson,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String type,
                Value<bool> isEnabled = const Value.absent(),
                required String scheduleJson,
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                messId: messId,
                type: type,
                isEnabled: isEnabled,
                scheduleJson: scheduleJson,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RemindersTable, Reminder>(table),
                  $$RemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({messId = false}) {
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
                    if (messId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.messId,
                        referencedTable: $$RemindersTableReferences
                            ._messIdTable(db),
                        referencedColumn: $$RemindersTableReferences
                            ._messIdTable(db)
                            .id,
                      ) as T;
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

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      Reminder,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (Reminder, $$RemindersTableReferences),
      Reminder,
      PrefetchHooks Function({bool messId})
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String id,
      Value<String?> messId,
      required String settingKey,
      required String valueJson,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> id,
      Value<String?> messId,
      Value<String> settingKey,
      Value<String> valueJson,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$AppSettingsTableReferences
    extends BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting> {
  $$AppSettingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('app_settings__mess_id__messes__id');

  $$MessesTableProcessedTableManager? get messId {
    final $_column = $_itemColumn<String>('mess_id');
    if ($_column == null) return null;
    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
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

  ColumnFilters<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueJson => $composableBuilder(
    column: $table.valueJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
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

  ColumnOrderings<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueJson => $composableBuilder(
    column: $table.valueJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get valueJson =>
      $composableBuilder(column: $table.valueJson, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (AppSetting, $$AppSettingsTableReferences),
          AppSetting,
          PrefetchHooks Function({bool messId})
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> messId = const Value.absent(),
                Value<String> settingKey = const Value.absent(),
                Value<String> valueJson = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                id: id,
                messId: messId,
                settingKey: settingKey,
                valueJson: valueJson,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> messId = const Value.absent(),
                required String settingKey,
                required String valueJson,
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                id: id,
                messId: messId,
                settingKey: settingKey,
                valueJson: valueJson,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AppSettingsTable, AppSetting>(table),
                  $$AppSettingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({messId = false}) {
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
                    if (messId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.messId,
                        referencedTable: $$AppSettingsTableReferences
                            ._messIdTable(db),
                        referencedColumn: $$AppSettingsTableReferences
                            ._messIdTable(db)
                            .id,
                      ) as T;
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

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (AppSetting, $$AppSettingsTableReferences),
      AppSetting,
      PrefetchHooks Function({bool messId})
    >;
typedef $$AuditEntriesTableCreateCompanionBuilder =
    AuditEntriesCompanion Function({
      required String id,
      required String messId,
      required String entityType,
      required String entityId,
      required String action,
      Value<String?> oldValueJson,
      Value<String?> newValueJson,
      Value<DateTime> timestamp,
      Value<int> rowid,
    });
typedef $$AuditEntriesTableUpdateCompanionBuilder =
    AuditEntriesCompanion Function({
      Value<String> id,
      Value<String> messId,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> action,
      Value<String?> oldValueJson,
      Value<String?> newValueJson,
      Value<DateTime> timestamp,
      Value<int> rowid,
    });

final class $$AuditEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $AuditEntriesTable, AuditEntry> {
  $$AuditEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('audit_entries__mess_id__messes__id');

  $$MessesTableProcessedTableManager get messId {
    final $_column = $_itemColumn<String>('mess_id')!;

    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AuditEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $AuditEntriesTable> {
  $$AuditEntriesTableFilterComposer({
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

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get oldValueJson => $composableBuilder(
    column: $table.oldValueJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get newValueJson => $composableBuilder(
    column: $table.newValueJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditEntriesTable> {
  $$AuditEntriesTableOrderingComposer({
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

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oldValueJson => $composableBuilder(
    column: $table.oldValueJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newValueJson => $composableBuilder(
    column: $table.newValueJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditEntriesTable> {
  $$AuditEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get oldValueJson => $composableBuilder(
    column: $table.oldValueJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get newValueJson => $composableBuilder(
    column: $table.newValueJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditEntriesTable,
          AuditEntry,
          $$AuditEntriesTableFilterComposer,
          $$AuditEntriesTableOrderingComposer,
          $$AuditEntriesTableAnnotationComposer,
          $$AuditEntriesTableCreateCompanionBuilder,
          $$AuditEntriesTableUpdateCompanionBuilder,
          (AuditEntry, $$AuditEntriesTableReferences),
          AuditEntry,
          PrefetchHooks Function({bool messId})
        > {
  $$AuditEntriesTableTableManager(_$AppDatabase db, $AuditEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> messId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String?> oldValueJson = const Value.absent(),
                Value<String?> newValueJson = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuditEntriesCompanion(
                id: id,
                messId: messId,
                entityType: entityType,
                entityId: entityId,
                action: action,
                oldValueJson: oldValueJson,
                newValueJson: newValueJson,
                timestamp: timestamp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String messId,
                required String entityType,
                required String entityId,
                required String action,
                Value<String?> oldValueJson = const Value.absent(),
                Value<String?> newValueJson = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuditEntriesCompanion.insert(
                id: id,
                messId: messId,
                entityType: entityType,
                entityId: entityId,
                action: action,
                oldValueJson: oldValueJson,
                newValueJson: newValueJson,
                timestamp: timestamp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AuditEntriesTable, AuditEntry>(table),
                  $$AuditEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({messId = false}) {
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
                    if (messId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.messId,
                        referencedTable: $$AuditEntriesTableReferences
                            ._messIdTable(db),
                        referencedColumn: $$AuditEntriesTableReferences
                            ._messIdTable(db)
                            .id,
                      ) as T;
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

typedef $$AuditEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditEntriesTable,
      AuditEntry,
      $$AuditEntriesTableFilterComposer,
      $$AuditEntriesTableOrderingComposer,
      $$AuditEntriesTableAnnotationComposer,
      $$AuditEntriesTableCreateCompanionBuilder,
      $$AuditEntriesTableUpdateCompanionBuilder,
      (AuditEntry, $$AuditEntriesTableReferences),
      AuditEntry,
      PrefetchHooks Function({bool messId})
    >;
typedef $$BackupMetadataTableCreateCompanionBuilder =
    BackupMetadataCompanion Function({
      required String id,
      Value<String?> messId,
      required String fileName,
      required String relativePath,
      required int formatVersion,
      required int databaseVersion,
      Value<int> byteSize,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$BackupMetadataTableUpdateCompanionBuilder =
    BackupMetadataCompanion Function({
      Value<String> id,
      Value<String?> messId,
      Value<String> fileName,
      Value<String> relativePath,
      Value<int> formatVersion,
      Value<int> databaseVersion,
      Value<int> byteSize,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$BackupMetadataTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BackupMetadataTable,
          BackupMetadataData
        > {
  $$BackupMetadataTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MessesTable _messIdTable(_$AppDatabase db) =>
      db.messes.createAlias('backup_metadata__mess_id__messes__id');

  $$MessesTableProcessedTableManager? get messId {
    final $_column = $_itemColumn<String>('mess_id');
    if ($_column == null) return null;
    final manager = $$MessesTableTableManager(
      $_db,
      $_db.messes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BackupMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $BackupMetadataTable> {
  $$BackupMetadataTableFilterComposer({
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

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get formatVersion => $composableBuilder(
    column: $table.formatVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get databaseVersion => $composableBuilder(
    column: $table.databaseVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MessesTableFilterComposer get messId {
    final $$MessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableFilterComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BackupMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupMetadataTable> {
  $$BackupMetadataTableOrderingComposer({
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

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get formatVersion => $composableBuilder(
    column: $table.formatVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get databaseVersion => $composableBuilder(
    column: $table.databaseVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MessesTableOrderingComposer get messId {
    final $$MessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableOrderingComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BackupMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupMetadataTable> {
  $$BackupMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get formatVersion => $composableBuilder(
    column: $table.formatVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get databaseVersion => $composableBuilder(
    column: $table.databaseVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get byteSize =>
      $composableBuilder(column: $table.byteSize, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$MessesTableAnnotationComposer get messId {
    final $$MessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messId,
      referencedTable: $db.messes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessesTableAnnotationComposer(
            $db: $db,
            $table: $db.messes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BackupMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BackupMetadataTable,
          BackupMetadataData,
          $$BackupMetadataTableFilterComposer,
          $$BackupMetadataTableOrderingComposer,
          $$BackupMetadataTableAnnotationComposer,
          $$BackupMetadataTableCreateCompanionBuilder,
          $$BackupMetadataTableUpdateCompanionBuilder,
          (BackupMetadataData, $$BackupMetadataTableReferences),
          BackupMetadataData,
          PrefetchHooks Function({bool messId})
        > {
  $$BackupMetadataTableTableManager(
    _$AppDatabase db,
    $BackupMetadataTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BackupMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> messId = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> relativePath = const Value.absent(),
                Value<int> formatVersion = const Value.absent(),
                Value<int> databaseVersion = const Value.absent(),
                Value<int> byteSize = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BackupMetadataCompanion(
                id: id,
                messId: messId,
                fileName: fileName,
                relativePath: relativePath,
                formatVersion: formatVersion,
                databaseVersion: databaseVersion,
                byteSize: byteSize,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> messId = const Value.absent(),
                required String fileName,
                required String relativePath,
                required int formatVersion,
                required int databaseVersion,
                Value<int> byteSize = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BackupMetadataCompanion.insert(
                id: id,
                messId: messId,
                fileName: fileName,
                relativePath: relativePath,
                formatVersion: formatVersion,
                databaseVersion: databaseVersion,
                byteSize: byteSize,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BackupMetadataTable, BackupMetadataData>(table),
                  $$BackupMetadataTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({messId = false}) {
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
                    if (messId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.messId,
                        referencedTable: $$BackupMetadataTableReferences
                            ._messIdTable(db),
                        referencedColumn: $$BackupMetadataTableReferences
                            ._messIdTable(db)
                            .id,
                      ) as T;
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

typedef $$BackupMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BackupMetadataTable,
      BackupMetadataData,
      $$BackupMetadataTableFilterComposer,
      $$BackupMetadataTableOrderingComposer,
      $$BackupMetadataTableAnnotationComposer,
      $$BackupMetadataTableCreateCompanionBuilder,
      $$BackupMetadataTableUpdateCompanionBuilder,
      (BackupMetadataData, $$BackupMetadataTableReferences),
      BackupMetadataData,
      PrefetchHooks Function({bool messId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db, _db.messes);
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db, _db.members);
  $$AccountingMonthsTableTableManager get accountingMonths =>
      $$AccountingMonthsTableTableManager(_db, _db.accountingMonths);
  $$MealEntriesTableTableManager get mealEntries =>
      $$MealEntriesTableTableManager(_db, _db.mealEntries);
  $$GuestMealsTableTableManager get guestMeals =>
      $$GuestMealsTableTableManager(_db, _db.guestMeals);
  $$SpecialMealsTableTableManager get specialMeals =>
      $$SpecialMealsTableTableManager(_db, _db.specialMeals);
  $$SpecialMealMembersTableTableManager get specialMealMembers =>
      $$SpecialMealMembersTableTableManager(_db, _db.specialMealMembers);
  $$ExpenseCategoriesTableTableManager get expenseCategories =>
      $$ExpenseCategoriesTableTableManager(_db, _db.expenseCategories);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$UtilityBillsTableTableManager get utilityBills =>
      $$UtilityBillsTableTableManager(_db, _db.utilityBills);
  $$UtilityBillAllocationsTableTableManager get utilityBillAllocations =>
      $$UtilityBillAllocationsTableTableManager(
        _db,
        _db.utilityBillAllocations,
      );
  $$DepositsTableTableManager get deposits =>
      $$DepositsTableTableManager(_db, _db.deposits);
  $$MemberAdjustmentsTableTableManager get memberAdjustments =>
      $$MemberAdjustmentsTableTableManager(_db, _db.memberAdjustments);
  $$SettlementsTableTableManager get settlements =>
      $$SettlementsTableTableManager(_db, _db.settlements);
  $$MemberSettlementsTableTableManager get memberSettlements =>
      $$MemberSettlementsTableTableManager(_db, _db.memberSettlements);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$AuditEntriesTableTableManager get auditEntries =>
      $$AuditEntriesTableTableManager(_db, _db.auditEntries);
  $$BackupMetadataTableTableManager get backupMetadata =>
      $$BackupMetadataTableTableManager(_db, _db.backupMetadata);
}

mixin _$MessDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessesTable get messes => attachedDatabase.messes;
  MessDaoManager get managers => MessDaoManager(this);
}

class MessDaoManager {
  final _$MessDaoMixin _db;
  MessDaoManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db.attachedDatabase, _db.messes);
}

mixin _$MemberDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessesTable get messes => attachedDatabase.messes;
  $MembersTable get members => attachedDatabase.members;
  $AccountingMonthsTable get accountingMonths =>
      attachedDatabase.accountingMonths;
  $MealEntriesTable get mealEntries => attachedDatabase.mealEntries;
  $DepositsTable get deposits => attachedDatabase.deposits;
  $ExpenseCategoriesTable get expenseCategories =>
      attachedDatabase.expenseCategories;
  $ExpensesTable get expenses => attachedDatabase.expenses;
  $MemberAdjustmentsTable get memberAdjustments =>
      attachedDatabase.memberAdjustments;
  $SettlementsTable get settlements => attachedDatabase.settlements;
  $MemberSettlementsTable get memberSettlements =>
      attachedDatabase.memberSettlements;
  MemberDaoManager get managers => MemberDaoManager(this);
}

class MemberDaoManager {
  final _$MemberDaoMixin _db;
  MemberDaoManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db.attachedDatabase, _db.messes);
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db.attachedDatabase, _db.members);
  $$AccountingMonthsTableTableManager get accountingMonths =>
      $$AccountingMonthsTableTableManager(
        _db.attachedDatabase,
        _db.accountingMonths,
      );
  $$MealEntriesTableTableManager get mealEntries =>
      $$MealEntriesTableTableManager(_db.attachedDatabase, _db.mealEntries);
  $$DepositsTableTableManager get deposits =>
      $$DepositsTableTableManager(_db.attachedDatabase, _db.deposits);
  $$ExpenseCategoriesTableTableManager get expenseCategories =>
      $$ExpenseCategoriesTableTableManager(
        _db.attachedDatabase,
        _db.expenseCategories,
      );
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db.attachedDatabase, _db.expenses);
  $$MemberAdjustmentsTableTableManager get memberAdjustments =>
      $$MemberAdjustmentsTableTableManager(
        _db.attachedDatabase,
        _db.memberAdjustments,
      );
  $$SettlementsTableTableManager get settlements =>
      $$SettlementsTableTableManager(_db.attachedDatabase, _db.settlements);
  $$MemberSettlementsTableTableManager get memberSettlements =>
      $$MemberSettlementsTableTableManager(
        _db.attachedDatabase,
        _db.memberSettlements,
      );
}

mixin _$AccountingMonthDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessesTable get messes => attachedDatabase.messes;
  $AccountingMonthsTable get accountingMonths =>
      attachedDatabase.accountingMonths;
  AccountingMonthDaoManager get managers => AccountingMonthDaoManager(this);
}

class AccountingMonthDaoManager {
  final _$AccountingMonthDaoMixin _db;
  AccountingMonthDaoManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db.attachedDatabase, _db.messes);
  $$AccountingMonthsTableTableManager get accountingMonths =>
      $$AccountingMonthsTableTableManager(
        _db.attachedDatabase,
        _db.accountingMonths,
      );
}

mixin _$MealDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessesTable get messes => attachedDatabase.messes;
  $AccountingMonthsTable get accountingMonths =>
      attachedDatabase.accountingMonths;
  $MembersTable get members => attachedDatabase.members;
  $MealEntriesTable get mealEntries => attachedDatabase.mealEntries;
  $GuestMealsTable get guestMeals => attachedDatabase.guestMeals;
  $SpecialMealsTable get specialMeals => attachedDatabase.specialMeals;
  $SpecialMealMembersTable get specialMealMembers =>
      attachedDatabase.specialMealMembers;
  MealDaoManager get managers => MealDaoManager(this);
}

class MealDaoManager {
  final _$MealDaoMixin _db;
  MealDaoManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db.attachedDatabase, _db.messes);
  $$AccountingMonthsTableTableManager get accountingMonths =>
      $$AccountingMonthsTableTableManager(
        _db.attachedDatabase,
        _db.accountingMonths,
      );
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db.attachedDatabase, _db.members);
  $$MealEntriesTableTableManager get mealEntries =>
      $$MealEntriesTableTableManager(_db.attachedDatabase, _db.mealEntries);
  $$GuestMealsTableTableManager get guestMeals =>
      $$GuestMealsTableTableManager(_db.attachedDatabase, _db.guestMeals);
  $$SpecialMealsTableTableManager get specialMeals =>
      $$SpecialMealsTableTableManager(_db.attachedDatabase, _db.specialMeals);
  $$SpecialMealMembersTableTableManager get specialMealMembers =>
      $$SpecialMealMembersTableTableManager(
        _db.attachedDatabase,
        _db.specialMealMembers,
      );
}

mixin _$ExpenseDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessesTable get messes => attachedDatabase.messes;
  $ExpenseCategoriesTable get expenseCategories =>
      attachedDatabase.expenseCategories;
  $AccountingMonthsTable get accountingMonths =>
      attachedDatabase.accountingMonths;
  $MembersTable get members => attachedDatabase.members;
  $ExpensesTable get expenses => attachedDatabase.expenses;
  ExpenseDaoManager get managers => ExpenseDaoManager(this);
}

class ExpenseDaoManager {
  final _$ExpenseDaoMixin _db;
  ExpenseDaoManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db.attachedDatabase, _db.messes);
  $$ExpenseCategoriesTableTableManager get expenseCategories =>
      $$ExpenseCategoriesTableTableManager(
        _db.attachedDatabase,
        _db.expenseCategories,
      );
  $$AccountingMonthsTableTableManager get accountingMonths =>
      $$AccountingMonthsTableTableManager(
        _db.attachedDatabase,
        _db.accountingMonths,
      );
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db.attachedDatabase, _db.members);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db.attachedDatabase, _db.expenses);
}

mixin _$DepositDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessesTable get messes => attachedDatabase.messes;
  $AccountingMonthsTable get accountingMonths =>
      attachedDatabase.accountingMonths;
  $MembersTable get members => attachedDatabase.members;
  $DepositsTable get deposits => attachedDatabase.deposits;
  DepositDaoManager get managers => DepositDaoManager(this);
}

class DepositDaoManager {
  final _$DepositDaoMixin _db;
  DepositDaoManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db.attachedDatabase, _db.messes);
  $$AccountingMonthsTableTableManager get accountingMonths =>
      $$AccountingMonthsTableTableManager(
        _db.attachedDatabase,
        _db.accountingMonths,
      );
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db.attachedDatabase, _db.members);
  $$DepositsTableTableManager get deposits =>
      $$DepositsTableTableManager(_db.attachedDatabase, _db.deposits);
}

mixin _$UtilityDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessesTable get messes => attachedDatabase.messes;
  $AccountingMonthsTable get accountingMonths =>
      attachedDatabase.accountingMonths;
  $MembersTable get members => attachedDatabase.members;
  $UtilityBillsTable get utilityBills => attachedDatabase.utilityBills;
  $UtilityBillAllocationsTable get utilityBillAllocations =>
      attachedDatabase.utilityBillAllocations;
  UtilityDaoManager get managers => UtilityDaoManager(this);
}

class UtilityDaoManager {
  final _$UtilityDaoMixin _db;
  UtilityDaoManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db.attachedDatabase, _db.messes);
  $$AccountingMonthsTableTableManager get accountingMonths =>
      $$AccountingMonthsTableTableManager(
        _db.attachedDatabase,
        _db.accountingMonths,
      );
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db.attachedDatabase, _db.members);
  $$UtilityBillsTableTableManager get utilityBills =>
      $$UtilityBillsTableTableManager(_db.attachedDatabase, _db.utilityBills);
  $$UtilityBillAllocationsTableTableManager get utilityBillAllocations =>
      $$UtilityBillAllocationsTableTableManager(
        _db.attachedDatabase,
        _db.utilityBillAllocations,
      );
}

mixin _$SettlementDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessesTable get messes => attachedDatabase.messes;
  $AccountingMonthsTable get accountingMonths =>
      attachedDatabase.accountingMonths;
  $SettlementsTable get settlements => attachedDatabase.settlements;
  $MembersTable get members => attachedDatabase.members;
  $MemberSettlementsTable get memberSettlements =>
      attachedDatabase.memberSettlements;
  SettlementDaoManager get managers => SettlementDaoManager(this);
}

class SettlementDaoManager {
  final _$SettlementDaoMixin _db;
  SettlementDaoManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db.attachedDatabase, _db.messes);
  $$AccountingMonthsTableTableManager get accountingMonths =>
      $$AccountingMonthsTableTableManager(
        _db.attachedDatabase,
        _db.accountingMonths,
      );
  $$SettlementsTableTableManager get settlements =>
      $$SettlementsTableTableManager(_db.attachedDatabase, _db.settlements);
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db.attachedDatabase, _db.members);
  $$MemberSettlementsTableTableManager get memberSettlements =>
      $$MemberSettlementsTableTableManager(
        _db.attachedDatabase,
        _db.memberSettlements,
      );
}

mixin _$SettingsDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessesTable get messes => attachedDatabase.messes;
  $AppSettingsTable get appSettings => attachedDatabase.appSettings;
  $RemindersTable get reminders => attachedDatabase.reminders;
  $AttachmentsTable get attachments => attachedDatabase.attachments;
  $AuditEntriesTable get auditEntries => attachedDatabase.auditEntries;
  $BackupMetadataTable get backupMetadata => attachedDatabase.backupMetadata;
  SettingsDaoManager get managers => SettingsDaoManager(this);
}

class SettingsDaoManager {
  final _$SettingsDaoMixin _db;
  SettingsDaoManager(this._db);
  $$MessesTableTableManager get messes =>
      $$MessesTableTableManager(_db.attachedDatabase, _db.messes);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db.attachedDatabase, _db.appSettings);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db.attachedDatabase, _db.reminders);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db.attachedDatabase, _db.attachments);
  $$AuditEntriesTableTableManager get auditEntries =>
      $$AuditEntriesTableTableManager(_db.attachedDatabase, _db.auditEntries);
  $$BackupMetadataTableTableManager get backupMetadata =>
      $$BackupMetadataTableTableManager(
        _db.attachedDatabase,
        _db.backupMetadata,
      );
}
