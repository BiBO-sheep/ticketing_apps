import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:ticketing_apps/core/components/spaces.dart';
import 'package:ticketing_apps/core/constants/colors.dart';

class SyncDataDialog extends StatefulWidget {
  const SyncDataDialog({super.key});

  @override
  State<SyncDataDialog> createState() => _SyncDataDialogState();
}

class _SyncDataDialogState extends State<SyncDataDialog> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpaceHeight(40),
          SpinKitCubeGrid(color: AppColors.primary, size: 80),
          SpaceHeight(16),
          Text(
            'Sync Data',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
