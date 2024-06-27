import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kushal_portfolio/constants/size.dart';
import 'package:kushal_portfolio/constants/sns_links.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _sendEmail() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final message = _messageController.text;

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      // Show a snackbar or dialog if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    final mailtoLink = Mailto(
      to: ['kushalsaxena17@gmail.com'], // Replace with your email
      subject: 'Contact from Portfolio',
      body: 'Name: $name\nEmail: $email\nMessage: $message',
    );

    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          Text(
            "Get in touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWIdth) {
                  return buildNameEmailFileDesktop();
                }
                return buildNameEmailFileMobile();
              },
            ),
          ),
          SizedBox(height: 15),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              controller: _messageController,
              hintText: "Your message",
              maxLines: 16,
            ),
          ),
          SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: _sendEmail,
                child: Text("Get in touch"),
              ),
            ),
          ),
          SizedBox(height: 30),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: Divider(),
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.github]);
                },
                child: Image.asset("assets/github.jpeg", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.linkedin]);
                },
                child: Image.asset("assets/projects/linkedin.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.instagram]);
                },
                child: Image.asset("assets/projects/instagram.jpg", width: 28),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildNameEmailFileDesktop() {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            controller: _nameController,
            hintText: "Your name",
          ),
        ),
        SizedBox(width: 15),
        Flexible(
          child: CustomTextField(
            controller: _emailController,
            hintText: "Your email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFileMobile() {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            controller: _nameController,
            hintText: "Your name",
          ),
        ),
        SizedBox(height: 15),
        Flexible(
          child: CustomTextField(
            controller: _emailController,
            hintText: "Your email",
          ),
        ),
      ],
    );
  }
}
