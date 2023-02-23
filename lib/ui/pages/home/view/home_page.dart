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
      body: SafeArea(
        child: BlocBuilder<EarthquakeCubit, EarthquakeState>(
            builder: (context, state) {
          if (state is EarthquakeLoading) {
            return const CircularProgressIndicator();
          } else if (state is EarthquakeComplete) {
            return ListView.builder(
              itemCount: state.list?.length,
              itemBuilder:(context, index) {
                return InfoWidget(earthquakeModel: state.list?[index],);
            },);
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
