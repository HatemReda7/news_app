 import 'package:flutter/material.dart';
import '../Shared/Network/Remote/api_manager.dart';
import 'tab_controller.dart';

class NewsTab extends StatelessWidget {
  String catID;

  NewsTab(this.catID, {super.key});

  @override
   Widget build(BuildContext context) {
     return FutureBuilder(
       future: ApiManager.getSources(catID),
       builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
           return const Center(child: CircularProgressIndicator());
         }
         if (snapshot.hasError) {
           return const Center(child: Text("Something went wrong!"));
         }
         var sources = snapshot.data?.sources ?? [];
         return TabControllerWidget(sources);
       },
     );
   }
 }
