import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryItem(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25.r),topLeft: Radius.circular(25.r),bottomRight: Radius.circular(25.r))
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(categoryModel.image)),
          Text(categoryModel.name,style: GoogleFonts.exo(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18.sp,)),
        ],
      ),
    );
  }
}
