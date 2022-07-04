import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tour_guide_app/modules/weather/weather_controller.dart';

import '../../shared/styles/colors.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(WeatherController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var day = DateFormat.d().format(DateTime.now());
    var month = DateFormat.LLLL().format(DateTime.now());
    TextEditingController cityText = TextEditingController();

     handleSearchCity() {
      c.fetchWeather(cityText.text);
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }


    Widget weatherIcon() {
      return Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),// 30 from top if search
          height: height * 0.2,
          child: SimpleShadow(
            opacity: 0.20,
            color: Colors.black,
            offset: Offset(3, 10),
            sigma: 30,
            child: c.isLoading.value
                ? Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : LottieBuilder.network(
                    c.weatherIcon.value,
                    fit: BoxFit.cover,
                    width: width * 0.4,
                  ),
          ),
        ),
      );
    }

    Widget weatherInformation() {
      return Container(
        margin: EdgeInsets.fromLTRB(30, 40, 30, 0),
        padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          border: Border.all(
            color: tGrey(),
            width: 2,
          ),
          color: tGrey().withOpacity(0.30),
        ),
        child: c.isLoading.value
            ? Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              )
            : Column(
                children: [
                  // Date
                  Container(
                    child: Text(
                      'Today, $day $month',
                      style: TextStyle(
                        fontSize: 18,
                        color: tPrimary(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: tPrimary(),
                        ),
                        Text(
                          '${c.weather.value.name}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: tPrimary(),
                          ),
                        ),

                      ],
                    ),
                  ),
                  // Temperature
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: SimpleShadow(
                      opacity: 0.25,
                      color: Colors.black,
                      offset: Offset(3, 7),
                      sigma: 25,
                      child: Text(
                        '${(c.weather.value.temp / 10).toStringAsFixed(0)}\u00B0',
                        style: TextStyle(
                          fontSize: 90,
                          color: tPrimary(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Weather Description
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      '${c.weather.value.description.toUpperCase()}',
                      style: TextStyle(
                        fontSize: 22,
                        color: tPrimary(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Weather Detail
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 27, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.air,
                              color: tPrimary(),
                            ),
                            SizedBox(height: 13),
                            Icon(
                              Icons.water_damage_outlined,
                              color: tPrimary(),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        // Type
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                fontSize: 16,
                                color: tPrimary(),
                              ),
                            ),
                            SizedBox(height: 13),
                            Text(
                              'Humidity',
                              style: TextStyle(
                                fontSize: 16,
                                color: tPrimary(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        // Divider
                        Column(
                          children: [
                            Text(
                              '|',
                              style: TextStyle(
                                fontSize: 16,
                                color: tPrimary(),
                              ),
                            ),
                            SizedBox(height: 13),
                            Text(
                              '|',
                              style: TextStyle(
                                fontSize: 16,
                                color: tPrimary(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        // Number
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${c.weather.value.speed} km/h',
                              style: TextStyle(
                                fontSize: 16,
                                color: tPrimary(),
                              ),
                            ),
                            SizedBox(height: 13),
                            Text(
                              '${c.weather.value.humidity} %',
                              style: TextStyle(
                                fontSize: 16,
                                color: tPrimary(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      );
    }

    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: Image.asset('assets/images/application background.png',
                fit: BoxFit.cover,),

            ),
            Container(
              height: height,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: ListView(
                children: [
                  //searchCity(),
                  weatherIcon(),
                  weatherInformation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
