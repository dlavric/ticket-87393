# ticket-87393

This is just a repository to test the login to the Azuread provider for Terraform

## Prerequisites
- [X] [Terraform](https://www.terraform.io/downloads)

## Instructions

- Copy the repository and go to the repo path:
```shell
git clone https://github.com/dlavric/ticket-87393.git
cd ticket-87393
```

- Login into Azure CLI
```shell
az login
```

- Setup the Azure account with your [Subscription id](https://learn.microsoft.com/en-us/azure/azure-portal/get-subscription-tenant-id#find-your-azure-subscription): 
```shell
az account set --subscription <your-subscription-id>
```

- Get the Terraform dependecies
```shell
terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "~> 3.11"...
- Finding hashicorp/azuread versions matching "~> 2.22.0"...
- Installing hashicorp/azurerm v3.28.0...
- Installed hashicorp/azurerm v3.28.0 (signed by HashiCorp)
- Installing hashicorp/azuread v2.22.0...
- Installed hashicorp/azuread v2.22.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

- Apply the changes
```shell
terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azuread_administrative_unit.example will be created
  + resource "azuread_administrative_unit" "example" {
      + description             = "Just an example"
      + display_name            = "Example-AU"
      + id                      = (known after apply)
      + members                 = (known after apply)
      + object_id               = (known after apply)
      + prevent_duplicate_names = false
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

azuread_administrative_unit.example: Creating...
azuread_administrative_unit.example: Creation complete after 2s [id=a9b89f6b-b453-443b-98f4-2e039a626f4e]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

- Destroy what you created
```shell
terraform destroy

azuread_administrative_unit.example: Refreshing state... [id=a9b89f6b-b453-443b-98f4-2e039a626f4e]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # azuread_administrative_unit.example will be destroyed
  - resource "azuread_administrative_unit" "example" {
      - description               = "Just an example" -> null
      - display_name              = "Example-AU" -> null
      - hidden_membership_enabled = false -> null
      - id                        = "a9b89f6b-b453-443b-98f4-2e039a626f4e" -> null
      - members                   = [] -> null
      - object_id                 = "a9b89f6b-b453-443b-98f4-2e039a626f4e" -> null
      - prevent_duplicate_names   = false -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

azuread_administrative_unit.example: Destroying... [id=a9b89f6b-b453-443b-98f4-2e039a626f4e]
azuread_administrative_unit.example: Still destroying... [id=a9b89f6b-b453-443b-98f4-2e039a626f4e, 10s elapsed]
azuread_administrative_unit.example: Still destroying... [id=a9b89f6b-b453-443b-98f4-2e039a626f4e, 20s elapsed]
azuread_administrative_unit.example: Destruction complete after 25s

Destroy complete! Resources: 1 destroyed.
```