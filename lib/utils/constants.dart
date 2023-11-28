class ApiConstants {
  static const String domain = 'http://localhost:5000';
  static const String placesRoute = "/places";
  static const String openersRoute = "/openers";
  static const String routesRoute = "/routes";

  static placesUrl() {
    return domain + placesRoute;
  }

  static openersUrl() {
    return domain + openersRoute;
  }

  static routesUrl(placeId) {
    // ignore: prefer_interpolation_to_compose_strings
    return domain + placesRoute + "/" + placeId.toString() + routesRoute;
  }
}
