import 'package:flutter/material.dart';

//in this class extended from SearchDelegate
//there are several method modifications for the
//city search


//first we create a list of city options so that the user doesn't
//break the system entering random characters
//this will updated afterwards to allow the user introduce any string
//if it is not a valid city, an error will appear
class CustomSearchDelegate extends SearchDelegate{
  //this is the list of valid cities for now
  List<String> searchTerms = [
    'Amsterdam',
    'Atlanta',
    'Austin',
    'Ahmedabad',
    'Alicante',
    'Berlin',
    'Barcelona',
    'Boston',
    'Budapest',
    'Bandung',
    'Chicago',
    'Chennai',
    'Cancún',
    'Coimbatore',
    'Calgary',
    'Dubai',
    'Dallas',
    'Denver',
    'Düsseldorf',
    'Dublin',
    'Edinburg',
    'Essen',
    'El Paso',
    'Eindhoven',
    'Edmonton',
    'Frankfurt',
    'Fort Lauderdale',
    'Florence',
    'Faro',
    'Fresno',
    'Guadalajara',
    'Granada',
    'Gdansk',
    'Glasgow',
    'Guwahati',
    'Hamburg',
    'Houston',
    'Hyderabad',
    'Haridwar',
    'Hannover',
    'Istanbul',
    'Indore',
    'Indianapolis',
    'Innsbruck',
    'Izmir',

  ];

  //this displays the widgets on the search query in the appBar
  //in this specific case, there is a "clear" button at the right
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        color: Colors.deepPurple,
        onPressed:(){
          //if the query is empty, it will close the input query
          if(query.isEmpty){
            close(context, null);
          }
          else{
            query = '';
          }
        }
      ),
    ];
  }

  //this displays the widget that goes before the input query
  //in this case it displays the "go-back" widget button
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      color: Colors.deepPurple,
      onPressed:(){
        close(context, null);
      }
    );
  }

  //this method is meant to display the recommendations according to the query input
  @override
  Widget buildResults(BuildContext context) {
    //first we create the list in which the results
    //that match the query input
    List<String> matchQuery = [];
    for(var city in searchTerms){
      if(city.toLowerCase().contains(query.toLowerCase())){
        //we look through the city list searching for matching results
        //then we add them to the matchQuery list
        matchQuery.add(city);
      }
    }
    //we return the matchQuery list in form of the recommendations
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          //the list tile is the tile that contains the text
          //the rectangle
          title: Text(result),
        );
      }
    );
  }

  //this method shows the suggestions
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var city in searchTerms){
      if(city.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(city);
      }
    }
    return Container(
      color: Colors.black,
      child: ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index){
            var result = matchQuery[index];
            return ListTile(
              title: Text(
                  result,
                style: TextStyle(color: Colors.grey),
              ),
              onTap: (){
                query = result;
              },
            );
          }
      )
    );

  }


  //this method modifies the theme of the appbar
  //Im currently trying to change the query input text color
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : Colors.black,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            labelStyle: TextStyle(color: Colors.deepPurple),
          ),
    );
  }}