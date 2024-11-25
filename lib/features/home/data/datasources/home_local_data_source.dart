import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  const HomeLocalDataSourceImp(this.userBox);
  final Box<Map> userBox;
}
