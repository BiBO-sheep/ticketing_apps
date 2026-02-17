import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketing_apps/core/constants/colors.dart';
import 'package:ticketing_apps/core/data/remotedatasources/auth_remote_datasources.dart';
import 'package:ticketing_apps/ui/auth/bloc/auth_bloc.dart';
import 'package:ticketing_apps/ui/auth/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRemoteDatasource()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: AppColors.primary),
          dialogTheme: DialogThemeData(elevation: 0),
          textTheme: GoogleFonts.plusJakartaSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.plusJakartaSans(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            iconTheme: IconThemeData(color: AppColors.black),
            centerTitle: true,
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
