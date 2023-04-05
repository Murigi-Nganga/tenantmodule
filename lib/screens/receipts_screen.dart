import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tenantmodule/widgets/side_drawer.dart';

class ReceiptsScreen extends StatefulWidget {
  const ReceiptsScreen({Key? key}) : super(key: key);

  static const routeName = '/receipts';

  @override
  State<ReceiptsScreen> createState() => _ReceiptsScreenState();
}

class _ReceiptsScreenState extends State<ReceiptsScreen> {
  String? property;

  List<String> properties = ['House 1', 'House 2', 'House 3', 'House 4'];

  Widget propertyField() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w300,
          ),
          labelText: 'Select House'),
      items: properties.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: property,
      onChanged: (String? value) {
        setState(() {
          property = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Receipts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  propertyField(),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text('Prior receipts',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0)),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(),
                itemCount: 12,
                itemBuilder: (ctx, index) {
                  index += 1;
                  if (index > 12) {
                    index -= 12;
                  }
                  return Card(
                    child: ListTile(
                      title:
                          Text(DateFormat('MMMM').format(DateTime(0, index))),
                      subtitle: const Text('15,000'),
                      trailing: const Icon(Icons.receipt),
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
