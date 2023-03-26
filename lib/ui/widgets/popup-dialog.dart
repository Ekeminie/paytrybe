// import 'package:flutter/material.dart';
//
// showFigurAlertDialog(BuildContext context,
//     {String dialogTitle = "Action",
//     String dialogBody = "Are you sure you want to proceed",
//     String dialogAction = "Continue ",
//     Function? cancelAction,
//     Function? proceedAction}) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//       child: const Text('Cancel'),
//       onPressed: () =>
//           cancelAction != null ? cancelAction() : Navigator.pop(context));
//   Widget continueButton = TextButton(
//     child: Text(dialogAction),
//     onPressed: () => {proceedAction!(), Navigator.pop(context)},
//   );
//
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(dialogTitle),
//     content: Text(dialogBody),
//     actions: [
//       cancelButton,
//       continueButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
