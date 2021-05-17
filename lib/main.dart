import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumptrade/bloc/news/news_bloc.dart';
import 'package:bumptrade/bloc/portfolio/portfolio_bloc.dart';
import 'package:bumptrade/bloc/profile/profile_bloc.dart';
import 'package:bumptrade/bloc/search/search_bloc.dart';
import 'package:bumptrade/bloc/discover/discover_bloc.dart';
import 'package:bumptrade/widgets/about/about.dart';
import 'package:bumptrade/widgets/home_bar.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PortfolioBloc>(
          create: (context) => PortfolioBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
        BlocProvider<SectorPerformanceBloc>(
          create: (context) => SectorPerformanceBloc(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'BumpTrade',
        theme: ThemeData(brightness: Brightness.light),
        home: StockMarketAppHome(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/about': (context) => AboutSection()
        },
      )
    )
  );
}