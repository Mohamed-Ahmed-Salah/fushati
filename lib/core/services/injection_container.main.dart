part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await cacheInit();
  Future.wait([
    ///we call cache from main file and call init from slash app and redirection bloc
    _appLanguageInit(),
    _authInit(),
    _cardsInit(),
    _moyasarInit(),
    _userInfo(),
    _transactions(),
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

Future<void> _cardsInit() async {
  sl
    ..registerLazySingleton(() => DeleteCard(sl()))
    ..registerLazySingleton(() => AddCard(sl()))
    ..registerLazySingleton(() => GetCardDetails(sl()))
    ..registerLazySingleton(() => GetCards(sl()))
    ..registerLazySingleton<CardRepo>(() => CardRepoImpl(sl()))
    ..registerLazySingleton<CardRemoteDataSrc>(
        () => CardRemoteDataSrcImpl(sl()));
}

Future<void> _moyasarInit() async {
  sl
    ..registerLazySingleton(() => TransferAmount(sl()))
    ..registerLazySingleton<DepositRepo>(() => DepositRepoImpl(sl()))
    ..registerLazySingleton<DepositRemoteDataSrc>(
        () => DepositRemoteDataSrcImpl(sl()));
}

Future<void> cacheInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => CacheHelper(sl()))
    ..registerLazySingleton<SharedPreferences>(() => prefs);
}

Future<void> _userInfo() async {
  sl
    ..registerLazySingleton(() => DeleteUserInfo(sl()))
    ..registerLazySingleton(() => EditUserInfo(sl()))
    ..registerLazySingleton(() => GetUserInfo(sl()))
    ..registerLazySingleton<UserInfoRepo>(() => UserInfoRepoImpl(sl()))
    ..registerLazySingleton<UserInfoRemoteDataSrc>(
        () => UserInfoRemoteDataSrcImpl(sl()));
}

Future<void> _transactions() async {
  sl

    ..registerLazySingleton(() => GetCardTransactions(sl()))
    ..registerLazySingleton(() => GetUserTransactions(sl()))
    // ..registerLazySingleton(() => AddUserInfo(sl()))
    ..registerLazySingleton<TransactionsRepo>(() => TransactionsRepoImpl(sl()))
    ..registerLazySingleton<TransactionsRemoteDataSrc>(
        () => TransactionsRemoteDataSrcImpl(sl()));
}
