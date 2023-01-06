import 'package:basic_widgets/ui/application/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeAnimationScreen extends StatelessWidget {
  const ThemeAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Animation'),
        centerTitle: true,
      ),
      body: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: (themeService.isDarkMode ? Colors.black : Colors.grey).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,
                  gradient: LinearGradient(
                    colors: themeService.isDarkMode
                        ? [
                            const Color(0xFF200F75),
                            const Color(0xFF94A9FF),
                            const Color(0xFF6B66CC),
                          ]
                        : [
                            const Color(0xDD940B99),
                            const Color(0xDDFFA057),
                            const Color(0xDDFFFA66),
                          ],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                ),
                child: Stack(
                  // (*) We can align all the elements like that
                  // alignment: Alignment.bottomCenter,
                  children: [
                    // (*) or we can specify for single element how to be aligned like so:
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 225,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: themeService.isDarkMode ? Colors.grey[800] : Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              themeService.isDarkMode ? 'Too dark?' : 'Too bright?',
                              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              themeService.isDarkMode ? 'let the sub rise' : 'let it be night',
                              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            Switch(
                              value: themeService.isDarkMode,
                              onChanged: (_) => themeService.toggleTheme(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
