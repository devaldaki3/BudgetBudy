import 'package:flutter/material.dart';

import '../database/db_helper.dart';
import '../models/party.dart';
import 'add_party_screen.dart';
import 'party_profile_screen.dart';
import 'home_screen.dart';

class PartyListScreen extends StatefulWidget {
  static const routeName = '/khatabook';
  const PartyListScreen({Key? key}) : super(key: key);

  @override
  State<PartyListScreen> createState() => _PartyListScreenState();
}

class _PartyListScreenState extends State<PartyListScreen> {
  late Future<List<Party>> _futureParties;

  @override
  void initState() {
    super.initState();
    _futureParties = DBHelper.getAllParties();
  }

  Future<void> _refresh() async {
    setState(() {
      _futureParties = DBHelper.getAllParties();
    });
  }

  Future<List<double>> _computeTotals(List<Party> parties) async {
    double totalGive = 0;
    double totalGet = 0;
    for (final p in parties) {
      final bal = await DBHelper.getPartyBalance(p.id!);
      if (bal > 0) {
        totalGive += bal;
      } else if (bal < 0) {
        totalGet += bal.abs();
      }
    }
    return [totalGive, totalGet];
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    }
    return (parts[0].substring(0, 1) + parts[1].substring(0, 1)).toUpperCase();
  }

  Color _getColorFromName(String name) {
    final colors = [
      Colors.blue.shade400,
      Colors.purple.shade400,
      Colors.pink.shade400,
      Colors.teal.shade400,
      Colors.orange.shade400,
      Colors.indigo.shade400,
      Colors.cyan.shade400,
      Colors.deepOrange.shade400,
    ];
    final index = name.codeUnitAt(0) % colors.length;
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khatabook'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
        ),
      ),
      body: FutureBuilder<List<Party>>(
        future: _futureParties,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final parties = snapshot.data ?? [];
          if (parties.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No parties yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the + button below to add your first party',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: _refresh,
            child: FutureBuilder<List<double>>(
              future: _computeTotals(parties),
              builder: (context, totalsSnap) {
                final give =
                    (totalsSnap.data != null) ? totalsSnap.data![0] : 0.0;
                final get =
                    (totalsSnap.data != null) ? totalsSnap.data![1] : 0.0;
                return ListView.builder(
                  itemCount: parties.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'You will give',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '₹ ${give.toStringAsFixed(0)}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  width: 1,
                                  height: 36,
                                  color: Colors.grey.shade300),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'You will get',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '₹ ${get.toStringAsFixed(0)}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    final p = parties[index - 1];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        elevation: 2,
                        shadowColor: Colors.black.withOpacity(0.1),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => PartyProfileScreen(party: p),
                              ),
                            );
                            _refresh();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: Row(
                              children: [
                                // Avatar with initials
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: _getColorFromName(p.name),
                                  child: Text(
                                    _getInitials(p.name),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Name only
                                Expanded(
                                  child: Text(
                                    p.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                // Balance text only (no background badge)
                                FutureBuilder<double>(
                                  future: DBHelper.getPartyBalance(p.id!),
                                  builder: (context, snap) {
                                    final bal = (snap.data ?? 0);
                                    final Color textColor = bal == 0
                                        ? Colors.grey.shade700
                                        : (bal > 0
                                            ? Colors.red.shade700
                                            : Colors.green.shade700);
                                    return Text(
                                      '₹ ${bal.abs().toStringAsFixed(0)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                        color: textColor,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFA80852),
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        onPressed: () async {
          final changed = await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddPartyScreen()),
          );
          if (changed == true) _refresh();
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Party'),
      ),
    );
  }
}
