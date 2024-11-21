import 'package:flutter/material.dart';
import 'profile_tile_model.dart';

// ProfileData ronanProfile = ProfileData(
// name: "Ronan",
// position: "Flutter Developer",
// avatarUrl: 'assets/w5-s2/aang.png',
// tiles: [
//   TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
//   TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
//   TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
// ],
// );

List<ProfileData> profiles = [
  ProfileData(
    name: "Ronan",
    position: "Flutter Developer",
    avatarUrl: 'assets/image/a.jpg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    ],
  ),
  ProfileData(
      name: "Do San",
      position: "Developer",
      tiles: [
        TileData(icon: Icons.phone, title: "Phone Number", value: "0123456789"),
        TileData(
            icon: Icons.location_on, title: "Address", value: "123 Korean"),
        TileData(icon: Icons.email, title: "Mail", value: "Dosan@gmail.com"),
      ],
      avatarUrl: "assets/image/dosan.jpg"),
  ProfileData(
      name: "Do San",
      position: "Developer",
      tiles: [
        TileData(icon: Icons.phone, title: "Phone Number", value: "0123456789"),
        TileData(
            icon: Icons.location_on, title: "Address", value: "123 Korean"),
        TileData(icon: Icons.email, title: "Mail", value: "Dosan@gmail.com"),
      ],
      avatarUrl: "assets/image/dosan2.jpg"),
];
