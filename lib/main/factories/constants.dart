// Nasa API docs https://github.com/nasa/apod-api
// As defined per Nasa's API
final DateTime earliestDatePossible = DateTime.parse('1995-06-21');
const String apiDateFormat = 'yyyy-MM-dd';

// The number of days corresponds to the number of items per request + 1
const int numberOfDaysPerRequest = 4;
