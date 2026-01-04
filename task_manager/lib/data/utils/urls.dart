class Urls{

  static String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static String registrationUrl = '$_baseUrl/Registration';
  static String loginUrl = '$_baseUrl/Login';
  static String createTaskUrl = '$_baseUrl/createTask';
  static String taskCountUrl = '$_baseUrl/taskStatusCount';
  static String newTaskUrl = '$_baseUrl//listTaskByStatus/New';
  static String taslListUrl  (String type) => '$_baseUrl//listTaskByStatus/$type';

}