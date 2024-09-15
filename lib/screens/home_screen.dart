import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sunsnap/bloc/weather_bloc.dart';
import 'package:sunsnap/widgets/home_background.dart';
import 'package:sunsnap/widgets/icon_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 1 * kToolbarHeight, 20, 30),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              HomeBackground(),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is WeatherFailure) {
                    return Text('Something went wrong, please try again');
                  }
                  if (state is WeatherSuccess) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📍' +
                                state.weather.areaName.toString() +
                                '-' +
                                state.weather.country!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Good morning',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: SizedBox(
                                height: 200,
                                child: getWeatherIcon(
                                    state.weather.weatherConditionCode!)),
                          ),
                          Center(
                            child: Text(
                              state.weather.temperature!.celsius!
                                      .round()
                                      .toString() +
                                  '°C',
                              style: TextStyle(
                                  fontSize: 55,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Center(
                            child: Text(
                              DateFormat.yMMMMEEEEd()
                                  .add_jm()
                                  .format(state.weather.date!),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconDetail(
                                imgUrl: 'assets/6.png',
                                title: 'Sunrise',
                                subtitle: DateFormat()
                                    .add_jm()
                                    .format(state.weather.sunrise!),
                              ),
                              IconDetail(
                                imgUrl: 'assets/12.png',
                                title: 'Sunset',
                                subtitle: DateFormat()
                                    .add_jm()
                                    .format(state.weather.sunset!),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              thickness: 0.3,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconDetail(
                                title: 'Max temp',
                                subtitle: state.weather.tempMax!.celsius!
                                        .round()
                                        .toString() +
                                    ' °C',
                              ),
                              IconDetail(
                                title: 'Min temp',
                                subtitle: state.weather.tempMin!.celsius!
                                        .round()
                                        .toString() +
                                    ' °C',
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.3,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconDetail(
                                  title: 'Humidity',
                                  subtitle: state.weather.humidity!.toString() +
                                      ' %'),
                              IconDetail(
                                title: 'Wind Speed',
                                subtitle: state.weather.windSpeed!.toString() +
                                    ' km/h',
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.3,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconDetail(
                                  title: 'Pressure',
                                  subtitle: state.weather.pressure!
                                          .round()
                                          .toString() +
                                      ' hPa'),
                              IconDetail(
                                title: 'Wind Speed',
                                subtitle: state.weather.windSpeed!.toString() +
                                    ' km/h',
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return Text('Something went wrong, please try again');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
