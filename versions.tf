terraform {
  required_version = "~> 1.1.6"
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.20"
    }
  }
}
