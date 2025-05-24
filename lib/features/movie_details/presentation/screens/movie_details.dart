// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:movies_show/core/constants/assets.dart';
// import 'package:movies_show/core/constants/styles/styles.dart';

// class MovieDetailsScreen extends StatelessWidget {
//   const MovieDetailsScreen({super.key});
//   final String movieImage = '0';

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           title: Text('data', style: AppTextStyles.white16w700),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           centerTitle: false,
//           actions: [
//             CircleAvatar(
//               backgroundColor: Color(0xff303243).withOpacity(.8),
//               radius: 20,
//               child: SvgPicture.asset(AppAssets.heartIcon),
//             ),
//           ],
//           expandedHeight: 200, // Height when expanded
//           floating: false,
//           pinned: true,
//           flexibleSpace: FlexibleSpaceBar(
//             background: Image.asset(AppAssets.onboarding, fit: BoxFit.cover),
//           ),
//           backgroundColor: Colors.transparent,
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate([
//             // Your content here
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//           ]),
//         ),
//       ],
//     );
//   }
// }
