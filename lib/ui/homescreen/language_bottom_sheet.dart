import 'package:evently/providers/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              languageProvider.changeLanguage('ar');
            },
            child: languageProvider.appLanguage == 'ar' ?
            getSelectedWiget(AppLocalizations.of(context)!.arabic):
            getUnselectedWiget(AppLocalizations.of(context)!.arabic),
          ),
          SizedBox(
            height: height*0.02,
          ),
          InkWell(
            onTap: (){
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLanguage == 'en' ?
                getSelectedWiget(AppLocalizations.of(context)!.english):
                getUnselectedWiget(AppLocalizations.of(context)!.english)
          ),
        ],
      ),
    );
  }

  Widget getSelectedWiget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Icon(Icons.check)
      ],
    );
  }
  Widget getUnselectedWiget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
      ],
    );
  }
}
