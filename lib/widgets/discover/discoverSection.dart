import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:bumptrade/bloc/discover/discover_bloc.dart';
import 'package:bumptrade/shared/colors.dart';
import 'package:bumptrade/widgets/discover/discover_sectors.dart';
import 'package:bumptrade/widgets/widgets/screenMessage.dart';
import 'package:bumptrade/widgets/widgets/header.dart';

class DiscoverSection extends StatelessWidget {
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
      child: EmptyScreen(message: 'Looks like you don\'t have an internet connection.'),
    );
  }

  Widget _buildContent(context) {
    return RefreshIndicator(
      child: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            StandardHeader(
              title: 'Discover',
              action: Container(),
            ),
            MarketsPerformance() 
          ]
        )
      ),
      onRefresh: () async {
        // Reload markets section.
        BlocProvider
        .of<SectorPerformanceBloc>(context)
        .add(FetchSectorPerformance());
      },
    );
  }
}

