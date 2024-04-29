import 'package:ca_junction/components/admin/services_list.dart';
import 'package:ca_junction/theme/daytheme.dart';
import 'package:flutter/material.dart';

class MyClientScreen extends StatefulWidget {
  const MyClientScreen({Key? key}) : super(key: key);

  @override
  MyClientScreenState createState() => MyClientScreenState();
}

class MyClientScreenState extends State<MyClientScreen> {
  String selectedService = 'All';
  List<String> clients = [
    'Divyanshu Kumar Kushwaha',
    'Dhairya Seth',
    'Anjali Jaiswal',
    'Tanmay Mishra',
  ];
  void handleServiceSelection(String service) {
    setState(() {
      selectedService = service;
      print("Selected Service is: ${service}");
    });
  }

  List<String> filteredClients = [];

  @override
  void initState() {
    super.initState();
    filteredClients.addAll(clients);
  }

  void filterClients(String query) {
    filteredClients.clear();
    if (query.isEmpty) {
      filteredClients.addAll(clients);
    } else {
      for (var client in clients) {
        if (client.toLowerCase().contains(query.toLowerCase())) {
          filteredClients.add(client);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("My Clients"),
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '(233)',
              style: TextStyle(fontSize: 16,color: AppColors.mutedTextColor),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ServiceList(
            selectedService: selectedService,
            onServiceSelected: handleServiceSelection,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjust the vertical padding as needed
            child: TextField(
              decoration: InputDecoration(
                helperStyle: const TextStyle(color: Colors.red),
                hintText: 'Search Clients',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Colors.grey[100]!,
                  ),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                filterClients(value);
                // Perform filtering logic here
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredClients.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0.3,
                  margin:const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      filteredClients[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      '#Client 673',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      // Handle client item tap
                      print("Selected client: ${filteredClients[index]}");
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FAB button action here
          print('FAB button pressed');
        },
        backgroundColor: AppColors.iconBackgroundColor,
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

