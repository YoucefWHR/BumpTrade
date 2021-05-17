import 'package:flutter/material.dart';

import 'package:bumptrade/helpers/color/color_helper.dart';
import 'package:bumptrade/models/markets/sector_performance/sector_performance_model.dart';
import 'package:bumptrade/shared/colors.dart';
import 'package:bumptrade/shared/styles.dart';

class SectorPerformance extends StatelessWidget {

  final SectorPerformanceModel performanceData;

  SectorPerformance({
    @required this.performanceData
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      padding: EdgeInsets.only(top: 16),
      physics: NeverScrollableScrollPhysics(),
      itemCount: performanceData.performanceModelToday.sectors.length,
      itemBuilder: (BuildContext context, int index) => _buildListTile(
        sectorPerformance: performanceData.performanceModelToday.sectors[index]
      )
    );
  }
  
  Widget _buildListTile({SingleSectorPerformance sectorPerformance}) {

    final changeString = sectorPerformance.change.replaceFirst(RegExp('%'), ''); 
    final change = double.parse(changeString);
    //final width = change > 9.99 ? null : 75.5;

    return Column(
      children: <Widget>[
        Divider(height: 0),
        ListTile(
          
          contentPadding: EdgeInsets.all(10),
          title: Text(sectorPerformance.name, style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700)),
        
          trailing: Container(
            child: Text(sectorPerformance.change, textAlign: TextAlign.center,style:TextStyle(color: determineColorBasedOnChange(change),fontSize: 20 ),
          ),
        )
        )],
    );
  }
}