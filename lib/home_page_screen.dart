import 'package:demo_project/src/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  showToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter your name first.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.push('/name'),
              child: RichText(
                text: TextSpan(
                  text: 'Hi, ',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: counter.name.isEmpty ? '_ _ _ _ _' : counter.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Your count is:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Text(
              '${counter.count}',
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    counter.name.isEmpty
                        ? showToast(context)
                        : counter.increment();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.1,
                          ), // subtle black shadow
                          blurRadius: 8,
                          spreadRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(child: const Icon(Icons.add, size: 35)),
                  ),
                ),

                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    counter.name.isEmpty
                        ? showToast(context)
                        : counter.decrement();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          spreadRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(child: const Icon(Icons.remove, size: 35)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
