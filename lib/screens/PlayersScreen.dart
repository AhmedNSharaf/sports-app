import 'package:flutter/material.dart';
import 'package:sports_app/data/models/PlayersData.dart';
import 'package:sports_app/data/reposetories/PlayersRepo.dart';
import 'package:sports_app/utils/colors.dart';

class PlayersScreen extends StatefulWidget {
  final int teamId;

  PlayersScreen({super.key, required this.teamId});

  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  late Future<PlayersData> futurePlayersData;
  late TextEditingController _searchController;
  List<Result> players = [];
  List<Result> filteredPlayers = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    futurePlayersData = PlayersRepo().fetchPlayersData(widget.teamId);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterPlayers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPlayers = players;
      } else {
        filteredPlayers = players
            .where((player) =>
                player.playerName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showPlayerDetails(Result player) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          title: Text(
            player.playerName,
            style: TextStyle(color: secondaryColor),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (player.playerImage != null && player.playerImage!.isNotEmpty)
                Image.network(
                  player.playerImage!,
                  height: 100,
                  width: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, color: secondaryColor);
                  },
                )
              else
                const Icon(Icons.person, color: secondaryColor, size: 100),
              const SizedBox(height: 10),
              Text(
                'Player Number: ${player.playerNumber ?? 'N/A'}',
                style: TextStyle(color: secondaryColor),
              ),
              Text(
                'Country: ${player.playerCountry ?? 'N/A'}',
                style: TextStyle(color: secondaryColor),
              ),
              Text(
                'Position: ${player.playerType}',
                style: TextStyle(color: secondaryColor),
              ),
              Text(
                'Age: ${player.playerAge ?? 'N/A'}',
                style: TextStyle(color: secondaryColor),
              ),
              Text(
                'Yellow Cards: ${player.playerYellowCards ?? 'N/A'}',
                style: TextStyle(color: secondaryColor),
              ),
              Text(
                'Red Cards: ${player.playerRedCards ?? 'N/A'}',
                style: TextStyle(color: secondaryColor),
              ),
              Text(
                'Goals: ${player.playerGoals ?? 'N/A'}',
                style: TextStyle(color: secondaryColor),
              ),
              Text(
                'Assists: ${player.playerAssists ?? 'N/A'}',
                style: TextStyle(color: secondaryColor),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          'Players',
          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a player',
                hintStyle: const TextStyle(color: secondaryColor),
                prefixIcon: const Icon(Icons.search, color: secondaryColor),
                filled: true,
                fillColor: thirdColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: _filterPlayers,
            ),
          ),
          Expanded(
            child: FutureBuilder<PlayersData>(
              future: futurePlayersData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text('Failed to load players data'));
                } else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
                  return const Center(child: Text('No players available'));
                } else {
                  players = snapshot.data!.result;
                  filteredPlayers = players;
                  return ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: filteredPlayers.length,
                    itemBuilder: (context, index) {
                      var player = filteredPlayers[index];
                      return Card(
                        color: thirdColor,
                        elevation: 5,
                        child: ListTile(
                          leading: player.playerImage != null &&
                                  player.playerImage!.isNotEmpty
                              ? Image.network(
                                  player.playerImage!,
                                  height: 50,
                                  width: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error,
                                        color: secondaryColor);
                                  },
                                )
                              : const Icon(Icons.person,
                                  color: secondaryColor, size: 50),
                          title: Text(
                            player.playerName,
                            style: const TextStyle(
                              fontSize: 16,
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            player.playerType,
                            style: const TextStyle(color: secondaryColor),
                          ),
                          onTap: () => _showPlayerDetails(player),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
