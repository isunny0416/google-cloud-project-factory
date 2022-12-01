/*
 * Organization IAM member authoritative
*/

resource "google_organization_iam_member" "folder_iam_member" {
  count  = local.organization ? length(var.iam_roles) : 0
  org_id = var.iam_root_id
  role   = var.iam_roles[count.index]
  member = var.member
}
