class Endpoints {
  static const baseURL = "http://178.79.146.213:8080/smart-real-estate-backend";

  static const mpesaPromptURL = '$baseURL/paymentrequest/create';

  //Prompt for ad-hoc M-Pesa payments
  static const adHocMpesaURL = '$baseURL/paymentrequest/initiate-adhoc-payment';

  // Fetching all properties by status - VACANT or OCCUPIED
  static const fetchPropertiesURL =
      "$baseURL/propertyunits/retrieve-propertyunits-by-status?unitStatus=VACANT";

  // Fetch tenancies, ie, property units rented/leased by a tenant
  static const fetchTenanciesByTenant =
      "$baseURL/tenancy/retrieve-tenancies-by-tenant";

  // Fetch tenant's invoices
  static const fetchTenantInvoices =
      "$baseURL/invoices/retrieve-invoices-by-tenant";

  static const submitTenantFeedback = "$baseURL/tenantfeedback/create";
}
