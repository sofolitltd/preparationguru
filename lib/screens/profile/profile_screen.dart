import 'package:flutter/material.dart';

import '../../utils/url_luncher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                        'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'), // Replace with actual user image URL
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe', // Replace with actual user name
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ID: 123321', // Replace with actual member since date
                        style: TextStyle(fontSize: 16),
                      ),
                      //
                      SizedBox(height: 8),
                      Text(
                        'Member since: January 2023', // Replace with actual member since date
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            //
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Institution:',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'University of Example', // Replace with actual institution
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Major Subject:', // Replace with actual major subject
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Computer Science', // Replace with actual major subject
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            //
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Us:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  //
                  ListView.separated(
                    shrinkWrap: true, // Important for ListView inside Column
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling if needed
                    itemCount: contacts.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final contact = contacts[index];

                      //
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          visualDensity: const VisualDensity(vertical: -4),
                          leading: Icon(contact.icon),
                          title: Text(contact.title),
                          subtitle: Text(contact.url),
                          onTap: () {
                            switch (contact.type) {
                              case ContactType.facebookPage:
                                UrlLauncher.launchFacebookPage(contact.url);
                                break;
                              case ContactType.facebookGroup:
                                UrlLauncher.launchFacebookGroup(contact.url);
                                break;
                              case ContactType.messenger:
                                UrlLauncher.launchMessenger(contact.url);
                                break;
                              case ContactType.whatsApp:
                                UrlLauncher.launchWhatsApp(contact.url);
                                break;
                              case ContactType.gmail:
                                UrlLauncher.launchGmail(contact.url);
                                break;
                              case ContactType.phone:
                                UrlLauncher.launchPhone(contact.url);
                                break;
                            }
                          },
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 4),
                ],
              ),
            ),

            //
            const SizedBox(height: 8),

            //
            Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                // width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Log Out'))),
          ],
        ),
      ),
    );
  }
}

class Contact {
  final String title;
  final IconData icon;
  final String url;
  final ContactType type;

  Contact({
    required this.title,
    required this.icon,
    required this.url,
    required this.type,
  });
}

enum ContactType {
  facebookPage,
  facebookGroup,
  messenger,
  whatsApp,
  gmail,
  phone
}

List<Contact> contacts = [
  Contact(
    title: 'Facebook Page',
    icon: Icons.facebook,
    url: 'https://www.facebook.com/',
    type: ContactType.facebookPage,
  ),
  Contact(
    title: 'Facebook Group',
    icon: Icons.group,
    url: 'https://www.facebook.com/groups/',
    type: ContactType.facebookGroup,
  ),
  Contact(
    title: 'Messenger',
    icon: Icons.messenger,
    url: 'https://m.me/',
    type: ContactType.messenger,
  ),
  Contact(
    title: 'WhatsApp',
    icon: Icons.message,
    url: 'https://wa.me/+8801704340860',
    type: ContactType.whatsApp,
  ),
  Contact(
    title: 'Gmail',
    icon: Icons.email,
    url: 'mailto:sofolitltd@gmail.com',
    type: ContactType.gmail,
  ),
  Contact(
    title: 'Mobile No',
    icon: Icons.phone,
    url: 'tel:+8801704340860',
    type: ContactType.phone,
  ),
];
