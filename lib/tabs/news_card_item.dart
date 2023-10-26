import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/ArticleModel.dart';
import 'package:islami_app/Models/NewsResponse.dart';
import 'package:islami_app/tabs/News_Article_Item.dart';

class NewsCardItem extends StatelessWidget {
  Articles articles;

  NewsCardItem(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsArticleItem.routeName,
          arguments: ArticleModel(articles.title??"", articles.description??"", articles.content??"", articles.urlToImage??"", articles.publishedAt??"")
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.h),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                fit: BoxFit.fill,
                height: 232.h,
                width: 360.w,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    articles.title ?? "",
                    style: GoogleFonts.poppins(
                      color: const Color(0xff42505C),
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    articles.description ?? "",
                    style: GoogleFonts.poppins(
                        color: const Color(0xff42505C),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          articles.author ?? "",
                          style: GoogleFonts.poppins(
                              color: const Color(0xffA3A3A3),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        articles.publishedAt?.substring(0, 10) ?? "",
                        style: GoogleFonts.poppins(
                            color: const Color(0xffA3A3A3),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
