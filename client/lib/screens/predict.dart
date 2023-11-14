import 'dart:convert';

import 'package:client/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:client/provider/prediction_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Predict extends StatelessWidget {
  const Predict({super.key});

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
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            child: const Column(
              children: [PredictForm()],
            ),
          ),
        ));
  }
}

class PredictForm extends StatefulWidget {
  const PredictForm({super.key});

  @override
  State<PredictForm> createState() => _PredictFormState();
}

class _PredictFormState extends State<PredictForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const List<DropdownMenuItem<bool>> _yesNo = [
    DropdownMenuItem(
      value: true,
      child: Text('Yes'),
    ),
    DropdownMenuItem(
      value: false,
      child: Text('No'),
    ),
  ];

  String? _city;
  String? _area;
  String? _bedrooms;
  bool? _maintenance;
  bool? _security;

  void setCity(String? value) {
    setState(() {
      _city = value;
    });
  }

  void setArea(String? value) {
    setState(() {
      _area = value;
    });
  }

  void setBedrooms(String? value) {
    setState(() {
      _bedrooms = value;
    });
  }

  void setMaintenance(bool? value) {
    setState(() {
      _maintenance = value;
    });
  }

  void setSecurity(bool? value) {
    setState(() {
      _security = value;
    });
  }

  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Processing Data')));

      var requestBody = jsonEncode({
        "city": _city,
        "area": int.parse(_area!),
        "no_of_bedrooms": int.parse(_bedrooms!),
        "maintenance_staff": _maintenance,
        "security": _security
      });

      try {
        final response = await http.post(
            Uri.parse("http://localhost:8000/predict"),
            headers: {"Content-Type": "application/json"},
            body: requestBody);

        if (!context.mounted) return;
        context.read<PredictionProvider>().city = _city!;
        context.read<PredictionProvider>().area = int.parse(_area!);
        context.read<PredictionProvider>().bedrooms = int.parse(_bedrooms!);
        context.read<PredictionProvider>().maintenance = _maintenance!;
        context.read<PredictionProvider>().security = _security!;
        context.read<PredictionProvider>().predictionResult =
            await jsonDecode(response.body)['prediction'];
        if (!context.mounted) return;
        Navigator.pushNamed(context, '/results');
      } catch (e) {
        print(e);
        if (!context.mounted) return;
        //  show and error alert
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Something went wrong'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok'))
                ],
              );
            });
      }

      // Navigator.pushNamed(context, '/results');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Enter your preferences',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                      fontSize: 24, fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 32,
              ),
              CitySelect(setCity: setCity),
              const SizedBox(
                height: 16,
              ),
              AreaInput(setArea: setArea),
              const SizedBox(
                height: 16,
              ),
              BedroomInput(setBedrooms: setBedrooms),
              const SizedBox(
                height: 16,
              ),
              MaintenanceSelect(yesNo: _yesNo, setMaintenance: setMaintenance),
              const SizedBox(
                height: 16,
              ),
              SecuritySelect(yesNo: _yesNo, setSecurity: setSecurity),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [PredictSubmitButton(handleSubmit: handleSubmit)],
              ))
            ],
          ),
        ));
  }
}

class PredictSubmitButton extends StatelessWidget {
  const PredictSubmitButton({
    super.key,
    required this.handleSubmit,
  });

  final Function handleSubmit;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: () => handleSubmit(),
        child: Text(
          'Predict',
          style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400),
        ));
  }
}

class SecuritySelect extends StatelessWidget {
  const SecuritySelect(
      {super.key,
      required List<DropdownMenuItem<bool>> yesNo,
      required this.setSecurity})
      : _yesNo = yesNo;

  final List<DropdownMenuItem<bool>> _yesNo;
  final Function setSecurity;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: '24x7 Security',
        ),
        validator: (value) {
          if (value == null) {
            return 'Please select an option';
          }
          return null;
        },
        items: _yesNo,
        onChanged: (value) => setSecurity(value));
  }
}

class MaintenanceSelect extends StatelessWidget {
  const MaintenanceSelect({
    super.key,
    required List<DropdownMenuItem<bool>> yesNo,
    required this.setMaintenance,
  }) : _yesNo = yesNo;

  final List<DropdownMenuItem<bool>> _yesNo;
  final Function setMaintenance;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Maintenance staff',
        ),
        validator: (value) {
          if (value == null) {
            return 'Please select an option';
          }
          return null;
        },
        items: _yesNo,
        onChanged: (value) => setMaintenance(value));
  }
}

class BedroomInput extends StatelessWidget {
  const BedroomInput({
    super.key,
    required this.setBedrooms,
  });

  final Function setBedrooms;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'No. of bedrooms',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter no. of bedrooms';
        }
        return null;
      },
      onChanged: (value) => setBedrooms(value),
    );
  }
}

class AreaInput extends StatelessWidget {
  const AreaInput({
    super.key,
    required this.setArea,
  });

  final Function setArea;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Area in sqft',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter area';
        }
        return null;
      },
      onChanged: (value) => setArea(value),
    );
  }
}

class CitySelect extends StatelessWidget {
  const CitySelect({super.key, required this.setCity});

  final Function setCity;

  static const List<DropdownMenuItem<String>> _cities = [
    DropdownMenuItem(
      value: 'Kolkata',
      child: Text('Kolkata'),
    ),
    DropdownMenuItem(
      value: 'Mumbai',
      child: Text('Mumbai'),
    ),
    DropdownMenuItem(
      value: 'Delhi',
      child: Text('Delhi'),
    ),
    DropdownMenuItem(
      value: 'Chennai',
      child: Text('Chennai'),
    ),
    DropdownMenuItem(
      value: 'Bangalore',
      child: Text('Bangalore'),
    ),
    DropdownMenuItem(
      value: 'Hyderabad',
      child: Text('Hyderabad'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Select a city',
      ),
      items: _cities,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a city';
        }
        return null;
      },
      onChanged: (value) => setCity(value),
    );
  }
}
