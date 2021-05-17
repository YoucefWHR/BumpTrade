import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:bumptrade/bloc/portfolio/portfolio_bloc.dart';
import 'package:bumptrade/widgets/watchlist/watchlistStocks.dart';
import 'package:bumptrade/widgets/portfolio/widgets/appbar/watchlist_appbar.dart';
import 'package:bumptrade/widgets/widgets/screenMessage.dart';

class PortfolioSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: OfflineBuilder(
        child: Container(),
        connectivityBuilder: ( context,  connectivity, child,  ) {
          return connectivity == ConnectivityResult.none 
          ? _buildNoConnectionMessage(context)
          : _buildContent(context);
        }
      )
    );
  }

  Widget _buildNoConnectionMessage(context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 14,
        left: 24,
        right: 24
      ),
      child: EmptyScreen(message: 'No internet connection'),
    );
  }

  Widget _buildContent(context) {
    return RefreshIndicator(
      child: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            PortfolioHeadingSection(),
            PortfolioStonksSection()
          ]
        )
      ),

      onRefresh: () async {
        // Reload stocks section.
        BlocProvider
        .of<PortfolioBloc>(context)
        .add(FetchPortfolioData());
      },
    );
  }

}