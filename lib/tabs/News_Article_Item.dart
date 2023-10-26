import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/ArticleModel.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsArticleItem extends StatelessWidget {
  static const String routeName = "";

  const NewsArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png")),
          color: Colors.white),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 67.h,
            decoration: const BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Center(
                child: Text(
              AppLocalizations.of(context)!.newsApp,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )),
          ),
          const SizedBox(
            height: 30,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(args.image)),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            child: Column(
              children: [
                Text(
                  args.title,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff42505C)),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      args.time.substring(0, 10),
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffA3A3A3)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.all(12.0.w),
                  child: Text(args.description,
                      maxLines: 15,
                      style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff42505C))),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "View Full Article",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff42505C)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
