// import 'package:app/shared/router/routes.dart';
// import 'package:app/shared/styles/colors.dart';
// import 'package:flutter/material.dart';

// class ForgetPasswordSelection extends StatelessWidget {
//   const ForgetPasswordSelection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back_ios)),
//       ),
//       body: Center(
//           child: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 60),
//             Text(
//               "Make\nselection".toUpperCase(),
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineMedium!
//                   .copyWith(color: secondColor, fontWeight: FontWeight.w700),
//             ),
//             Text(
//               "Select which contact details should we use to reset your password?",
//               style: Theme.of(context)
//                   .textTheme
//                   .labelLarge!
//                   .copyWith(color: Colors.grey.shade600),
//             ),
//             const SizedBox(height: 30),
//             GestureDetector(
//               onTap: () => Navigator.pushNamed(
//                   context, AppRoutes.resetPasswordWithEmailRoute),
//               child: Card(
//                 color: Colors.grey.shade200,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     children: const [
//                       Icon(Icons.phone_android, size: 40),
//                       SizedBox(width: 10),
//                       Text("Via sms:")
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             GestureDetector(
//               onTap: () => Navigator.pushNamed(
//                   context, AppRoutes.resetPasswordWithPhoneRoute),
//               child: Card(
//                 color: Colors.grey.shade200,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: const [
//                       Icon(Icons.email_outlined, size: 40),
//                       SizedBox(width: 10),
//                       Text("Via mail:")
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
