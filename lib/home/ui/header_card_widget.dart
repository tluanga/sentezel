import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/business_profile/business_profile_controller.dart';

class HomeHeaderCard extends HookConsumerWidget {
  const HomeHeaderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(businessProfileControllerProvider);
    useEffect(() {
      ref.read(businessProfileControllerProvider.notifier).loadData();
    }, []);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Colors.yellow,
                Colors.red,
                Colors.indigo,
                Colors.teal,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
        //Sentezel
        Positioned(
          left: 20,
          top: 20,
          child: Text(
            "Sentezel",
            style: GoogleFonts.titilliumWeb(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        // Busines Name
        state.when(data: (data) {
          return Positioned(
            bottom: 30,
            child: Text(
              data.name,
              style: GoogleFonts.titilliumWeb(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
          );
        }, loading: () {
          return const Positioned(
              bottom: 30, child: CircularProgressIndicator());
        }, error: (error, stack) {
          throw (error.toString());
        })
      ],
    );
  }
}
