import '../status.dart';
import 'failure_body.dart';

class Failure<T> extends Status<T> {
  final FailureBody failure;
  final T? data;
  const Failure(this.failure, [this.data]);

  Failure<T> copyWith({FailureBody? failure, String? error, T? data}) {
    return Failure(failure ?? this.failure, data ?? this.data);
  }
}
