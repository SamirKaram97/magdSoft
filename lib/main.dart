import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/bloc_observer.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/events.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/events.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/theme.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import 'business_logic/home_bloc/bloc.dart';
import 'business_logic/login_bloc/bloc.dart';
import 'di.dart';

late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Bloc.observer = MyBlocObserver();
  final locale =
      CacheHelper.getDataFromSharedPreference(key: 'language') ?? "en";
  delegate = await LocalizationDelegate.create(
    fallbackLocale: locale,
    supportedLocales: ['ar', 'en'],
  );
  await delegate.changeLocale(Locale(locale));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = delegate.currentLocale.languageCode;

    delegate.onLocaleChanged = (Locale value) async {
      try {
        setState(() {
          Intl.defaultLocale = value.languageCode;
        });
      } catch (e) {
        showToast(text: e.toString(), state: ToastState.EROOR);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => GlobalCubit()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(sl()),
        ),
        BlocProvider(
          create: (context) => OtpBloc(sl()),
        ),
        BlocProvider(
          create: (context) => HelpBloc(sl())..add(HelpExecuteEvent()),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(sl())..add(GetProductsExecuteEvent())..getFav(),
        ),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LocalizedApp(
                delegate,
                LayoutBuilder(builder: (context, constraints) {
                  return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates: [
                        GlobalCupertinoLocalizations.delegate,
                        DefaultCupertinoLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        delegate,
                      ],
                      locale: delegate.currentLocale,
                      supportedLocales: delegate.supportedLocales,
                      onGenerateRoute: AppRouter.onGenerateRoute,
                      theme: getAppTheme(context));
                }),
              );
            },
          );
        },
      ),
    );
  }
}
