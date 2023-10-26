import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;

  DrawerTab(this.onClick);

  static int CAT_ID=1;
  static int SETT_ID=2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.8,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Column(
        children: [
          Container(
            width: 326.w,
            height: 110.h,
            color: primary,
            child: Center(child: Text(AppLocalizations.of(context)!.newsApp,style: GoogleFonts.poppins(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.w700),)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onClick(CAT_ID);
                  },
                  child: Row(
                    children: [
                      ImageIcon(AssetImage("assets/images/Icon awesome-th-list.png")),
                      SizedBox(width: 15,),
                      Text(AppLocalizations.of(context)!.categories,style: GoogleFonts.poppins(color: Color(0xff303030),fontSize: 24.sp,fontWeight: FontWeight.w700),),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                InkWell(
                  onTap: () {
                    onClick(SETT_ID);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.settings,size: 24.sp,),
                      SizedBox(width: 15,),
                      Text(AppLocalizations.of(context)!.settings,style: GoogleFonts.poppins(color: Color(0xff303030),fontSize: 24.sp,fontWeight: FontWeight.w700),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
