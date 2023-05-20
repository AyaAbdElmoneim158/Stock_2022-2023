// import 'package:app/shared/styles/colors.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ForgetPasswordWithPhone extends StatefulWidget {
//   const ForgetPasswordWithPhone({Key? key}) : super(key: key);
//   static String verify = "";

//   @override
//   State<ForgetPasswordWithPhone> createState() =>
//       _ForgetPasswordWithPhoneState();
// }

// class _ForgetPasswordWithPhoneState extends State<ForgetPasswordWithPhone> {
//   TextEditingController countryCode = TextEditingController();
//   var phone = "";
//   @override
//   void initState() {
//     countryCode.text = "+91";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.only(left: 25, right: 25),
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/phone-number-verification.gif',
//                 width: 150,
//                 height: 150,
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               const Text(
//                 "Phone Verification",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 "We need to register your phone without getting started!",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 55,
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // const SizedBox(
//                     //   width: 10,
//                     // ),
//                     SizedBox(
//                       width: 50,
//                       child: TextField(
//                         controller: countryCode,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       "|",
//                       style: TextStyle(fontSize: 33, color: Colors.grey),
//                     ),
//                     // const SizedBox(
//                     //   width: 10,
//                     // ),
//                     Expanded(
//                         child: TextField(
//                       onChanged: (val) => phone = val,
//                       keyboardType: TextInputType.phone,
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Phone",
//                       ),
//                     ))
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: secondColor,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () async {
//                       await FirebaseAuth.instance.verifyPhoneNumber(
//                         phoneNumber: countryCode.text + phone,
//                         verificationCompleted:
//                             (PhoneAuthCredential credential) {},
//                         verificationFailed: (FirebaseAuthException e) {},
//                         codeSent: (String verificationId, int? resendToken) {
//                           ForgetPasswordWithPhone.verify = verificationId;
//                           // Navigator.of(context).pushNamed(AppRoutes.otpPageRoute);
//                         },
//                         codeAutoRetrievalTimeout: (String verificationId) {},
//                       );

//                       //
//                     },
//                     child: const Text("Send the code")),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
