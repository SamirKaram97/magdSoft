import 'package:get_it/get_it.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/repository/data_repo.dart';
import 'package:magdsoft_flutter_structure/business_logic/usecase/get_help_usecase.dart';

import 'business_logic/repository/login_repo.dart';
import 'business_logic/usecase/login_usecase.dart';
import 'business_logic/usecase/otp_usecase.dart';
import 'data/data_providers/local/cache_helper.dart';
import 'data/data_providers/remote/dio_helper.dart';

final sl=GetIt.instance;

init()async
{
  await CacheHelper.init();
  await DioHelper.init();

  //Bloc
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => OtpBloc(sl()));
  sl.registerFactory(() => HelpBloc(sl()));


  //use cases
  //
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => OtpUseCase(sl()));
  sl.registerLazySingleton(() => GetHelpUseCase(sl()));


  //repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  sl.registerLazySingleton<DataRepository>(() => DataRepositoryImpl());


}