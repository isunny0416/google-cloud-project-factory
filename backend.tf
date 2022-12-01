terraform {
  backend "gcs" {
    credentials = "/Users/kakaoent/Documents/Workspaces/google-cloud-project-factory/onboarding-host-project-a9819f1e90ac.json"
    bucket      = "kakaoent-tfstate-bucket"
    prefix      = "terraform/poc/state"
  }
}
