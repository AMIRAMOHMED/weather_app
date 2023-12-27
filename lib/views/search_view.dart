import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_states_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Row(mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: TextField(
          onSubmitted: (value) async {
                  var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCubit.getWeather(cityName: value);
                  Navigator.pop(context);
          },
          decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 36, horizontal: 16),
                  suffixIcon: Icon(Icons.search),
                  hintText: "Enter City Name",
                  label: Text("search"),
                  border:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          ),
        ),
                ),
                 const SizedBox(width: 20,),
                Ink(decoration:  ShapeDecoration(
                    color: Colors.lightBlue,
                    shape:  RoundedRectangleBorder()),
                  child: IconButton(icon:   Icon(Icons.location_on_sharp),
                    tooltip: "Find My Loction",
                    onPressed:(){
                    var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeatherFromLoction();
                    Navigator.pop(context);


                    }

                      ),
                )
              ],
            )),
      ),
    );
  }
}
