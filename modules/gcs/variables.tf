/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "uniform_bucket_level_access" {
  description = "Optional map to allow using object ACLs (false) or not (true, this is the recommended behavior) , defaults to true (which is the recommended practice, but not the behavior of storage API)."
  type        = map(bool)
  default     = {}
}

variable "force_destroy" {
  description = "Optional map to set force destroy keyed by name, defaults to false."
  type        = map(bool)
  default     = {}
}

variable "iam_members" {
  description = "IAM members keyed by bucket name and role."
  type        = map(map(list(string)))
  default     = {}
}

variable "iam_roles" {
  description = "IAM roles keyed by bucket name."
  type        = map(list(string))
  default     = {}
}

variable "encryption_keys" {
  description = "Per-bucket KMS keys that will be used for encryption."
  type        = map(string)
  default     = {}
}

variable "labels" {
  description = "Labels to be attached to all buckets."
  type        = map(string)
  default     = {}
}

variable "lifecycle_rule" {
  description = "Bucket lifecycle rule"
  type = object({
    action = object({
      type          = string
    })
    condition = object({
      age                = number
      with_state         = string
      num_newer_versions = number
    })
  })
  default = null
}

variable "location" {
  description = "Bucket location."
  type        = string
  default     = "EU"
}

variable "logging_config" {
  description = "Per-bucket logging."
  type = map(object({
    log_bucket        = string
    log_object_prefix = string
  }))
  default = {}
}

variable "names" {
  description = "Bucket name suffixes."
  type        = list(string)
}

variable "prefix" {
  description = "Prefix used to generate the bucket name."
  type        = string
  default     = null
}

variable "project_id" {
  description = "Bucket project id."
  type        = string
}

variable "retention_policies" {
  description = "Per-bucket retention policy."
  type = map(object({
    retention_period = number
    is_locked        = bool
  }))
  default = {}
}

variable "storage_class" {
  description = "Bucket storage class."
  type        = string
  default     = "MULTI_REGIONAL"
}

variable "versioning" {
  description = "Optional map to set versioning keyed by name, defaults to false."
  type        = map(bool)
  default     = {}
}
