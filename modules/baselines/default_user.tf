
module "default_administrator" {
  source      = "../../modules/iam"
  role_for    = "project"
  iam_root_id = var.iam_root_id
  iam_roles   = ["roles/editor", "roles/compute.networkAdmin"]
  member      = "group:_ke0000555@kakaoent.com"
}

module "default_sec_administrator" {
  source      = "../../modules/iam"
  role_for    = "project"
  iam_root_id = var.iam_root_id
  iam_roles   = ["roles/compute.securityAdmin", "roles/viewer", "roles/compute.networkUser"]
  member      = "group:_ke0000714@kakaoent.com"
}

module "default_db_administrator" {
  source      = "../../modules/iam"
  role_for    = "project"
  iam_root_id = var.iam_root_id
  iam_roles   = ["roles/datamigration.admin", "roles/cloudsql.admin", "roles/datastore.indexAdmin", "roles/viewer", "roles/compute.networkUser"]
  member      = "group:_ke0000187@kakaoent.com"
}