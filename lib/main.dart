import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_store_flutter/bloc/bloc.dart';

import 'package:in_store_flutter/screens/screens.dart';

import 'repositories/repositories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => WeatherCubit(
              FakeWeatherRepository(),
            ),
          ),
          BlocProvider(
            create: (BuildContext context) => ProductCubit(),
          )
        ],
        child: HomeScreen(),
      ),
    );
  }
}
