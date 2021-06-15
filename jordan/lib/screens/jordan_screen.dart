import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';

//////////////////////////////////////////////////////////////////////////
/// Displays prayer through the intercession of Blessed Francis Jordan ///
//////////////////////////////////////////////////////////////////////////
class JordanPage extends StatelessWidget {
  const JordanPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Hero(
                tag: 'jordan',
                child: Image.asset(
                  "assets/Jordan_414px.jpg",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Modlitwa przez wstawiennictwo Bł. Franciszka Marii od Krzyża Jordana",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  // color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Panie Jezu Chryste, Zbawicielu świata, * przez wstawiennictwo Błogosławionego Franciszka Marii od Krzyża Jordana, * któremu udzieliłeś daru głębokiej i żywej wiary, * niezachwianej nadziei i heroicznej miłości Boga i bliźniego * oraz wielkiej gorliwości o zbawienie dusz, * prosimy Cię, * obdarz nas głęboką wiarą i otwartym sercem, * abyśmy nigdy nie spoczęli w poznawaniu Ciebie i głoszeniu Ewangelii wszystkim narodom. * Udziel nam również łaski, * o którą Cię pokornie prosimy. * Który żyjesz i królujesz na wieki wieków. * Amen.",
                softWrap: true,
                style: TextStyle(
                  fontSize: 20,
                  // color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
