import 'package:flutter/material.dart';
import 'tjekliste.dart';
import 'sikre_ord.dart';

void main() {
  runApp(const SvindelvagtApp());
}

class SvindelvagtApp extends StatelessWidget {
  const SvindelvagtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Svindelvagt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HjemSkarm(),
    );
  }
}

class HjemSkarm extends StatelessWidget {
  const HjemSkarm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Overskrift
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                'Svindelvagt',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const Text(
              'Er du i tvivl om et opkald?',
              style: TextStyle(fontSize: 22),
            ),

            const Spacer(),

            // DEN STORE NØDKNAP
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                width: double.infinity,
                height: 120,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  icon: const Icon(Icons.phone_in_talk, size: 48),
                  label: const Text(
                    'RING TIL HJÆLP',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    // Fase 1: her kommer opkalds-guiden.
                    // Fase 2: her kobles det centrale nummer på.
                  },
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Ring til: (hjælpelinje her)',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),

            const Spacer(),

            // To knapper i bunden
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(24),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TjeklisteSkarm()),
                        );
                      },
                      child: const Text('Tjekliste', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(24),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SikreOrdSkarm()),
                        );
                      },
                      child: const Text('Sikre ord', style: TextStyle(fontSize: 20)),
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