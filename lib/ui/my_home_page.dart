import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_demo/view_models/data_view_model.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataState = ref.watch(dataNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Data: ${dataState.currentData}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(dataNotifierProvider.notifier)
                    .updateData('Updated Data ${DateTime.now()}');
              },
              child: const Text('Add Data Update'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(dataNotifierProvider.notifier).clearData();
              },
              child: const Text('Clear Data'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: dataState.dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dataState.dataList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref
                            .read(dataNotifierProvider.notifier)
                            .removeDataAt(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
