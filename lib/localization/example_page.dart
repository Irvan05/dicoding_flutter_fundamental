import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExamplePage extends StatelessWidget {
  static const routeName = '/localization/example_page';
  ExamplePage({Key? key}) : super(key: key);

  final DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('localization'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.nThings(5, "Buku"),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              AppLocalizations.of(context)!.myApple(0),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              AppLocalizations.of(context)!.todayDate(DateTime.now()),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              DateFormat.yMMMEd().format(dateTime),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              DateFormat('EEE, MMM dd, yyyy', 'en_US').format(dateTime),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              AppLocalizations.of(context)!.myNumber(123456),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              NumberFormat("#,###", "en_US").format(1200000),
            ),
            Text(
              NumberFormat.decimalPattern("en_US").format(1200000),
            ),
            Text(
              AppLocalizations.of(context)!.helloWorld("Dicoding"),
            ),
            Text(
              AppLocalizations.of(context)!.address("Bandung", "Indonesia"),
            ),
            Localizations.override(
                context: context,
                locale: const Locale('id'),
                child: Builder(
                  builder: (BuildContext context) {
                    return Text(AppLocalizations.of(context)!.titleApp);
                  },
                )),
          ],
        ),
      ),
    );
  }
}

/*
Kategori Bentuk Jamak	Format Teks untuk Variabel count
zero

=0{no apples}

one

=1{one apple}

two

=2(two apples}

few

few{the {count} apples}

3-10, fractions

many{{count} apples}

other

other{{count} apples}
*/

/*
Pola Format	
Hasil dalam lokal “en_US”

DateFormat.yMd()

1/21/2022

DateFormat(‘yMd’)

1/21/2022

DateFormat.yMMMd(‘en_US’)

Fri, Jan 21, 2022

DateFormat.jm()

1:50 PM

DateFormat.yMd().add_jm()

1/21/2022 1:50 PM

DateFormat.Hm()

13:50

*/

/*
Konstruktor pada NumberFormat	Keluaran untuk nilai 1200000 (lokal: en_US)
compact	“1.2M”
compactCurrency*	“USD1.2M”
compactSimpleCurrency*

“$1.2M”

compactLong

“1.2 million”

currency*

“USD1,200,000.00”

decimalPattern

“1,200,000”

decimalPercentPattern*

“120,000,000%”

percentPattern

“120,000,000%”

scientificPattern

“1E6”

simpleCurrency*

“$1,200,000.00”

String myNumberFormat = NumberFormat.simpleCurrency(decimalDigits: 3).format(1200000);
// print(myNumberFormat); // => $1,200,000.000

*/