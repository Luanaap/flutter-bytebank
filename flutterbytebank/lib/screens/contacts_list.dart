import 'package:flutter/material.dart';
import 'package:flutterbytebank/components/progress.dart';
import 'package:flutterbytebank/models/contact.dart';
import 'package:flutterbytebank/screens/contact_form.dart';
import 'package:flutterbytebank/screens/transaction_form.dart';
import 'package:flutterbytebank/widgets/app_dependencies.dart';

class ContactsList extends StatelessWidget {
  Widget build(BuildContext context) {
    final dependencies = AppDependencies.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: dependencies!.contactDao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts![index];
                  return ContactItem(
                    contact,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransactionForm(contact),
                        ),
                      );
                    },
                  );
                },
                itemCount: contacts!.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then((valeu) => setState(() {}));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  setState(Null Function() param0) {}
}

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  ContactItem(
    this.contact, {
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(contact.accountNumber.toString(),
            style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
