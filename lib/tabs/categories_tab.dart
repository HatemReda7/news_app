import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/tabs/CategoryItem.dart';
import '../Models/CategoryModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesTab extends StatelessWidget {
  List<CategoryModel> categories;
  Function onClick;

  CategoriesTab(this.categories,this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.pick,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: const Color(0xff4F5A69),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700)),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,crossAxisSpacing: 20,mainAxisSpacing: 20),
              children: categories.map((cat) => InkWell(
                  onTap: () {
                    onClick(cat);
                  },
                  child: CategoryItem(cat))).toList(),
            ),
          )
        ],
      ),
    );
  }
}
