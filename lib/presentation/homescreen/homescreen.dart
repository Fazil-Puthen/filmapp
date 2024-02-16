import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:testaapp/presentation/constants%20and%20components/constants.dart';
import 'package:testaapp/presentation/homescreen/bloc/home_bloc.dart';
import 'package:testaapp/presentation/homescreen/components/companyinfo.dart';
import 'package:testaapp/presentation/homescreen/components/traileralert.dart';
import 'package:testaapp/presentation/loginscreen/loginpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(Fetchmovie());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar:
              //appbar
              PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  border: Border.all(width: 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Companyinfowidget();
                              });
                        },
                        child: Text(
                          'About',
                          style: GoogleFonts.acme(color: Colors.blue),
                        )),
                        Text('Home',style: GoogleFonts.acme(fontSize: 20),),
                        TextButton(onPressed: (){
                          Navigator.pushAndRemoveUntil(context,
                           MaterialPageRoute(builder: (ctx)=>LoginPage()),
                            (route) => false);
                        },
                         child: Text('Logout',style: GoogleFonts.acme(color: Colors.blue),))
                  ],
                ),
              ),
            ),
          ),
          body:
              //listview
              Padding(
            padding: const EdgeInsets.only(top: 10),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if(state is Moviefetched){
                  final value=state.movie;
                return Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: value.result!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          height: 190,
                          width: screenwidth,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.arrow_drop_up,
                                        size: 45,
                                      ),
                                      Text(value.result![index].totalVoted.toString()),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        size: 45,
                                      ),
                                      Text(
                                        'votes',
                                        style: acmestyle,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 70,
                                    height: 120,
                                    color: Colors.red,
                                    child: Image.network(
                                      value.result![index].poster??posterurl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(width: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.result![index].title!,
                                          style: GoogleFonts.acme(fontSize: 15),
                                        ),
                                        Text(
                                          'genre : ${value.result![index].genre}',
                                          style: smallacme,
                                        ),
                                        Text(
                                         'Director: ${value.result![index].director![0]}',
                                          style: smallacme,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                         'Starring: ${value.result![index].stars![0]}',
                                          style: smallacme,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          '${value.result![index].runTime} | ${value.result![index].language}|${value.result![index].runTime}',
                                          style: smallacme,
                                        ),
                                        FittedBox(
                                          child: Text(
                                            '${value.result![index].pageViews} views |voted by ${value.result![index].totalVoted} people',
                                            style: GoogleFonts.acme(
                                                color: Colors.blue,fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                                Container(
                                  width: screenwidth * 0.9,
                                  height: 35,
                                  color: Colors.blue,
                                  child: Center(
                                    child: TextButton(child: Text('watch trailer',
                                      style: acmestyle,),
                                      onPressed:() {
                                        showDialog(context: context,
                                         builder:(BuildContext context)=>const Traileralert());
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );}
                else{
                  return Center(
                    child:Lottie.asset('asset/loadingbar.json',
                    repeat: true),
                  );
                }
              },
            ),
          )),
    );
  }
}
