import 'package:flutter/material.dart';
import 'preview_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 25.0;

  static const String robotUrl =
      'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090';

  static const Color purple = Color(0xFF6B4D6D);

  Future<void> _openPreview() async {
    final text = _textController.text;
    final String? result = await Navigator.push<String?>(
      context,
      MaterialPageRoute(
        builder: (_) => PreviewPage(text: text, fontSize: _fontSize),
      ),
    );

    if (result == 'ok') {
      _showResultDialog('Cool!');
    } else if (result == 'cancel') {
      _showResultDialog("Let's try something else.");
    } else {
      _showResultDialog("Don't know what to say");
    }
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8FB),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                robotUrl,
                width: 72,
                height: 72,
                errorBuilder: (context, error, stackTrace) =>
                const SizedBox.shrink(),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: purple,
                    textStyle: const TextStyle(fontSize: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                  ),
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text previewer')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 12.0),
                  ),
                ),

                const SizedBox(height: 6),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter some text',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),

                const SizedBox(height: 18),

                Row(
                  children: [
                    Text('Font size: ${_fontSize.toStringAsFixed(0)}',
                        style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 26),
                    Expanded(
                      child: Slider(
                        value: _fontSize,
                        min: 1,
                        max: 100,
                        onChanged: (v) => setState(() => _fontSize = v),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 140,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: _openPreview,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B4D6D),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                    ),
                    child: const Text('Preview'),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
