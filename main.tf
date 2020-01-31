/*
 * Copyright (c) 2019 Netic A/S. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

locals {
  tags = {
    Terraform = "true"
  }

  all_tags = merge(var.tags, local.tags)
}

resource "aws_rds_cluster_parameter_group" "this_no_prefix" {
  count = var.use_name_prefix ? 0 : 1

  name        = var.name
  description = var.description
  family      = var.family

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }

  tags = merge(
    {
      "Name" = var.name
    },
    local.all_tags,
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_rds_cluster_parameter_group" "this" {
  count = var.use_name_prefix ? 1 : 0

  name_prefix = var.name_prefix
  description = var.description
  family      = var.family

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }

  tags = merge(
    {
      "Name" = var.name
    },
    local.all_tags,
  )

  lifecycle {
    create_before_destroy = true
  }
}
