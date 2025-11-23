import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final String text;
  final double fontSize;

  const PreviewPage({
    super.key,
    required this.text,
    required this.fontSize,
  });

  static const Color purple = Color(0xFF6B4D6D);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, null);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Preview')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              Center(
                child: Text(
                  text.isEmpty ? ' ' : text,
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, 'ok');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Ok'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  SizedBox(
                    width: 120,
                    height: 44,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context, 'cancel');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: purple,
                        side: const BorderSide(color: purple, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
