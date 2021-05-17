import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bumptrade/bloc/profile/profile_bloc.dart';
import 'package:bumptrade/helpers/color/color_helper.dart';
import 'package:bumptrade/shared/colors.dart';

import 'package:bumptrade/widgets/profile/screen.dart';
import 'package:bumptrade/widgets/widgets/screenMessage.dart';
import 'package:bumptrade/widgets/widgets/loading_indicator.dart';

class Profile extends StatelessWidget {

  final String symbol;
  
  Profile({
    @required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {

        if (state is ProfileLoadingError) {
          return Scaffold(
            appBar: AppBar( 
              backgroundColor: kNegativeColor,
              title: Text('Impossible to load'),
            ),
            backgroundColor: Colors.lightBlue[50],
            body: Center(child: EmptyScreen(message: state.error))

          );
        }

        if (state is ProfileLoaded) {
          return ProfileScreen(
            isSaved: state.isSymbolSaved,
            profile: state.profileModel,            
            color: Colors.blueGrey
          );
        }

        return Scaffold(
          backgroundColor: Colors.lightBlue[50],
          body: CupertinoActivityIndicator()
        );
      }
    );
  }
}