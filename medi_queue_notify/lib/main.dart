import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_queue_notify/data/datasource/auth_remote_datasource.dart';
import 'package:medi_queue_notify/data/networks/auth_api_client.dart';
import 'package:medi_queue_notify/data/token_storage.dart';
import 'package:medi_queue_notify/features/auth/bloc/auth_bloc.dart';
import 'package:medi_queue_notify/features/auth/pages/login_page.dart';
import 'package:medi_queue_notify/features/auth/repository/auth_repository.dart';
import 'package:medi_queue_notify/pages/splash_page.dart';

void main() {
  final authApiClient = AuthApiClient(
    baseUrl: "http://192.168.1.37:8080/auth/v1/auth/login",
  );

  final authRemoteDataSource = AuthRemoteDataSource(authApiClient);

  final tokenStorage = TokenStorage();

  final authRepository = AuthRepository(
    remoteDataSource: authRemoteDataSource,
    storage: tokenStorage,
  );
  runApp(
    MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: authRepository)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(authRepository: authRepository),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashPage(),
    );
  }
}
