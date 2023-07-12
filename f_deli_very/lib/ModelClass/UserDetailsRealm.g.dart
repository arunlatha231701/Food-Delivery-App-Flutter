// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDetailsRealm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ModelUserDetailsRealm extends _ModelUserDetailsRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  ModelUserDetailsRealm(
    String username,
    String email,
    String password,
  ) {
    RealmObjectBase.set(this, 'username', username);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'password', password);
  }

  ModelUserDetailsRealm._();

  @override
  String get username =>
      RealmObjectBase.get<String>(this, 'username') as String;
  @override
  set username(String value) => RealmObjectBase.set(this, 'username', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  Stream<RealmObjectChanges<ModelUserDetailsRealm>> get changes =>
      RealmObjectBase.getChanges<ModelUserDetailsRealm>(this);

  @override
  ModelUserDetailsRealm freeze() =>
      RealmObjectBase.freezeObject<ModelUserDetailsRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ModelUserDetailsRealm._);
    return const SchemaObject(ObjectType.realmObject, ModelUserDetailsRealm,
        'ModelUserDetailsRealm', [
      SchemaProperty('username', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
    ]);
  }
}
