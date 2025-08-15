const String imagePath = "assets/images";
const String iconPath = "assets/icons";
const String svgPath = "assets/svgs";

abstract class ImagesManager {
  static const String logoRoute = "$imagePath/popcorn.png";
  static const String coverDetailsImage = "assets/images/image 2.png";
  static const String smallDetailsImage = "assets/images/Rectangle 4.png";
}

abstract class IconsManager {
  static const String vector = "assets/icons/Vector 2.png";

  static const String homeIcon = "$iconPath/homeIcon.png";
  static const String searchIcon = "$iconPath/searchIcon.png";
  static const String ticketIcon = "$iconPath/Ticket.png";
  static const String clockIcon = "$iconPath/Clock.png";
  static const String calenderIcon = "$iconPath/CalendarBlank.png";
  static const String saveIcon = "$iconPath/saveIcon.png";
  static const String searchbarIcon = "$iconPath/searchBarIcon.png";
  static const String noResultIcon = "$iconPath/noResultIcon.png";
}
abstract class SvgsManager{
  static const String rateSvg = "$svgPath/rate.svg";
  static const String genreSvg = "$svgPath/genre.svg";
  static const String clockSvg = "$svgPath/clock.svg";
  static const String calendarSvg = "$svgPath/calendar.svg";

}