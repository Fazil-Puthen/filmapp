import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:testaapp/models/moviemodel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Fetchmovie>(fetchmoviehanlder);
  }

  FutureOr<void> fetchmoviehanlder(Fetchmovie event, Emitter<HomeState> emit) async{
    try{
    final response=await http.post(Uri.parse('https://hoblist.com/api/movieList',),
    body: {
         "category": "movies",
            "language": "telugu",
            "genre": "all",
            "sort": "voting"
      
});
 print('the response body: ${response.body}');
  if(response.statusCode>=200){
  Map<String,dynamic> result=jsonDecode(response.body);
  final movie=moviemodel.fromJson(result);
  print('this is the name ${movie.result![0].language??'no language'}');
  emit(Moviefetched(movie: movie));
  }
}
catch(e){
  print('the error $e');
}
  }
}
