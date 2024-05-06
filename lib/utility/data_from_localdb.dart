import 'package:ca_junction/utility/constants.dart';
import 'package:hive/hive.dart';
import 'models.dart';

Future<User> getUserDataFromHive() async {
var hive = await Hive.openBox(userBox);
Map<String, dynamic>? userDataMap = hive.get(userDataKey);
return User.fromJson(userDataMap!);
}
