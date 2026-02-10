import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketing_apps/core/assets/assets.gen.dart';
import 'package:ticketing_apps/core/components/spaces.dart';
import 'package:ticketing_apps/core/constants/colors.dart';
import 'package:ticketing_apps/ui/dialog/logout_ticket_dialog.dart';
import 'package:ticketing_apps/ui/dialog/sync_data_dialog.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pengaturan')),
      body: GridView.count(
        padding: EdgeInsets.all(24),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  color: AppColors.black.withOpacity(5 / 100),
                  blurRadius: 30,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.settings.printer.path),
                SpaceHeight(10),
                Text('Printer', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'Kelola Printer',
                  style: TextStyle(color: AppColors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => LogoutTicketDialog(),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    color: AppColors.black.withOpacity(5 / 100),
                    blurRadius: 30,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.settings.logout.path),
                  SpaceHeight(10),
                  Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    'Keluar dari aplikasi',
                    style: TextStyle(color: AppColors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SyncDataDialog();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    color: AppColors.black.withOpacity(5 / 100),
                    blurRadius: 30,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.settings.syncData.path),
                  SpaceHeight(10),
                  Text(
                    'Sync Data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'sinkronisasi online',
                    style: TextStyle(color: AppColors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
