// import 'package:flutter/material.dart';
// import '../widgets/profile_photo.dart';
// import '../widgets/profile_info.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: const Text('Profil Mahasiswa'),
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//         ),
//         body: SingleChildScrollView(
//             child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                         const SizedBox(height: 24),
//                         const ProfilePhoto(radius: 60),
//                         const SizedBox(height: 24),
//                         const ProfileInfo(
//                             name: 'Dava Rias Putratama',
//                             nim: '25.11.6372',
//                             programStudi: 'S1 Informatika',
//                             email: 'dava@students.amikom.ac.id',
//                             lokasi: 'Yogyakarta, Indonesia',
//                         ),
//                         const SizedBox(height: 24),
//                         // Tombol aksi
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                                 ElevatedButton.icon(
//                                     onPressed: () {},
//                                     icon: const Icon(Icons.edit),
//                                     label: const Text('Edit'),
//                                 ),
//                                 ElevatedButton.icon(
//                                     onPressed: () {},
//                                     icon: const Icon(Icons.share),
//                                     label: const Text('Bagikan'),
//                                 ),
//                             ],
//                         ),
//                     ],
//                 ),
//             ),
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info.dart';
import '../widgets/social_media_row.dart';
import '../widgets/action_buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Menggunakan Expanded agar area utama profil mengisi ruang utama
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(height: 16),
                    ProfileHeader(
                      name: 'Dava Rias Putratama',
                      nim: '25.11.6372',
                    ),
                    SizedBox(height: 16),
                    ProfileInfo(
                      programStudi: 'S1 Informatika',
                      email: 'd.rias@students.amikom.ac.id',
                      lokasi: 'Yogyakarta, Indonesia',
                    ),
                    SizedBox(height: 16),
                    SocialMediaRow(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Widget Tombol Aksi menggunakan Flexible di dalamnya
            const ActionButtons(),
          ],
        ),
      ),
    );
  }
}