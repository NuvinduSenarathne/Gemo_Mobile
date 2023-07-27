class ValidationService {
  static generalValidation(String value, String fieldName) {
    switch (fieldName) {
      case "name":
        {
          if (value.isEmpty) {
            return "This field is required*";
          }
          if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            return "This field can only contain with letters.";
          }
          return "success";
        }
      case "email":
        {
          if (value.isEmpty) {
            return "This field is required*";
          }
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(value)) {
            return "Please enter valid email address.";
          }
          return "success";
        }
      case "password":
        {
          if (value.isEmpty) {
            return "This field is required*";
          }
          if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$')
              .hasMatch(value)) {
            return "Please enter strong password.";
          }
          return "success";
        }
      case "password_signin":
        {
          if (value.isEmpty) {
            return "This field is required*";
          }
          if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$')
              .hasMatch(value)) {
            return "Incorrect password.";
          }
          return "success";
        }
      default:
        return "Error message";
    }
  }
}
