provider "google" {
  credentials = file("onboarding-host-project-a9819f1e90ac.json")
  project     = "onboarding-host-project"
  region      = "asia-northeast3"
}

provider "google-beta" {
  credentials = file("onboarding-host-project-a9819f1e90ac.json")
  project     = "onboarding-host-project"
  region      = "asia-northeast3"
}