abstract interface class Command<R, T> {
  R execute(T _);
}
