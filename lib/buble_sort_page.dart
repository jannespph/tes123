import 'package:flutter/material.dart';

class BubleSortPage extends StatefulWidget {
  const BubleSortPage({super.key});

  @override
  State<BubleSortPage> createState() => _BubleSortPageState();
}

class _BubleSortPageState extends State<BubleSortPage> {
  final formKey = GlobalKey<FormState>();
  final tecData = TextEditingController();
  final tecSblmUrut = TextEditingController();
  final tecStlhUrut = TextEditingController();
  List<int> list = [];

  void bubbleSort(List<int> arr) {
    int n = arr.length;
    for (int i = 0; i < n; i++) {
      for (int j = 1; j < (n - i); j++) {
        if (arr[j - 1] > arr[j]) {
          int temp = arr[j - 1];
          arr[j - 1] = arr[j];
          arr[j] = temp;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bubble Sort'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // Input Data
                TextFormField(
                  controller: tecData,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Data masih kosong' : null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Data ke-',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Buttons Input & Clear
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          int? data = int.tryParse(tecData.text);
                          if (data != null) {
                            setState(() {
                              list.add(data);
                              tecData.clear();
                            });
                          }
                        }
                      },
                      child: const Text('Input Data'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          list.clear();
                          tecSblmUrut.clear();
                          tecStlhUrut.clear();
                        });
                      },
                      child: const Text('Hapus Data'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Tampilkan List Data
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Text('Data : ${list.join(', ')}'),
                ),
                const SizedBox(height: 20),

                // Data sebelum sorting
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecSblmUrut,
                  decoration: InputDecoration(
                    labelText: 'Data sebelum pengurutan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Data setelah sorting
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecStlhUrut,
                  decoration: InputDecoration(
                    labelText: 'Data setelah pengurutan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Button Sorting
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (list.isEmpty) return;

                      setState(() {
                        // Data sebelum sorting
                        tecSblmUrut.text = list.join(' ');

                        // Sorting
                        bubbleSort(list);

                        // Data setelah sorting
                        tecStlhUrut.text = list.join(' ');
                      });
                    },
                    child: const Text('URUTKAN'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
