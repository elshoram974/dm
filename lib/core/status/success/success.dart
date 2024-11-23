import '../status.dart';

class Success<T> extends Status<T> {
  final T data;
  const Success(this.data);
}
