import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bumptrade/bloc/portfolio/portfolio_bloc.dart';

import 'package:bumptrade/models/data_overview.dart';
import 'package:bumptrade/models/profile/market_index.dart';


import 'package:bumptrade/widgets/watchlist/watchlistStock.dart';

import 'package:bumptrade/widgets/widgets/screenMessage.dart';
import 'package:bumptrade/widgets/widgets/loading_indicator.dart';

class PortfolioStonksSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (BuildContext context, PortfolioState state) {

        if (state is PortfolioInitial) {
          BlocProvider
          .of<PortfolioBloc>(context)
          .add(FetchPortfolioData());
        }

        if (state is PortfolioError) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            child: EmptyScreen(message: state.message),
          );
        }

        if (state is PortfolioStockEmpty) {
          return Column(
            children: <Widget>[
              _buildIndexesSection(indexes: state.indexes),
              
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 5,
                  horizontal: 4
                ),
                child: EmptyScreen(message: 'Aucun actif sur la watchlist'),
              ),
            ],
          );
        }

        if (state is PortfolioLoaded) {
          return Column(
            children: <Widget>[
              _buildIndexesSection(indexes: state.indexes),
              _buildStocksSection(stocks: state.stocks)              
            ],
          );
        }

        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: LoadingIndicatorWidget(),
        );
      },
    );
  }

  Widget _buildIndexesSection({List<MarketIndexModel> indexes}) {
    return Container(
      height: 0,
      margin: EdgeInsets.only(top: 16, bottom: 16),
    );
  }
  
  Widget _buildStocksSection({List<StockOverviewModel> stocks}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: stocks.length,
      itemBuilder: (BuildContext context, int index) {
        return PortfolioStockCard(data: stocks[index]);
      }
    );
  }
}
