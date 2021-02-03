import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:in_store_flutter/models/models.dart';
import 'package:in_store_flutter/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on SocketException {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
