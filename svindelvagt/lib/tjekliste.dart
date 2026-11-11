import 'package:flutter/material.dart';

class TjeklisteSkarm extends StatelessWidget {
  const TjeklisteSkarm({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen over advarselsspørgsmål – nem at udvide senere!
    final advarsler = [
      'Presser de dig til at handle NU?',
      'Bedes du om MobilePay, gavekort eller krypto?',
      'Bedes du om CPR-, bank- eller kortoplysninger?',
      'Er kontakten uventet – "banken", "politiet" eller "Microsoft"?',
      'Tør du ikke lægge på, af frygt for konsekvenser?',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tjeklisten', style: TextStyle(fontSize: 26)),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Pas på, hvis du kan svare JA:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: advarsler.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.warning, color: Colors.red, size: 40),
                    title: Text(
                      advarsler[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
          // Den grønne "hvad gør jeg"-boks
          Container(
            color: Colors.green.shade50,
            padding: const EdgeInsets.all(20),
            child: const Text(
              'I tvivl? Læg på – og ring selv til det officielle nummer!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}