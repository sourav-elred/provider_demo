import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/view_models/data_view_model.dart';
import 'package:tuple/tuple.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<DataViewModel>(
              builder: (context, dataModel, child) {
                return Text('Data: ${dataModel.data}');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update data using Provider
                Provider.of<DataViewModel>(context, listen: false)
                    .updateData('New Data');

                // Example of using a Tuple
                Tuple2<int, String> tuple = const Tuple2(42, 'Hello');
                debugPrint('Tuple Example: ${tuple.item1}, ${tuple.item2}');
              },
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
