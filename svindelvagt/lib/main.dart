import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tjekliste.dart';
import 'sikre_ord.dart';
import 'hjaelp.dart';
import 'opsaetning.dart';

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

class HjemSkarm extends StatefulWidget {
  const HjemSkarm({super.key});

  @override
  State<HjemSkarm> createState() => _HjemSkarmState();
}

class _HjemSkarmState extends State<HjemSkarm> {
  String _hjaelperNavn = '';
  String _hjaelperNummer = '';

  @override
  void initState() {
    super.initState();
    _hentGemteVaerdier();
  }

  Future<void> _hentGemteVaerdier() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _hjaelperNavn = prefs.getString('hjaelper_navn') ?? '';
      _hjaelperNummer = prefs.getString('hjaelper_nummer') ?? '';
    });
  }

  Future<void> _ringOp() async {
    if (_hjaelperNummer.isEmpty) {
      debugPrint('Intet nummer gemt - åbn Opsætning');
      return;
    }
    final uri = Uri(scheme: 'tel', path: _hjaelperNummer);
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

            // DEN STORE NØDKNAP – ringer til det GEMTE nummer
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

            // Viser hvem der ringes til – tryk her for at ændre
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    _hjaelperNavn.isEmpty
                        ? 'Ring til: (ingen hjælper gemt endnu)'
                        : 'Ring til: $_hjaelperNavn',
                    style: const TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OpsaetningSkarm()),
                      ).then((_) => _hentGemteVaerdier()); // opdater når man vender tilbage
                    },
                    child: const Text(
                      'Indstil hjælper (opsætning) →',
                      style: TextStyle(fontSize: 18),
                    ),
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