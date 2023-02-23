import 'package:deprem_app/ui/pages/home/view_model/earthquake_cubit.dart';
import 'package:deprem_app/ui/widgets/info_widget.dart';
import 'package:flutter/cupertino.dart';
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

  late int selectSize;

  @override
  void initState() {
    localeJiffy();
    selectSize = 0;
    context.read<EarthquakeCubit>().earthquakeInfoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 40,
        title: Text(
          Jiffy().format("yy MMMM yyyy"),
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<EarthquakeCubit, EarthquakeState>(
          builder: (context, state) {
        if (state is EarthquakeLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is EarthquakeComplete) {
          return Stack(
            children: [
              state.list?.isEmpty ?? false
                  ? SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Text(
                            "Bu büyüklükte deprem yok (çok şükür)",
                            style: TextStyle(
                                fontSize: 18,
                                height: 2,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Son gerçekleşen 100 deprem arasında",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 15,
                                height: 2),
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 6),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectSize = 0;
                                    });
                                    context
                                        .read<EarthquakeCubit>()
                                        .filterEarthQuake(
                                            initalList: state.initalList ?? [],
                                            list: state.list ?? [],
                                            size: 0);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: selectSize == 0
                                        ? const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(999),
                                                bottomLeft:
                                                    Radius.circular(999)),
                                            color: Color.fromRGBO(
                                                228, 228, 231, 1))
                                        : null,
                                    child: Text(
                                      "Tümü",
                                      style: TextStyle(
                                          fontWeight: selectSize == 0
                                              ? FontWeight.w700
                                              : FontWeight.normal,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectSize = 3;
                                    });
                                    context
                                        .read<EarthquakeCubit>()
                                        .filterEarthQuake(
                                            initalList: state.initalList ?? [],
                                            list: state.list ?? [],
                                            size: 3);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: selectSize == 3
                                            ? const Color.fromRGBO(
                                                228, 228, 231, 1)
                                            : null,
                                        borderRadius: BorderRadius.circular(4)),
                                    padding: selectSize == 3
                                        ? const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 17)
                                        : const EdgeInsets.all(10),
                                    child: Text(
                                        "${selectSize == 3 ? '>' : ''}3",
                                        style: TextStyle(
                                            fontWeight: selectSize == 3
                                                ? FontWeight.w700
                                                : FontWeight.normal,
                                            fontSize: 16)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectSize = 5;
                                    });
                                    context
                                        .read<EarthquakeCubit>()
                                        .filterEarthQuake(
                                            initalList: state.initalList ?? [],
                                            list: state.list ?? [],
                                            size: 5);
                                  },
                                  child: Container(
                                    padding: selectSize == 5
                                        ? const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 17)
                                        : const EdgeInsets.all(10),
                                    decoration: selectSize == 5
                                        ? const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(999),
                                                bottomRight:
                                                    Radius.circular(999)),
                                            color: Color.fromRGBO(
                                                228, 228, 231, 1))
                                        : null,
                                    child: Text(
                                        "${selectSize == 5 ? '>' : ''}5",
                                        style: TextStyle(
                                            fontWeight: selectSize == 5
                                                ? FontWeight.w700
                                                : FontWeight.normal,
                                            fontSize: 16)),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                context
                                    .read<EarthquakeCubit>()
                                    .earthquakeInfoList();
                              },
                              icon: Icon(Icons.sync)),
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
