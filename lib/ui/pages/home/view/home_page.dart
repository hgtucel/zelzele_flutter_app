import 'package:deprem_app/ui/pages/home/view_model/earthquake_cubit.dart';
import 'package:deprem_app/ui/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  Future<void> localeJiffy() async {
    await Jiffy.locale("tr");
  }

  @override
  void initState() {
    localeJiffy();
    context.read<EarthquakeCubit>().earthquakeInfoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<EarthquakeCubit, EarthquakeState>(
          builder: (context, state) {
        if (state is EarthquakeLoading) {
          return const CircularProgressIndicator();
        } else if (state is EarthquakeComplete) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: state.list?.length,
                itemBuilder: (context, index) {
                  return InfoWidget(
                    earthquakeModel: state.list?[index],
                  );
                },
              ),
              Positioned(
                  bottom: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 80, bottom: 40),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                          Color(0xFFa1a1aa),
                          Color.fromRGBO(161, 161, 170, 0)
                        ])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: Colors.white),
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(999),
                                          bottomLeft: Radius.circular(999)),
                                      color: Color.fromRGBO(228, 228, 231, 1)),
                                  child: Text("Tümü", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text("3",style: TextStyle(fontSize: 16)),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text("5",style: TextStyle(fontSize: 16)),
                                )
                              ],
                            )),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                context.read<EarthquakeCubit>().earthquakeInfoList();
                              }, icon: Icon(Icons.sync)),
                        )
                      ],
                    ),
                  )),
            ],
          );
        }
        return const SizedBox();
      }),
    );
  }
}
