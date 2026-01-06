class Urls{

  static String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static String registrationUrl = '$_baseUrl/Registration';
  static String loginUrl = '$_baseUrl/Login';
  static String createTaskUrl = '$_baseUrl/createTask';
  static String taskCountUrl = '$_baseUrl/taskStatusCount';
  static String newTaskUrl = '$_baseUrl/listTaskByStatus/New';
  static String progressTaskUrl = '$_baseUrl/listTaskByStatus/progress';
  static String completedTaskUrl = '$_baseUrl/listTaskByStatus/Completed';
  static String cancelledTaskUrl = '$_baseUrl/listTaskByStatus/Cancelled';
  static String deleteTaskUrl(String taskId) => '$_baseUrl/deleteTask/$taskId';
  static String changeStatusUrl (String taskId, String status) => '$_baseUrl/updateTaskStatus/$taskId/$status';

}