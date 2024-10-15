import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../profile/presentation/view/profile_page.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = "/settings";
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontSize: 21),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth: 90,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
              onPressed: () {
                context.pop();
              },
            ),
            const Text(
              'Back',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ProfilePage(),
                ),
              );
            },
            child: const SettingsListTile(
              leadingIcon: Icons.person_outline_outlined,
              trailingIcon: Icon(Icons.arrow_forward_ios_outlined),
              title: "Kumar@gmail.com",
              isVisible: true,
              subTitle: "Edit Profile",
            ),
          ),
          const SeparateLine(),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const AboutDialog(),
              );
            },
            child: const SettingsListTile(
              leadingIcon: Icons.info_outlined,
              trailingIcon: Icon(Icons.arrow_forward_ios_outlined),
              title: "About",
              subTitle: "",
              isVisible: false,
            ),
          ),
          const SeparateLine(),
          GestureDetector(
            onTap: () {
              openHelpPdf(context);
            },
            child: const SettingsListTile(
              leadingIcon: Icons.help_outline_outlined,
              trailingIcon: Icon(Icons.arrow_forward_ios_outlined),
              title: "Help",
              subTitle: "",
              isVisible: false,
            ),
          ),
          const SeparateLine(),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const ContactUsDialog(),
              );
              // openEmailClient(context);
            },
            child: const SettingsListTile(
              leadingIcon: Icons.mail_outline_outlined,
              title: "Contact Us",
              isVisible: false,
            ),
          ),
          const SeparateLine(),
          GestureDetector(
              child: const SettingsListTile(
                leadingIcon: Icons.logout_outlined,
                trailingIcon: Icon(Icons.arrow_forward_ios_outlined),
                title: "Log out",
                subTitle: "",
                isVisible: false,
              ),
              onTap: () {
                context.pushReplacement("/");
              }),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

/* ----------------------------------------------------------------- */
/*           )))))))))))))>> Widgets <<((((((((((((( */
/* ----------------------------------------------------------------- */

class SeparateLine extends StatelessWidget {
  const SeparateLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 16,
      endIndent: 16,
      thickness: 1,
    );
  }
}

class SettingsListTile extends StatelessWidget {
  final IconData leadingIcon;
  final Widget? trailingIcon;
  final String title;
  final String subTitle;
  final bool isVisible;

  const SettingsListTile({
    super.key,
    required this.leadingIcon,
    this.trailingIcon,
    required this.title,
    required this.isVisible,
    this.subTitle = "",
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(
        leadingIcon,
        size: 40,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: isVisible ? Text(subTitle == "" ? "" : subTitle) : null,
      trailing: trailingIcon,
    );
  }
}

void openEmailClient(BuildContext context) async {
  String targetEmail = 'eamnotify@gmail.com';
  String mailUrl = 'mailto:$targetEmail';
  try {
    await launchUrlString(mailUrl);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not launch email client')),
    );
  }
}


class ContactUsDialog extends StatefulWidget {
  const ContactUsDialog({super.key});

  @override
  _ContactUsDialogState createState() => _ContactUsDialogState();
}

class _ContactUsDialogState extends State<ContactUsDialog> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';

  Future<void> sendEmail() async {
    String username = 'eamnotify@gmail.com';
    String password = '#Eam#Notify#'; // Use environment variables in production!

    final smtpServer = SmtpServer('smtp.gmail.com',
        username: username, password: password, port: 587, ssl: false);

    final message = Message()
      ..from = Address(username, _name)
      ..recipients.add('eamnotify@gmail.com')
      ..subject = 'Contact Us'
      ..text = 'From: $_name\nEmail: $_email\n\nMessage: $_message';

    try {
      await send(message, smtpServer);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email sent successfully!')),
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send email')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Contact Us'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  _name = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  _email = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Message'),
                maxLines: 4,
                onSaved: (value) {
                  _message = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              sendEmail();
            }
          },
          child: const Text('Send'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}


void openHelpPdf(BuildContext context) async {
  const pdfUrl =
      'https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf';
  final Uri pdfUri = Uri.parse(pdfUrl);
  if (await canLaunchUrl(pdfUri)) {
    await launchUrl(pdfUri);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not open PDF')),
    );
  }
}

class AboutDialog extends StatelessWidget {
  const AboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading app info'));
        } else {
          final packageInfo = snapshot.data;
          return AlertDialog(
            title: const Text('About'),
            content: Text(
              'App Version: ${packageInfo?.version}\n'
              'Company: Orienseam Pvt Ltd',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        }
      },
    );
  }
}
