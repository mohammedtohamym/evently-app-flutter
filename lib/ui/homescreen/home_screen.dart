import 'package:evently/ui/homescreen/language_bottom_sheet.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/ui/homescreen/theme_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.01,),
            Text(AppLocalizations.of(context)!.language),
            InkWell(
              onTap: (){
                showLaguageBottomSheet();
              },
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(languageProvider.appLanguage == 'en'?
                    AppLocalizations.of(context)!.english:
                    AppLocalizations.of(context)!.arabic),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.01,),
            Text(AppLocalizations.of(context)!.theme),
            InkWell(
              onTap: (){
                showThemeBottomSheet();
              },
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: Colors.blue,
                        width: 2
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(1==1?
                    AppLocalizations.of(context)!.dark:
                    AppLocalizations.of(context)!.light),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLaguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context){
          return LanguageBottomSheet() ;
        },
    );

  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context){
        return ThemeBottomSheet();
        },
    );
  }
}
