import 'package:client/screens/home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
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
  }
}

class PredictedPriceCard extends StatelessWidget {
  const PredictedPriceCard({
    super.key,
  });

  static BarChartData data = BarChartData(
    maxY: 100,
    minY: 0,
  );

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
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
            SizedBox(
              height: 16,
            ),
            Text(
              '₹ 1,00,00,000',
              style: TextStyle(
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
                    'Kolkata',
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
              const Text(
                'Area: 1000 sqft',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Bedrooms: 2',
                style: TextStyle(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Maintenance: Yes',
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
                    Text('24x7 Security: Yes',
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
