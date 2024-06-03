import 'package:rocki_poin_app/core/constants/app_assets.dart';

class TeamModel {
  final String imgPath;
  final String imgText;

  TeamModel(this.imgPath, this.imgText);

  static final List<TeamModel> teamList = [
    TeamModel(
      AppAssets.homImgSeven,
      "@mysterioX",
    ),
    TeamModel(
      AppAssets.homImgEight,
      "@johnny327",
    ),
    TeamModel(
      AppAssets.homImgNine,
      "@MissMistiq",
    ),
    TeamModel(
      AppAssets.homImgTen,
      "@thesempe..",
    ),
    TeamModel(
      AppAssets.homImgEleven,
      "@Septiemma",
    ),
    TeamModel(
      AppAssets.homImgTwelve,
      "@Deemer",
    ),
  ];
}
