// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sports_app/data/models/CountriesData.dart';
import 'package:sports_app/data/reposetories/CountriesRepo.dart';
import 'package:sports_app/screens/leagusScreen.dart';
import 'package:sports_app/utils/colors.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  late Future<CountriesData> futureCountriesData;

  @override
  void initState() {
    super.initState();
    futureCountriesData = CountriesRepo().fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: secondaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'Countries',
          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<CountriesData>(
        future: futureCountriesData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load countries data'));
          } else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
            return const Center(child: Text('No countries available'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4.2 / 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(5),
              itemCount: snapshot.data!.result.length,
              itemBuilder: (context, index) {
                var country = snapshot.data!.result[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LeaguesScreen(countryKey: country.countryKey),
                      ),
                    );
                  },
                  child: Card(
                    color: thirdColor,
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (country.countryLogo != null &&
                            country.countryLogo!.isNotEmpty &&
                            country.countryName != 'Israel')
                          Image.network(
                            country.countryLogo!,
                            height: 50,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error,
                                  color: secondaryColor);
                            },
                          )
                        else
                          const Icon(Icons.flag,
                              color: secondaryColor, size: 50),
                        const SizedBox(height: 10),
                        if (country.countryName == 'Israel')
                          Text(
                            'Free\nPalestine',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        else
                          Text(
                            country.countryName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
