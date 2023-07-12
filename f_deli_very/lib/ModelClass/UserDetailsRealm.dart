import 'package:realm/realm.dart';
part 'UserDetailsRealm.g.dart';
@RealmModel()
class _ModelUserDetailsRealm{

  late  String username;
  late  String email;
  late  String password;
}