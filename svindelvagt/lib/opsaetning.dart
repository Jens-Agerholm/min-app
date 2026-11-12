import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpsaetningSkarm extends StatefulWidget {
  const OpsaetningSkarm({super.key});

   @override
  State<OpsaetningSkarm> createState() => _OpsaetningSkarmState();
}

class _OpsaetningSkarmState extends State<OpsaetningSkarm> {
  final _navnController = TextEditingController();
  final _nummerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _hentGemteVaerdier();
  }

  Future<void> _hentGemteVaerdier() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _navnController.text = prefs.getString('hjaelper_navn') ?? '';
      _nummerController.text = prefs.getString('hjaelper_nummer') ?? '';
    });
  }

  Future<void> _gem() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('hjaelper_navn', _navnController.text);
    await prefs.setString('hjaelper_nummer', _nummerController.text);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gemt!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _navnController.dispose();
    _nummerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opsætning', style: TextStyle(fontSize: 26)),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hvem skal ringes til, når der trykkes RING TIL HJÆLP?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _navnController,
              style: const TextStyle(fontSize: 24),
              decoration: const InputDecoration(
                labelText: 'Navn (fx "Min datter")',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nummerController,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Telefonnummer (fx 20123456)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: _gem,
                child: const Text(
                  'GEM',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}