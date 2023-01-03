// Assignment 5: Task 5: Contact application
// Dart & Flutter - Zero to Mastery [2023] + Clean Architecture on Udemy
// Author: Atanas (Tony) Hristov
//
// Requirements:
// The user can enter new contacts (the fields are up to you)
// The user can decide to display all existing customers
// The user can delete a specific customer
// If no customer exist, give the user a hint
//
// Review:
//
// Good solution, i like that you used a own ContactList class with a to string function
// for displaying all information and implementing the add delete functions there.
//
// I am not sure if it is needed to have a setter for each parameter in your Contact class.
//
// The two do whiles are looking wired, but they do what they should do,
// i would maybe move it into one do while and check it at the end.
//

import 'dart:io';

void main() {
  final contacts = ContactList();

  do {
    String cmd = getInput('''
Please enter choice:
  1 - to display contacts
  2 - to add contact
  3 - to delete contact
or enter to exit
''');
    switch (cmd) {
      case '':
        return;
      case '1':
        print('\n$contacts\n');
        break;
      case '2':
        contacts.addContact(enterContact());
        break;
      case '3':
        final position = int.tryParse(getInput('Enter record number to delete'));
        if (position == null) {
          print('Invalid number');
        } else {
          contacts.deleteContact(position);
        }
        break;
      default:
        print('Invalid choice!');
    }
  } while (true);
}

Contact enterContact() {
  String name = getInput('Enter name');
  String email = getInput('Enter email');
  return Contact(name: name, email: email);
}

String getInput(String prompt) {
  String result = '';
  while (result.isEmpty) {
    print(prompt);
    result = stdin.readLineSync()?.trim() ?? '';
  }
  return result;
}

class ContactList {
  ContactList([List<Contact>? initial]) {
    _list = initial ?? [];
  }

  late final List<Contact> _list;

  void addContact(Contact contact) => _list.add(contact);
  void deleteContact(int position) {
    if (position < 1) {
      return;
    }
    if (position > _list.length) {
      return;
    }

    _list.removeAt(position - 1);
  }

  @override
  String toString() =>
      'Your contacts list is:\n' +
      (_list.length < 1
          ? '-empty-'
          : _list.asMap().entries.map((element) => '${element.key + 1}: ${element.value}').join("\n"));
}

class Contact {
  Contact({required String name, required String email}) {
    _name = name;
    _email = email;
  }

  late String _name;
  late String _email;

  String get name => _name;
  void set name(val) => _name = val;
  String get email => _email;
  void set email(val) => _email = val;

  @override
  String toString() => '$_name - $_email';
}
