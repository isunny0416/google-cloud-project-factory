/*
 * Folder IAM member authoritative
*/

resource "google_folder_iam_member" "folder_iam_member" {
  count  = local.folder ? length(var.iam_roles) : 0
  folder = var.iam_root_id
  role   = var.iam_roles[count.index]
  member = var.member
}
