part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await cacheInit();
  Future.wait([
    ///we call cache from main file and call init from slash app and redirection bloc
    _appLanguageInit(),
    _authInit(),
  ]);
}

Future<void> _appLanguageInit() async {
  sl.registerFactory(() => AppLanguageCubit(cacheHelper: sl()));
}

Future<void> _authInit() async {
  sl
    ..registerFactory(
        () => AuthenticatorBloc(cacheHelper: sl(), loginOrRegister: sl()))
    ..registerLazySingleton(() => LoginOrRegister(sl()))
    ..registerLazySingleton(() => VerifyOTP(sl()))
    ..registerLazySingleton(() => AddUserInfo(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSrc>(
        () => AuthRemoteDataSrcImpl(sl()))
    ..registerSingleton(Dio());
}

Future<void> cacheInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => CacheHelper(sl()))
    ..registerLazySingleton<SharedPreferences>(() => prefs);
}
