import 'package:url_launcher/url_launcher.dart';
import 'hjaelp.dart';
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
    Future<void> _ringOp() async {
    final uri = Uri(scheme: 'tel', path: '12345678');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Kunne ikke starte opkald');
    }
  }

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
                   onPressed: _ringOp,
              ),
            ),
           ),

             Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Ring til: (hjælpelinje her)',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HjaelpSkarm()),
                      );
                    },
                    child: const Text(
                      'Vis guiden (3 trin) →',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
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