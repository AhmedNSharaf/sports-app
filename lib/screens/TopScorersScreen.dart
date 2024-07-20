import 'package:flutter/material.dart';
import 'package:sports_app/data/models/PlayersData.dart';
import 'package:sports_app/data/reposetories/TopScorersRepo.dart';
import 'package:sports_app/utils/colors.dart';

class TopScorersScreen extends StatefulWidget {
  final int leagueId;

  TopScorersScreen({super.key, required this.leagueId});

  @override
  _TopScorersScreenState createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> {
  late Future<TopScorersData> futureTopScorersData;

  @override
  void initState() {
    super.initState();
    futureTopScorersData =
        TopScorersRepo().fetchTopScorersData(widget.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: secondaryColor),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   backgroundColor: primaryColor,
      //   centerTitle: true,
      //   title: const Text(
      //     'Top Scorers',
      //     style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: FutureBuilder<TopScorersData>(
        future: futureTopScorersData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Failed to load top scorers data',
              style: TextStyle(color: secondaryColor),
            ));
          } else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
            return const Center(child: Text('No top scorers available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.result.length,
              itemBuilder: (context, index) {
                var scorer = snapshot.data!.result[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: thirdColor,
                    child: Text(
                      scorer.playerPlace.toString(),
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
                  title: Text(
                    scorer.playerName,
                    style: const TextStyle(
                        color: secondaryColor, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${scorer.teamName} - Goals: ${scorer.goals}, Penalty Goals: ${scorer.penaltyGoals}',
                    style: const TextStyle(color: secondaryColor),
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
