import 'package:cred_connect/core/constants/constants.dart';
import 'package:cred_connect/presentation/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Modular.get<UserController>()),
        ChangeNotifierProvider(create: (_) => Modular.get<LoanController>()),
        ChangeNotifierProvider(
          create: (_) => Modular.get<CustomerController>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Cred Connect',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
