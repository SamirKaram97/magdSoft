import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/services/data_services.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/get_help_usecase.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/get_products_usecase.dart';
import 'package:magdsoft_flutter_structure/data/network/network_info.dart';
import 'business_logic/home_bloc/bloc.dart';
import 'business_logic/services/login_services.dart';
import 'business_logic/usecase/login_usecase.dart';
import 'business_logic/usecase/otp_usecase.dart';
import 'data/data_providers/local/cache_helper.dart';
import 'data/data_providers/remote/dio_helper.dart';

final sl=GetIt.instance;

init()async
{
  await CacheHelper.init();
  await DioHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //Bloc
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => OtpBloc(sl()));
  sl.registerFactory(() => HelpBloc(sl()));
  sl.registerFactory(() => ProductsBloc(sl()));


  //use cases
  //
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => OtpUseCase(sl()));
  sl.registerLazySingleton(() => GetHelpUseCase(sl()));
  sl.registerLazySingleton(() => GetProductUseCase(sl()));


  //repository
  sl.registerLazySingleton<AuthServices>(() => AuthServicesImpl());
  sl.registerLazySingleton<DataServices>(() => DataServicesImpl(sl()));




  //others
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));





}