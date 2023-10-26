import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/CategoryModel.dart';
import 'package:islami_app/Shared/Network/Remote/api_manager.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:islami_app/tabs/SearchingNewsTab.dart';
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
  bool searchOpen=false;
  TextEditingController searchedArticles=TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories=CategoryModel.getCategories();
    return SafeArea(
      child: Container(
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
          appBar: searchOpen? PreferredSize(
            preferredSize: Size(412.w, 67.h),
            child: Container(
              padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50))
                ),
                child: Center(
                  child: TextField(
                    controller: searchedArticles,
                    decoration: InputDecoration(
                      filled: true ,
                      prefixIcon: InkWell(
                          onTap: () {
                            searchOpen=false;
                            setState(() {

                            });
                          },
                          child: Icon(Icons.close,size: 25.sp,color: primary,)),
                      suffixIcon: InkWell(
                          onTap: () {
                            ApiManager.searchNewsData(categoryModel!.id,searchedArticles.text);
                            setState(() {

                            });
                          },
                          child: Icon(Icons.search,size: 25.sp,color: primary,)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                        hintText: "Seach Articles",
                        hintStyle: GoogleFonts.poppins(color: primary,fontSize: 14.sp,fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

                  ),
                )),
          ):AppBar(
            actions: [
              categoryModel!=null?InkWell(
                onTap: () {
                  searchOpen=true;
                  setState(() {

                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Icon(Icons.search,size: 27.sp,),
                ),
              ):SizedBox.shrink()
            ],
            title: Text(onSettingTab?AppLocalizations.of(context)!.settings:(categoryModel==null?AppLocalizations.of(context)!.newsApp:categoryModel!.name)),
          ),
          body: onSettingTab?const SettingsTab():(categoryModel==null? CategoriesTab(categories,onCategoryClick): (searchOpen? SearchingNewsTab(categoryModel!.id,searchedArticles.text):NewsTab(categoryModel!.id))),
        ),
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
