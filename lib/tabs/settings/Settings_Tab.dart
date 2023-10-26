import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Shared/styles/Colors.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName="Settings";
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.h,),
          Text(AppLocalizations.of(context)!.language,style: GoogleFonts.poppins(color: Theme.of(context).indicatorColor,fontSize: 14.sp,fontWeight: FontWeight.w700,)),
          SizedBox(height: 20.h,),
          InkWell(
            onTap: () {
              showModalBottomSheet(context: context, builder: (context) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
                        child: InkWell(
                          onTap: () {
                            pro.changeLanguage("en");
                            setState(() {

                            });
                          },
                          child: Row(
                            children: [
                              Text("English",style: GoogleFonts.poppins(color: pro.languageCode=="en"? primary:Theme.of(context).indicatorColor,fontSize: 20.sp,fontWeight: FontWeight.w700,)),
                              const Spacer(),
                              pro.languageCode=="en"? const Icon(Icons.done,color: primary):const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
                        child: InkWell(
                          onTap: () {
                            pro.changeLanguage("ar");
                            setState(() {

                            });
                          },
                          child: Row(
                            children: [
                              Text("عربي",style: GoogleFonts.poppins(color: pro.languageCode=="ar"? primary:Theme.of(context).indicatorColor,fontSize: 20.sp,fontWeight: FontWeight.w700,)),
                              const Spacer(),
                              pro.languageCode=="ar"? const Icon(Icons.done,color: primary):const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              width: 319.w,
              height: 48.h,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: primary,width: 2.w)
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(pro.languageCode=="en"?"English":"عربي",style: GoogleFonts.inter(color: primary,fontSize: 16.sp,fontWeight: FontWeight.w400,)),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Icon(Icons.arrow_drop_down,color: primary,),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
