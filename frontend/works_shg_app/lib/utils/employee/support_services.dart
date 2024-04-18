class Conversion{

 static String convertToTenant(String input) {
    List<String> parts = input.split('.');
    String result =
        "TENANT_TENANTS_${parts.map((part) => part.toUpperCase()).join('_')}";
    return result;
  }

static String splitTenant(String input) {
    List<String> parts = input.split('.');
    String result =
        parts.map((part) => part.toUpperCase()).join('_');
    return result;
  }

}