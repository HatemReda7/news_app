import 'package:flutter/material.dart';
import 'package:islami_app/Shared/Network/Remote/api_manager.dart';
import '../Models/SourcesResponse.dart';
import 'news_card_item.dart';

class SearchingTabController extends StatefulWidget {
  List<Sources> sources;
  String searchArticle;

  SearchingTabController(this.sources,this.searchArticle);

  @override
  State<SearchingTabController> createState() => _SearchingTabControllerState();
}

class _SearchingTabControllerState extends State<SearchingTabController> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          FutureBuilder(
            future:
            ApiManager.searchNewsData(widget.sources[selectedIndex].id ?? "",widget.searchArticle),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong!"));
              }
              var newsList=snapshot.data?.articles??[];
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return NewsCardItem(newsList[index]);
                },itemCount: newsList.length,),
              );
            },
          )
        ],
      ),
    );
  }
}
