import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:core/external/locales_keys.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChangeLanguageScreen extends StatefulWidget {
  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  bool _isEnglish;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageCheck();
    return Scaffold(
      appBar: AppBar(
        title: Text(Modular.get<LocaleKeys>().changeLanguage.tr(),style: TextStyle(fontSize: 14.0),),
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  _isEnglish = true;
                  context.locale = EasyLocalization.of(context).supportedLocales[0];
                });
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.check, color: _changeColorEnglish(),),
                    Text(Modular.get<LocaleKeys>().english.tr(),style: TextStyle(fontSize: 14.0),),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                _isEnglish = false;
                context.locale = EasyLocalization.of(context).supportedLocales[1];
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.check, color: _changeColorIndonesia(),),
                    Text(Modular.get<LocaleKeys>().indonesia.tr(),style: TextStyle(fontSize: 14.0),),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Color _changeColorEnglish(){
    if(_isEnglish != true){
      return Colors.white;
    }else{
      return Colors.green;
    }
  }

  Color _changeColorIndonesia(){
    if(_isEnglish != false){
      return Colors.white;
    }else{
      return Colors.green;
    }
  }

  void languageCheck() async{
    if(context.locale.toString() != "en_US"){
      _isEnglish = false;
      print(context.locale.toString());
    }else{
      _isEnglish = true;
    }
  }
}
