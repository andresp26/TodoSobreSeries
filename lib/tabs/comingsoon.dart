import 'package:flutter/material.dart';
import 'package:flutterapp/tabs/themenotificator.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';


class ComingSoonPage extends StatefulWidget {
  @override
  _ComingSoonPage createState() => _ComingSoonPage();
}

class _ComingSoonPage extends State<ComingSoonPage> {
  bool lockInBackground = true;
  
  @override
  Widget build(BuildContext context) {
   
    final themeProvider = Provider.of<DynamicTheme>(context);  
    return Scaffold(
      appBar: AppBar(title: Text('Ajustes') ,centerTitle: true,),      
      body: SettingsList(
        sections: [
           SettingsSection(
            title: 'Modo Oscuro',
            tiles: [
              SettingsTile.switchTile(
                title: 'Cambiar Tema',
                leading: Icon(Icons.autorenew),
                switchValue: themeProvider.getDarkMode(), 
                onToggle: (bool value) {
                  setState(() {                   
                       themeProvider.changeDarkMode(value);  
                  });                 
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Idioma',
                subtitle: 'Español',
                leading: Icon(Icons.language),
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Cuenta',
            tiles: [
              SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
              SettingsTile(title: 'Email', leading: Icon(Icons.email)),
              SettingsTile(
                title: 'Cambiar Contraseña',
                leading: Icon(Icons.lock),                
              ),
              SettingsTile(
                  title: 'Cerrar Sesion', leading: Icon(Icons.exit_to_app)),
            ],
          ),
         
        ],
      ),
    );
  }
}
 
 