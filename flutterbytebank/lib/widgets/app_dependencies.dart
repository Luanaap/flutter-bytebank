import 'package:flutter/cupertino.dart';
import 'package:flutterbytebank/database/dao/contact_dao.dart';
import 'package:flutterbytebank/http/webclients/transaction_webclient.dart';

class AppDependencies extends InheritedWidget {
  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  AppDependencies({
    required this.contactDao,
    required this.transactionWebClient,
    required Widget child,
  }) : super(child: child);

  static AppDependencies? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDependencies>();

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return contactDao != oldWidget.contactDao ||
        transactionWebClient != oldWidget.transactionWebClient;
  }
}
