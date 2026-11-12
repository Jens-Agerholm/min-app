import 'package:flutter/material.dart';

class HjaelpSkarm extends StatelessWidget {
  const HjaelpSkarm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ring til hjælp', style: TextStyle(fontSize: 26)),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Følg de tre trin – ét ad gangen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Trin-boksene
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text('1', style: TextStyle(fontSize: 24, color: Colors.white)),
                      ),
                      title: Text(
                        'Tryk på "Tilføj opkald" på din telefon',
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        'Knappen ses på opkalds-skærmen',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text('2', style: TextStyle(fontSize: 24, color: Colors.white)),
                      ),
                      title: Text(
                        'Ring til hjælpelinjen:',
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        'NUMMER KOMMER HER',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text('3', style: TextStyle(fontSize: 24, color: Colors.white)),
                      ),
                      title: Text(
                        'Tryk "Sammenføj", når hjælpen svarer',
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        'Nu er hjælpen med i opkaldet',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  // Talekortet
                  Card(
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Du kan sige til den, der ringer:',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '"Jeg har tilføjet min hjælper på linjen."',
                            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
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
}