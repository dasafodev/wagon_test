enum Filter {
  all,
  date,
  driver,
  route;

  static Filter fromString(String value) {
    switch (value) {
      case 'All':
        return Filter.all;
      case 'Date':
        return Filter.date;
      case 'Driver':
        return Filter.driver;
      case 'Route':
        return Filter.route;
      default:
        return Filter.all;
    }
  }
}
