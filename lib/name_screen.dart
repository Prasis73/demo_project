import 'package:demo_project/src/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        isButtonEnabled = _controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counter = context.read<CounterProvider>();

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                labelStyle: TextStyle(
                  color: Colors.black.withValues(alpha: 0.6),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Colors.black.withValues(alpha: 0.6),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Colors.black.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed:
                    isButtonEnabled
                        ? () {
                          counter.setName(_controller.text.trim());
                          context.pop();
                        }
                        : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isButtonEnabled
                          ? Colors.black
                          : Colors.black.withValues(alpha: 0.5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
