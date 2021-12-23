import 'dart:math';

typedef Empty = Function();
typedef Loading = Function();
typedef Sucess<T> = Function(T data);
typedef Error = Function(String message, Exception? e);
typedef OrElse = Function();

abstract class AppState {
  dynamic when({
    Empty? empty,
    Loading? loading,
    Sucess? sucess,
    Error? error,
    required OrElse orElse,
  });

  static empty() => StateEmpty();
  static loading() => StateLoading();
  static sucess<T>(T data) => StateSucess(data);
  static error(String message, {Exception? e}) => StateError(message, e: e);
}

class StateEmpty extends AppState {
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Sucess? sucess,
      Error? error,
      required OrElse orElse}) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }
}

class StateLoading extends AppState {
  @override
  when(
      {Empty? empty,
      Loading? loading,
      Sucess? sucess,
      Error? error,
      required OrElse orElse}) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }
}

class StateSucess<T> extends AppState {
  final T data;
  StateSucess(this.data);

  @override
  when(
      {Empty? empty,
      Loading? loading,
      Sucess? sucess,
      Error? error,
      required OrElse orElse}) {
    if (sucess != null) {
      return sucess(data);
    }
    return orElse();
  }
}

class StateError extends AppState {
  final String message;
  final Exception? e;

  StateError(this.message, {this.e});

  @override
  when(
      {Empty? empty,
      Loading? loading,
      Sucess? sucess,
      Error? error,
      required OrElse orElse}) {
    if (error != null) {
      return error(message, e);
    }
  }
}
