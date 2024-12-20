import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:evently/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
                themeProvider.changeTheme(ThemeMode.light);
              },
              child: themeProvider.themeMode == ThemeMode.dark ?
              getUnselectedWiget(AppLocalizations.of(context)!.light):
              getSelectedWiget(AppLocalizations.of(context)!.light)
          ),
          SizedBox(
            height: height*0.02,
          ),
          InkWell(
            onTap: (){
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.themeMode == ThemeMode.dark ?
            getSelectedWiget(AppLocalizations.of(context)!.dark):
            getUnselectedWiget(AppLocalizations.of(context)!.dark),
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
