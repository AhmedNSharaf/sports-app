// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sports_app/data/models/LeagueData.dart';
import 'package:sports_app/data/reposetories/LeagusRepo.dart';
import 'package:sports_app/utils/colors.dart';

class LeaguesScreen extends StatefulWidget {
  final int countryKey;

  LeaguesScreen({super.key, required this.countryKey});

  @override
  _LeaguesScreenState createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  late Future<LeagueData> futureLeaguesData;

  @override
  void initState() {
    super.initState();
    futureLeaguesData = LeaguesRepo().fetchLeaguesData(widget.countryKey);
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
          'Leagues',
          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<LeagueData>(
        future: futureLeaguesData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load leagues data'));
          } else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
            return const Center(child: Text('No leagues available'));
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
                var league = snapshot.data!.result[index];
                return Card(
                  color: thirdColor,
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (league.leagueLogo != null && league.leagueLogo!.isNotEmpty)
                        Image.network(
                          league.leagueLogo!,
                          height: 50,
                          width: 50,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, color: secondaryColor);
                          },
                        )
                      else
                        const Icon(Icons.sports_soccer, color: secondaryColor, size: 50),
                      const SizedBox(height: 10),
                      Text(
                        league.leagueName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
