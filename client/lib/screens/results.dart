import 'package:client/provider/prediction_provider.dart';
import 'package:client/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PredictionProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return Scaffold(
          appBar: AppBar(
            // elevation: 0,
            actions: const [
              // button to toggle dark mode
              ThemeToggleButton(),
              SizedBox(
                width: 16,
              )
            ],
          ),
          body: Container(
            constraints: const BoxConstraints(maxWidth: 1024),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SelectedDataCard(),
                SizedBox(
                  height: 16,
                ),
                PredictedPriceCard(),
              ],
            ),
          ));
    });
  }
}

class PredictedPriceCard extends StatelessWidget {
  const PredictedPriceCard({
    super.key,
  });

  static var currencyFormatter = NumberFormat.simpleCurrency(
    locale: 'en_IN',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.monetization_on,
                  color: Colors.green,
                  size: 48,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Predicted Price',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              // "₹ ${context.watch<PredictionProvider>().predictionResult.toString()}",
              currencyFormatter
                  .format(context.watch<PredictionProvider>().predictionResult),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedDataCard extends StatelessWidget {
  const SelectedDataCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 48,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    context.watch<PredictionProvider>().city,
                    style: GoogleFonts.roboto(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Area: ${context.watch<PredictionProvider>().area.toString()} sqft",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Bedrooms: ${context.watch<PredictionProvider>().bedrooms.toString()}",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        'Maintenance: ${context.watch<PredictionProvider>().maintenance ? 'Yes' : 'No'}',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    const VerticalDivider(),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                        '24x7 Security: ${context.watch<PredictionProvider>().security ? 'Yes' : 'No'}',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
