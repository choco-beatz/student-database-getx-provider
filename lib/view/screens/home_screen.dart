import 'package:flutter/material.dart';
import 'package:student_database/constants/colors.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STUDENT RECORD',
          style: TextStyle(color: white),
        ),
        actions: [
          IconButton(
            onPressed: () {
          
            },
            icon: const Icon(
              Icons.search,
              color: white,
            ),
          ),
        ],
        backgroundColor: black,
      ),
      body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                  
                    return Card(
                        child: ListTile(
                      onTap: () {
                        
                      },
                      leading: CircleAvatar(
                        radius: 25,
                       backgroundColor: black,
                      ),
                      title: Text('name'),
                      subtitle: Text('department'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                             
                              },
                              icon: const Icon(
                                Icons.edit,
                                color:black,
                              )),
                          IconButton(
                              onPressed: () {
                              },
                              icon: const Icon(Icons.delete,
                                  color:black))
                        ],
                      ),
                    ));
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          
        },
        backgroundColor: black,
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}