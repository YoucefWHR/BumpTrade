import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bumptrade/iosbar.dart';

class Page2 extends StatefulWidget {
  Page2();

  createState() => new SearchPageState();
}

class SearchPageState extends State<Page2> with SingleTickerProviderStateMixin {
  String symbol = '';
  final String as =
      "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=";
  final String ad = "&apikey=M7GIG8LA92411P8F";

  TextEditingController _filter = new TextEditingController();
  FocusNode _searchFocusNode = new FocusNode();
  Animation _animation;
  AnimationController _animationController;
  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(as + symbol + ad);
    return json.decode(result.body)['bestMatches'];
  }

  String _name(dynamic user) {
    return user['2. name'].toString();
  }

  String _location(dynamic user) {
    return user['1. symbol'];
  }

  SearchPageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          symbol = "";
          //filteredNames = names;
        });
      } else {
        setState(() {
          symbol = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
      duration: new Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = new CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
    _searchFocusNode.addListener(() {
      if (!_animationController.isAnimating) {
        _animationController.forward();
      }
    });
  }

  void _cancelSearch() {
    _filter.clear();
    _searchFocusNode.unfocus();
    _animationController.reverse();
  }

  void _clearSearch() {
    _filter.clear();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Search'),
            middle: new IOSSearchBar(
              controller: _filter,
              focusNode: _searchFocusNode,
              animation: _animation,
              onCancel: _cancelSearch,
              onClear: _clearSearch,
            ),
          ),
        ];
      },

      body: Container(
          child: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                //padding: EdgeInsets.all(10),
               // itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          trailing: Text(_name(snapshot.data[index])),
                          title: Text(_location(snapshot.data[index]),
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                        
                        )
                      ],
                    ),
                  );
                }
              
                );
          } else {
            return Center(
              child: Icon(
                CupertinoIcons.search,
                color: Colors.black12,
                size: 100,
              ),
            );
          }
        },
      )
      
      ),
    ));
  }

  
}