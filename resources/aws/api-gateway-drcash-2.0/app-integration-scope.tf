locals {
  resource_server = [
    {
      identifier = "clinics"
      name       = "Clinics Admin API rapadura API 2.0"
      scopes = [
        {
          scope_name        = "admin"
          scope_description = "Admin scope"
      }]
  }]
}
