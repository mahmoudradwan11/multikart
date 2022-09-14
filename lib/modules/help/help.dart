import 'package:flutter/material.dart';
class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Help Center',
                style: TextStyle(fontSize: 20, fontFamily: 'Jannah'),
              ),
              const Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5.0,
                margin: EdgeInsets.all(0.8),
                child: Image(
                  image: AssetImage(
                    'images/help.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Help Center',
                style: TextStyle(fontSize: 20, fontFamily: 'Jannah'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Please get in touch and we will be happy to help you. Get quick customer support by selecting your item',
                style: TextStyle(
                    fontFamily: 'Jannah', fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'What issues are you facing?',
                style: TextStyle(fontSize: 20, fontFamily: 'Jannah'),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[200],
                child: const ExpansionTile(
                  title: Text(
                    'I want to track my order',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(title: Text(
                        'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'),)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[200],
                child: const ExpansionTile(
                  title: Text(
                    'I want to manage my order',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[200],
                child: const ExpansionTile(
                  title: Text(
                    'I did not receive Instant cashback',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[200],
                child: const ExpansionTile(
                  title: Text(
                    'I want help help with other issues',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[200],
                child: const ExpansionTile(
                  title: Text(
                    'Iam unable to pay using wallet',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[200],
                child: const ExpansionTile(
                  title: Text(
                    'I want to unsubscribe from promotional emails and SMS',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey[200],
                child: const ExpansionTile(
                  title: Text(
                    'I want help with returns & refunds',
                    style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
