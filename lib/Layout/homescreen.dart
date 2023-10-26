import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/Models/CategoryModel.dart';
import 'package:islami_app/Shared/Network/Remote/api_manager.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:islami_app/tabs/news_tab.dart';
import 'package:islami_app/tabs/settings/Settings_Tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../tabs/categories_tab.dart';
import '../tabs/drawer.dart';
import '../tabs/tab_controller.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home Screen";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories=CategoryModel.getCategories();
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                "assets/images/pattern.png",
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        drawer: DrawerTab(onDrawerClicked),
        appBar: AppBar(
          title: Text(onSettingTab?AppLocalizations.of(context)!.settings:AppLocalizations.of(context)!.newsApp),
        ),
        body: onSettingTab?const SettingsTab():(categoryModel==null? CategoriesTab(categories,onCategoryClick): NewsTab(categoryModel!.id)),
      ),
    );
  }

  CategoryModel? categoryModel=null;
  bool onSettingTab=false;

  onCategoryClick(category){
    categoryModel=category;
    setState(() {

    });
  }

  onDrawerClicked(id){
    if(id==DrawerTab.CAT_ID){
      categoryModel=null;
      onSettingTab=false;
    }else if(id==DrawerTab.SETT_ID){
      onSettingTab=true;
    }
    setState(() {
      Navigator.pop(context);
    });
  }
}
