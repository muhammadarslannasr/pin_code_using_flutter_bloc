import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Dynamic height image

            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 6,
              ),
              // alignment: Alignment.center,
              // color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.8,
              // alignment: Alignment.center, // This is needed
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://cdn4.vectorstock.com/i/1000x1000/59/28/online-store-concept-banner-vertical-vector-25535928.jpg',
                  fit: BoxFit.fitHeight,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),

            const SizedBox(height: 16.0),

            const Text('Text Container 1'),

            // Spaces
            const SizedBox(height: 16.0),

            const Text('Text Container 2'),

            // Spaces
            const SizedBox(height: 16.0),

            const Text('Text Container 3'),

            // Spaces
            const SizedBox(height: 16.0),

            // Fixed button
            SizedBox(
              width: 100, // <-- Your width
              height: 50, // <-- Your height
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Text('Click Me'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
