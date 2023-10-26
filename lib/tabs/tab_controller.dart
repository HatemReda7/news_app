import 'package:flutter/material.dart';
import 'package:islami_app/Shared/Network/Remote/api_manager.dart';
import '../Models/SourcesResponse.dart';
import 'news_card_item.dart';
import 'source_item.dart';

class TabControllerWidget extends StatefulWidget {
  List<Sources> sources;

  TabControllerWidget(this.sources, {super.key});

  @override
  State<TabControllerWidget> createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sources
                    .map((source) => Tab(
                          child: SourceItem(source,
                              widget.sources.indexOf(source) == selectedIndex),
                        ))
                    .toList()),
          ),
          FutureBuilder(
            future:
                ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong!"));
              }
              var newsList=snapshot.data?.articles??[];
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return NewsCardItem(newsList[index],);
                },itemCount: newsList.length,),
              );
            },
          )
        ],
      ),
    );
  }
}
