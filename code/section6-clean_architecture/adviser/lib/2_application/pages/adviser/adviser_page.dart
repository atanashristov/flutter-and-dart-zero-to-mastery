import 'package:adviser/2_application/core/services/theme_service.dart';
import 'package:adviser/2_application/core/widgets/custom_button.dart';
import 'package:adviser/2_application/pages/adviser/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Adviser', style: themeData.textTheme.headline1),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            const Expanded(
              child: Center(child: ErrorMessage(message: 'Unable to connect to the server!')
                  // AdviceField(advice: 'Example advice to you ...'),
                  // CircularProgressIndicator(
                  //   color: themeData.colorScheme.secondary,
                  // ),
                  // Text(
                  //   'Your advice is waiting for you...',
                  //   style: themeData.textTheme.headline1,
                  // ),
                  ),
            ),
            SizedBox(
              height: 160,
              child: Center(
                child: CustomButton(
                  caption: 'Get Advice',
                  onTap: () {
                    debugPrint('TODO: Get advice...');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
