# Write terraform code to Add IAM users

1. Create an IAM Group
    - `aws_iam_group`
2. Create and Attach an IAM policy to IAM group
    - `aws_iam_policy`
    - `aws_iam_group_policy_attachment`
3. Create a Policy to managed IAM Security credentials
    - `aws_iam_policy`
4. Create an IAM User
    - `aws_iam_user`
5. Add the IAM user to IAM group
    - `aws_iam_user_group_membership`
6. Keep Everything tagged

## NOTE

Please generate your own access keys with awscli command:
* Replace USERNAME with name of your IAM USER.
* AWS_PROFILE with default AWS profile.

```bash
aws iam create-access-key --user-name "USERNAME" --profile "AWS_PROFILE"
```

## Terraform Plans

<details><summary>Terraform plan (Development)</summary>
<p>

```terraform
-----------------------------------------------------------------------
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_group.terraform_batch will be created
  + resource "aws_iam_group" "terraform_batch" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "terraform"
      + path      = "/batch1/"
      + unique_id = (known after apply)
    }

  # aws_iam_group_policy_attachment.managing_credentials will be created
  + resource "aws_iam_group_policy_attachment" "managing_credentials" {
      + group      = "terraform"
      + id         = (known after apply)
      + policy_arn = (known after apply)
    }

  # aws_iam_group_policy_attachment.s3_bucket will be created
  + resource "aws_iam_group_policy_attachment" "s3_bucket" {
      + group      = "terraform"
      + id         = (known after apply)
      + policy_arn = (known after apply)
    }

  # aws_iam_policy.group_policy will be created
  + resource "aws_iam_policy" "group_policy" {
      + arn         = (known after apply)
      + description = "IAM policy for the terraform group"
      + id          = (known after apply)
      + name        = "terraform-group-policy"
      + path        = "/"
      + policy      = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "s3:*",
                        ]
                      + Effect   = "Allow"
                      + Resource = "arn:aws:s3:::demo1-bucket-testing"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id   = (known after apply)
      + tags_all    = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
    }

  # aws_iam_policy.manage_own_credentials will be created
  + resource "aws_iam_policy" "manage_own_credentials" {
      + arn         = (known after apply)
      + description = "IAM policy for the terraform group to manage own credentials"
      + id          = (known after apply)
      + name        = "manage-credential-policy"
      + path        = "/"
      + policy      = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "iam:CreateAccessKey",
                          + "iam:DeleteAccessKey",
                          + "iam:UpdateAccessKey",
                          + "iam:ListAccessKeys",
                        ]
                      + Effect   = "Allow"
                      + Resource = "arn:aws:iam::*:user/${aws:username}"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id   = (known after apply)
      + tags_all    = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
    }

  # aws_iam_user.users["akhil"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "akhil"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["gomsi"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "gomsi"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["mehek"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "mehek"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["mitali"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "mitali"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["muskan"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "muskan"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["neha"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "neha"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["pavan_kumar"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "pavan_kumar"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["pawan_kumar"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "pawan_kumar"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["priti"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "priti"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["rajat"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "rajat"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["rajesh"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "rajesh"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["ramya_sree"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "ramya_sree"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["ranu"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "ranu"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["ravi"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "ravi"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["saloni"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "saloni"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["sangya"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "sangya"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["saurabh"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "saurabh"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["shreya"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "shreya"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["shrishti"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "shrishti"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["shweta"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "shweta"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["shwetank"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "shwetank"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["siddhi"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "siddhi"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["smita"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "smita"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["sourabh"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "sourabh"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["sowmya"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "sowmya"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["srashti"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "srashti"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["sujendra"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "sujendra"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["sushma"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "sushma"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["trupti"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "trupti"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.users["yasasvi"] will be created
  + resource "aws_iam_user" "users" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "yasasvi"
      + path          = "/cloud_users/"
      + tags_all      = {
          + "environment"       = "development"
          + "team"              = "devops"
          + "terraform_managed" = "true"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user_group_membership.this["akhil"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "akhil"
    }

  # aws_iam_user_group_membership.this["gomsi"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "gomsi"
    }

  # aws_iam_user_group_membership.this["mehek"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "mehek"
    }

  # aws_iam_user_group_membership.this["mitali"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "mitali"
    }

  # aws_iam_user_group_membership.this["muskan"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "muskan"
    }

  # aws_iam_user_group_membership.this["neha"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "neha"
    }

  # aws_iam_user_group_membership.this["pavan_kumar"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "pavan_kumar"
    }

  # aws_iam_user_group_membership.this["pawan_kumar"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "pawan_kumar"
    }

  # aws_iam_user_group_membership.this["priti"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "priti"
    }

  # aws_iam_user_group_membership.this["rajat"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "rajat"
    }

  # aws_iam_user_group_membership.this["rajesh"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "rajesh"
    }

  # aws_iam_user_group_membership.this["ramya_sree"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "ramya_sree"
    }

  # aws_iam_user_group_membership.this["ranu"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "ranu"
    }

  # aws_iam_user_group_membership.this["ravi"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "ravi"
    }

  # aws_iam_user_group_membership.this["saloni"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "saloni"
    }

  # aws_iam_user_group_membership.this["sangya"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "sangya"
    }

  # aws_iam_user_group_membership.this["saurabh"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "saurabh"
    }

  # aws_iam_user_group_membership.this["shreya"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "shreya"
    }

  # aws_iam_user_group_membership.this["shrishti"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "shrishti"
    }

  # aws_iam_user_group_membership.this["shweta"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "shweta"
    }

  # aws_iam_user_group_membership.this["shwetank"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "shwetank"
    }

  # aws_iam_user_group_membership.this["siddhi"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "siddhi"
    }

  # aws_iam_user_group_membership.this["smita"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "smita"
    }

  # aws_iam_user_group_membership.this["sourabh"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "sourabh"
    }

  # aws_iam_user_group_membership.this["sowmya"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "sowmya"
    }

  # aws_iam_user_group_membership.this["srashti"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "srashti"
    }

  # aws_iam_user_group_membership.this["sujendra"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "sujendra"
    }

  # aws_iam_user_group_membership.this["sushma"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "sushma"
    }

  # aws_iam_user_group_membership.this["trupti"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "trupti"
    }

  # aws_iam_user_group_membership.this["yasasvi"] will be created
  + resource "aws_iam_user_group_membership" "this" {
      + groups = [
          + "terraform",
        ]
      + id     = (known after apply)
      + user   = "yasasvi"
    }

Plan: 65 to add, 0 to change, 0 to destroy.
-----------------------------------------------------------------------
```

</p>
</details>
