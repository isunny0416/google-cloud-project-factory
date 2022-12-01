/**
 * Organization policy (boolean constraint)
 */
resource "google_org_policy_policy" "org_policy_boolean" {
  count = local.organization && local.boolean_policy ? 1 : 0

  name   = "organizations/${var.policy_root_id}/policies/${var.constraint}"
  parent = "organizations/${var.policy_root_id}"

  spec {
    dynamic "rules" {
      for_each = local.rules
      content {
        enforce = rules.value.enforcement ? "TRUE" : "FALSE"
        dynamic "condition" {
          for_each = { for k, v in rules.value.conditions : k => v if length(rules.value.conditions) > 0 }
          content {
            description = condition.value.description
            expression  = condition.value.expression
            location    = condition.value.location
            title       = condition.value.title
          }
        }
      }
    }
  }
}

/**
 * Folder policy (boolean constraint)
 */
resource "google_org_policy_policy" "folder_policy_boolean" {
  count = local.folder && local.boolean_policy ? 1 : 0

  name   = "folders/${var.policy_root_id}/policies/${var.constraint}"
  parent = "folders/${var.policy_root_id}"

  spec {
    dynamic "rules" {
      for_each = local.rules
      content {
        enforce = rules.value.enforcement ? "TRUE" : "FALSE"
        dynamic "condition" {
          for_each = { for k, v in rules.value.conditions : k => v if length(rules.value.conditions) > 0 }
          content {
            description = condition.value.description
            expression  = condition.value.expression
            location    = condition.value.location
            title       = condition.value.title
          }
        }
      }
    }
  }
}

/**
 * Project policy (boolean constraint)
 */
resource "google_org_policy_policy" "project_policy_boolean" {
  count = local.project && local.boolean_policy ? 1 : 0

  name   = "projects/${var.policy_root_id}/policies/${var.constraint}"
  parent = "projects/${var.policy_root_id}"

  spec {
    dynamic "rules" {
      for_each = local.rules
      content {
        enforce = rules.value.enforcement ? "TRUE" : "FALSE"
        dynamic "condition" {
          for_each = { for k, v in rules.value.conditions : k => v if length(rules.value.conditions) > 0 }
          content {
            description = condition.value.description
            expression  = condition.value.expression
            location    = condition.value.location
            title       = condition.value.title
          }
        }
      }
    }
  }
}

/******************************************
  Exclude folders from policy (boolean constraint)
 *****************************************/
resource "google_org_policy_policy" "policy_boolean_exclude_folders" {
  for_each = (local.boolean_policy && !local.project) ? var.exclude_folders : []

  name   = "folders/${var.policy_root_id}/policies/${var.constraint}"
  parent = "folders/${var.policy_root_id}"

  spec {
    rules {
      enforce = "FALSE"
    }
  }
}
/******************************************
  Exclude projects from policy (boolean constraint)
 *****************************************/
resource "google_org_policy_policy" "policy_boolean_exclude_projects" {
  for_each = (local.boolean_policy && !local.project) ? var.exclude_projects : []

  name   = "projects/${var.policy_root_id}/policies/${var.constraint}"
  parent = "projects/${var.policy_root_id}"

  spec {
    rules {
      enforce = "FALSE"
    }
  }
}
