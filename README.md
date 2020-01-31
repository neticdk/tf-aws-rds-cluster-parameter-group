# Netic AWS RDS Cluster Parameter Group Module

## Supported Terraform Versions

Terraform 0.12

## Usage

```hcl
module "rds_cluster_parameter_group" {
  source  = "github.com/neticdk/tf-aws-rds-cluster-parameter-group"
  family  = "aurora-postgresql10"
  name_prefix = "mycluster"
}
```

<!---BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK--->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| description | The description of the DB cluster parameter group. Defaults to "Managed by Terraform". | `string` | n/a | yes |
| family | The family of the DB cluster parameter group | `string` | n/a | yes |
| name | The name of the DB cluster parameter group. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| name\_prefix | Creates a unique name beginning with the specified prefix. Conflicts with name. | `string` | n/a | yes |
| parameters | A list of DB parameters (map) to apply | `list(map(string))` | `[]` | no |
| tags | A map of tags to add to all resources | `map` | `{}` | no |
| use\_name\_prefix | Whether to use name\_prefix or not | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| rds\_cluster\_parameter\_group\_arn | The ARN of the db cluster parameter group |
| rds\_cluster\_parameter\_group\_id | The db cluster parameter group name |

<!---END OF PRE-COMMIT-TERRAFORM DOCS HOOK--->

# Copyright
Copyright (c) 2020 Netic A/S. All rights reserved.

# License
MIT Licened. See LICENSE for full details.

