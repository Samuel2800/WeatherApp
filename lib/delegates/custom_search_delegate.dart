import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate{
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
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed:(){
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

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed:(){
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var city in searchTerms){
      if(city.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var city in searchTerms){
      if(city.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: (){
            query = result;
          },
        );
      }
    );
  }
}