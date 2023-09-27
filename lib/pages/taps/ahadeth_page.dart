import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/model/hadith_model.dart';
import 'package:islamic_app/model/my_them_data.dart';
import 'package:islamic_app/pages/ahadth_details.dart';

class AhadethPage extends StatefulWidget {
  const AhadethPage({super.key});

  @override
  State<AhadethPage> createState() => _AhadethPageState();
}

class _AhadethPageState extends State<AhadethPage> {
  List<HadaithModel> ahadthList = [];

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/ahadeth_image.png',
              width: 300,
              height: 200,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSecondary),
              textAlign: TextAlign.center,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          ahadthList.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: MyThemData.primryColor,
                    ),
                  ),
                )
              : SliverList.separated(
            separatorBuilder: (context, index) => Divider(
                    endIndent: 40,
                    indent: 40,
                    thickness: 2,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  itemBuilder: (context, index) => Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AhadethDetails.routeName,
                            arguments: ahadthList[index]);
                      },
                      child: Text(
                        ahadthList[index].title,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'assets/fonts/KOUFIBD.TTF'),
                      ),
                    ),
                  ),
                  itemCount: ahadthList.length,
                )
        ],
      ),
    );
  }

  void loadFile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((hadeth) {
      List<String> hadethOne = hadeth.split('#');
      for (int i = 0; i < hadethOne.length; i++) {
        String firstHadeth = hadethOne[i];
        List<String> lines = firstHadeth.trim().split('\n');
        String title = lines[0];
        lines.removeAt(0);
        ahadthList.add(HadaithModel(contain: lines, title: title));
        setState(() {});
      }
    }).catchError((e) {});
  }
}
