// import 'package:binary_brains/components/custom_list_tile.dart';
// import 'package:binary_brains/models/rive_asset.dart';
// import 'package:binary_brains/utils/rive_utils.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';

// class SideDrawer extends StatefulWidget {
//   const SideDrawer({super.key});
//   static const routeName = '/side-drawer';

//   @override
//   State<SideDrawer> createState() => _SideDrawerState();
// }

// class _SideDrawerState extends State<SideDrawer> {
//   RiveAsset selectedMenu = sideMenus.first;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: 288,
//         height: double.infinity,
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 leading: const CircleAvatar(
//                   // backgroundColor: kWhiteColor,
//                   child: Icon(
//                     CupertinoIcons.person,
//                     // color: kSecondaryColor,
//                   ),
//                 ),
//                 title: Text(
//                   'Asad Sheikh',
//                   style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                 ),
//                 subtitle: Text(
//                   'Developer',
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith(),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
//                 child: Text(
//                   'MENU',
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith(),
//                 ),
//               ),
//               ...sideMenus.map(
//                 (menu) {
//                   return CustomListTile(
//                     menu: menu,
//                     riveOnInit: (artboard) {
//                       StateMachineController controller =
//                           RiveUtils.getRiveController(artboard,
//                               stateMachineName: menu.stateMachineName);
//                       menu.input = controller.findSMI('active') as SMIBool;
//                     },
//                     press: () {
//                       menu.input!.change(true);
//                       Future.delayed(
//                         const Duration(seconds: 8),
//                         () {
//                           menu.input!.change(false);
//                         },
//                       );
//                       setState(() {
//                         selectedMenu = menu;
//                       });
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => menu.pagename));
//                     },
//                     isActive: selectedMenu == menu,
//                   );
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
//                 child: Text(
//                   'HISTORY',
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith(),
//                 ),
//               ),
//               ...sideMenus2.map(
//                 (menu) {
//                   return CustomListTile(
//                     menu: menu,
//                     riveOnInit: (artboard) {
//                       StateMachineController controller =
//                           RiveUtils.getRiveController(artboard,
//                               stateMachineName: menu.stateMachineName);
//                       menu.input = controller.findSMI('active') as SMIBool;
//                     },
//                     press: () {
//                       menu.input!.change(true);
//                       Future.delayed(
//                         const Duration(seconds: 8),
//                         () {
//                           menu.input!.change(false);
//                         },
//                       );
//                       setState(() {
//                         selectedMenu = menu;
//                       });
//                     },
//                     isActive: selectedMenu == menu,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
