/*
 * Project IAM member authoritative
*/

resource "google_project_iam_member" "project_iam_member" {
  count   = local.project ? length(var.iam_roles) : 0
  project = var.iam_root_id
  role    = var.iam_roles[count.index]
  member  = var.member
}
