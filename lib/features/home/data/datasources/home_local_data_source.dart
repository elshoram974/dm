import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  const HomeLocalDataSourceImp(this._userBox);
  final Box<Map> _userBox;

}
