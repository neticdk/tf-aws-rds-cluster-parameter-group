/*
 * Copyright (c) 2019 Netic A/S. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "name" {
  description = "The name of the DB cluster parameter group. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  type        = string
}

variable "use_name_prefix" {
  description = "Whether to use name_prefix or not"
  type        = bool
  default     = true
}

variable "family" {
  description = "The family of the DB cluster parameter group"
  type        = string
}

variable "description" {
  description = "The description of the DB cluster parameter group. Defaults to \"Managed by Terraform\"."
  type        = string
  default     = null
}

variable "parameters" {
  description = "A list of DB parameters (map) to apply"
  type        = list(map(string))
  default     = []
}
