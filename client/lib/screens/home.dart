import 'package:client/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              'logo.svg',
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
            )),
        actions: const [
          // button to toggle dark mode
          ThemeToggleButton(),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1024),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const HeroImage(),
                          const SizedBox(
                            height: 32,
                          ),
                          const HeroText(),
                          const SizedBox(
                            height: 8,
                          ),
                          const HeroDescription(),
                          const SizedBox(
                            height: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.info_outline,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'How it works?',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          '1. Enter the details of your dream home.',
                                          style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '2. Click on the "Get Started" button.',
                                          style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '3. Get the predicted price of your dream home.',
                                          style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     FractionallySizedBox(
                          //       widthFactor: 0.5,
                          //       child: Card(
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(16)),
                          //         child: Container(
                          //           padding: const EdgeInsets.all(16),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Row(
                          //                 children: [
                          //                   Icon(
                          //                     Icons.info_outline,
                          //                     color: Theme.of(context)
                          //                         .colorScheme
                          //                         .primary,
                          //                   ),
                          //                   const SizedBox(
                          //                     width: 8,
                          //                   ),
                          //                   Text(
                          //                     'About',
                          //                     style: GoogleFonts.roboto(
                          //                         fontSize: 24,
                          //                         fontWeight: FontWeight.w500),
                          //                   ),
                          //                 ],
                          //               ),
                          //               const SizedBox(
                          //                 height: 16,
                          //               ),
                          //               Text(
                          //                 'This is a simple web app that predicts the price of a house based on the area and number of bedrooms.',
                          //                 style: GoogleFonts.roboto(
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w300),
                          //               ),
                          //               const SizedBox(
                          //                 height: 8,
                          //               ),
                          //               Text(
                          //                 'The prediction is made using a machine learning model trained on a dataset of house prices in Bengaluru.',
                          //                 style: GoogleFonts.roboto(
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w300),
                          //               ),
                          //               const SizedBox(
                          //                 height: 8,
                          //               ),
                          //               Text(
                          //                 'The model is trained using the Random Forest Regressor algorithm.',
                          //                 style: GoogleFonts.roboto(
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w300),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     FractionallySizedBox(
                          //       widthFactor: 0.5,
                          //       child: Card(
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(16)),
                          //         child: Container(
                          //           padding: const EdgeInsets.all(16),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Row(
                          //                 children: [
                          //                   Icon(
                          //                     Icons.info_outline,
                          //                     color: Theme.of(context)
                          //                         .colorScheme
                          //                         .primary,
                          //                   ),
                          //                   const SizedBox(
                          //                     width: 8,
                          //                   ),
                          //                   Text(
                          //                     'Dataset',
                          //                     style: GoogleFonts.roboto(
                          //                         fontSize: 24,
                          //                         fontWeight: FontWeight.w500),
                          //                   ),
                          //                 ],
                          //               ),
                          //               const SizedBox(
                          //                 height: 16,
                          //               ),
                          //               Text(
                          //                 'The dataset used to train the model is the "Bengaluru House Price Dataset" from Kaggle.',
                          //                 style: GoogleFonts.roboto(
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w300),
                          //               ),
                          //               const SizedBox(
                          //                 height: 8,
                          //               ),
                          //               Text(
                          //                 'The dataset contains the following features:',
                          //                 style: GoogleFonts.roboto(
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w300),
                          //               ),
                          //               const SizedBox(
                          //                 height: 8,
                          //               ),
                          //               Text(
                          //                 '1. Area of the house in square feet.',
                          //                 style: GoogleFonts.roboto(
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w300),
                          //               ),
                          //               const SizedBox(
                          //                 height: 8,
                          //               ),
                          //               Text(
                          //                 '2. Number of bedrooms in the house.',
                          //                 style: GoogleFonts.roboto(
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w300),
                          //               ),
                          //               const SizedBox(
                          //                 height: 8,
                          //               ),
                          //               Text(
                          //                 '3. Number of bathrooms in the house.',
                          //                 style: GoogleFonts.roboto(
                          //                     fontSize: 18,
                          //                     fontWeight: FontWeight.w300),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // )
                          const SizedBox(
                            height: 32,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GetStartedButton(),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDescription extends StatelessWidget {
  const HeroDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Predict the price of your dream home based on your requirements.',
      style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w300),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxHeight: 450),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              image: const AssetImage('assets/house.png'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            )));
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.pushNamed(context, '/predict');
      },
      style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: Text(
        'Get Started',
        style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class HeroText extends StatelessWidget {
  const HeroText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "The ",
            style: GoogleFonts.roboto(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onBackground),
            children: [
          TextSpan(
              text: 'Power ',
              style: GoogleFonts.notoSerif(
                  fontStyle: FontStyle.italic,
                  fontSize: 48,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary)),
          TextSpan(
              text: 'to Predict, The Ease to Succeed!',
              style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onBackground)),
        ]));
  }
}

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<DarkThemeProvider>(context, listen: false).darkTheme =
              !Provider.of<DarkThemeProvider>(context, listen: false).darkTheme;
        },
        // icon based on dark mode
        icon: Icon(Provider.of<DarkThemeProvider>(context).darkTheme
            ? Icons.dark_mode
            : Icons.light_mode));
  }
}
