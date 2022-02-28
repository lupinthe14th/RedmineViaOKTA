resource "okta_app_saml" "test" {
  label                    = "testAcc_replace_with_uuid"
  sso_url                  = "http://localhost:8080/auth/saml/callback"
  recipient                = "http://localhost:8080/auth/saml/callback"
  destination              = "http://localhost:8080/auth/saml/callback"
  audience                 = "http://localhost:8080/saml/metadata"
  subject_name_id_template = "$${user.userName}"
  subject_name_id_format   = "urn:oasis:names:tc:SAML:2.0:nameid-format:transient"
  response_signed          = true
  assertion_signed         = true
  signature_algorithm      = "RSA_SHA256"
  digest_algorithm         = "SHA256"
  honor_force_authn        = true
  authn_context_class_ref  = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"

  attribute_statements {
    name      = "firstname"
    namespace = "urn:oasis:names:tc:SAML:2.0:attrname-format:basic"
    type      = "EXPRESSION"
    values = [
      "user.firstName",
    ]
  }
  attribute_statements {
    name      = "lastname"
    namespace = "urn:oasis:names:tc:SAML:2.0:attrname-format:basic"
    type      = "EXPRESSION"
    values = [
      "user.lastName",
    ]
  }
  attribute_statements {
    name      = "email"
    namespace = "urn:oasis:names:tc:SAML:2.0:attrname-format:basic"
    type      = "EXPRESSION"
    values = [
      "user.email",
    ]
  }
  lifecycle {
    ignore_changes = [users]
  }
}
