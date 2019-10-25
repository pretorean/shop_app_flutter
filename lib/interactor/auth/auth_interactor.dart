import 'package:rxdart/rxdart.dart';
import 'package:shop_app/interactor/session/session_changed_interactor.dart';

///Интерактор для авторизации
class AuthInteractor {
  final SessionChangedInteractor _sessionChangedInteractor;

  AuthInteractor(
    this._sessionChangedInteractor,
  );

  Observable<bool> get isAuthorized => Observable.just(true);

  ///логаут
  Observable<void> logOut() => Observable.just(true)
      .doOnDone(() => _sessionChangedInteractor.forceLogout());

  Observable<void> forceLogout() =>
      Observable.just(_sessionChangedInteractor.forceLogout());

  /// Авторизация.
  Observable<bool> auth() => Observable.just(true);

  /// Удаляет авторизационные данные пользователя
  Observable<void> cleanAuthData() => Observable.just(true);

  /// Регистрация
  Observable<void> registration(String userCode, String regCode) =>
      Observable.just(true);
}
