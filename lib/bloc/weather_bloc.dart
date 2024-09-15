import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

const api_key = '7f627efd71f44d08b782d3aeb7e18866';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(api_key, language: Language.ENGLISH);

        double latitude = event.position.latitude;
        double longitude = event.position.longitude;
        Weather weather =
            await wf.currentWeatherByLocation(latitude, longitude);
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}
