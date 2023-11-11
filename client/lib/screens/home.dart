import 'package:client/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1024),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Column(
                children: [
                  HeroImage(),
                  SizedBox(
                    height: 16,
                  ),
                  HeroText(),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GetStartedButton(),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset('assets/house.png'));
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
        style: GoogleFonts.roboto(
            fontSize: 18, fontWeight: FontWeight.w400),
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
