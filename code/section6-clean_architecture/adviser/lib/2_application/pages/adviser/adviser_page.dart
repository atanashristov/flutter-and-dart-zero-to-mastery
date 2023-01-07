import 'package:adviser/2_application/core/services/theme_service.dart';
import 'package:adviser/2_application/core/widgets/custom_button.dart';
// import 'package:adviser/2_application/pages/adviser/bloc/adviser_bloc.dart';
import 'package:adviser/2_application/pages/adviser/cubit/adviser_cubit.dart';
import 'package:adviser/2_application/pages/adviser/widgets/advice_field.dart';
import 'package:adviser/2_application/pages/adviser/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// Wrap the actual page instead of codding the `BlocProvider` inside the page.
// We want to be able to test the page in isolation and maybe wrap it with some different fake bloc.
class AdviserPageWrapperProvider extends StatelessWidget {
  const AdviserPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // A new fresh instance of the `AdviserBloc` is created every time we open new  `AdviserPage()`
      create: (context) => AdviserCubit(),
      child: const AdviserPage(),
    );
  }
}

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
            Expanded(
              child: Center(
                child: BlocBuilder<AdviserCubit, AdviserCubitState>(
                  builder: (context, state) {
                    if (state is AdviserInitial) {
                      return Text(
                        'Your advice is waiting for you...',
                        style: themeData.textTheme.headline1,
                      );
                    } else if (state is AdviserStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdviserStateLoaded) {
                      return AdviceField(advice: state.advice);
                    } else if (state is AdviserStateError) {
                      return ErrorMessage(message: state.message);
                    }

                    return const SizedBox();
                    // return const ErrorMessage(message: 'Oops, something went wrong...');
                  },
                ),
              ),
            ),
            SizedBox(
              height: 160,
              child: Center(
                child: CustomButton(
                  caption: 'Get Advice',
                  // onTap: () => BlocProvider.of<AdviserBloc>(context).add(AdviceRequestedEvent()),
                  onTap: () => BlocProvider.of<AdviserCubit>(context).adviceRequested(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
