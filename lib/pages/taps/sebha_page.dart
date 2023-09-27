// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/providers/languae_provider.dart';
import 'package:provider/provider.dart';

class SebhaPage extends StatefulWidget {
  const SebhaPage({super.key});

  @override
  State<SebhaPage> createState() => _SebhaPageState();
}

class _SebhaPageState extends State<SebhaPage> {
  int counter = 1;
  double angel = 1;
  String txt = 'سبحان الله';
  int oneHundred = 0;

  @override
  Widget build(BuildContext context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context);
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 60),
                    margin: const EdgeInsets.only(top: 20),
                    child: Transform.rotate(
                      angle: angel,
                      child: provider.mode == ThemeMode.light
                          ? Image.asset(
                              'assets/images/body_of_seb7a.png',
                              fit: BoxFit.fill,
                              height: 200,
                            )
                          : Image.asset(
                              'assets/images/dark_body_of_seb7a.png',
                              fit: BoxFit.fill,
                              height: 250,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text(
                      '$oneHundred',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 100,
                          ),
                    ),
                  )
                ],
              ),
              provider.mode == ThemeMode.light
                  ? Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 16),
                      child: Image.asset('assets/images/head_of_seb7a.png'),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 16),
                      child:
                          Image.asset('assets/images/dark_head_of_seb7a.png'),
                    )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            AppLocalizations.of(context)!.numberOfTasbeh,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '$counter',
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.error,
            ),
            child: InkWell(
              onTap: () {
                counter++;
                angel++;
                if (counter > 0 && counter < 33) {
                  txt = 'سبحان الله';
                } else if (counter > 33 && counter < 66) {
                  txt = 'الحمدالله';
                } else if (counter > 66 && counter < 99) {
                  txt = 'لا اله الا الله';
                } else if (counter > 99 && counter <= 100) {
                  txt = 'الله اكبر';
                  oneHundred++;
                  counter = 0;
                }

                setState(() {});
              },
              child: Text(
                txt,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}
