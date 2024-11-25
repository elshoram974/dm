abstract class Status<T> {
  const Status();
}

class Loading extends Status {
  const Loading([this.loadingMore = false]);
  final bool loadingMore;
}
