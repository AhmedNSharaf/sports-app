// teams_tab.dart

import 'package:flutter/material.dart';
import 'package:sports_app/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:sports_app/data/models/TeamsData.dart';
import 'package:sports_app/data/reposetories/TeamsRepo.dart';
import 'package:sports_app/utils/colors.dart';

class TeamsTab extends StatefulWidget {
  final int leagueId;

  TeamsTab({super.key, required this.leagueId});

  @override
  _TeamsTabState createState() => _TeamsTabState();
}

class _TeamsTabState extends State<TeamsTab> {
  late Future<TeamsData> futureTeamsData;

  @override
  void initState() {
    super.initState();
    futureTeamsData = TeamsRepo().fetchTeamsData(widget.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TeamsData>(
      future: futureTeamsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
          return const Center(
              child: Text(
            'Failed to load teams data',
            style: TextStyle(color: secondaryColor),
          ));
        }
        else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
          return const Center(child: Text('No teams available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.result.length,
            itemBuilder: (context, index) {
              var team = snapshot.data!.result[index];
              return ListTile(
                title: Text(
                  team.teamName ?? 'No Name',
                  style: const TextStyle(color: secondaryColor),
                ),
                leading: team.teamLogo != null
                    ? Image.network(
                        team.teamLogo!,
                        height: 50,
                        width: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error, color: secondaryColor);
                        },
                      )
                    : const Icon(Icons.error, color: secondaryColor),
              );
            },
          );
        }
      },
    );
  }
}

// league_details_tab.dart

class LeagueDetailsTab extends StatelessWidget {
  final int leagueId;

  LeagueDetailsTab({super.key, required this.leagueId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'League Details for ID: $leagueId',
        style: TextStyle(color: secondaryColor, fontSize: 20),
      ),
    );
  }
}
