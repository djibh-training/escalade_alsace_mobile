import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/models/opener.dart';
import '/services/loaders.dart';
import '../utils/string_extension.dart';

class OpenersPage extends StatefulWidget {
  const OpenersPage({super.key});

  @override
  State<OpenersPage> createState() => _OpenersPageState();
}

class _OpenersPageState extends State<OpenersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 60,
            child: Text(
              "Openers",
              style: TextStyle(fontSize: 28),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Opener>?>(
              future: fetchOpeners(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/michaelJackson.jpg'),
                          ),
                          title: Text(
                              "${snapshot.data?[index].firstName.capitalize()} ${snapshot.data?[index].lastName.capitalize()}"),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/not-found.png'),
                      Center(
                        child: Text(
                          '${snapshot.error}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
