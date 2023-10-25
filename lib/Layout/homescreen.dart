import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Shared/Network/Remote/api_manager.dart';
import 'package:islami_app/Shared/styles/Colors.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home Screen";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        leading: Drawer(
            backgroundColor: primary,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50))),
            child: Icon(Icons.menu,
              size: 27.sp,),
          ),
      ),
      body: FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong!"));
          }
          var sources = snapshot.data?.sources ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                sources[index].name ?? "",
                style: TextStyle(color: Colors.black),
              );
            },
            itemCount: sources.length,
          );
        },
      ),
    );
  }
}
