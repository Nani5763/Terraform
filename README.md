# Terraform
1) What is Terraform.tfstate ?
Ans--> It's Monitoring a remote state that is called .tfstate
2) What is Terraform Init ?
Ans--> Initializing a Providing Plugin into Working Directory
3) What is Output.tf ?
Ans--> Print Output Values.
4) What is variable.tf ?
Ans--> To give the values to main.tf
5) What is Terraform.tfvars?
Ans--> To give the values to variable.tf

## Statefile ##
## What is state and why is it important in Terraform? #########
“Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures. This state file is extremely important; it maps various resource metadata to actual resource IDs so that Terraform knows what it is managing. This file must be saved and distributed to anyone who might run Terraform.”

## Remote State ##
“By default, Terraform stores state locally in a file named terraform.tfstate. When working with Terraform in a team, use of a local file makes Terraform usage complicated because each user must make sure they always have the latest state data before running Terraform and make sure that nobody else runs Terraform at the same time.”

“With remote state, Terraform writes the state data to a remote data store, which can then be shared between all members of a team.”

## State Lock ##
“If supported by your backend, Terraform will lock your state for all operations that could write state. This prevents others from acquiring the lock and potentially corrupting your state.”

“State locking happens automatically on all operations that could write state. You won’t see any message that it is happening. If state locking fails, Terraform will not continue. You can disable state locking for most commands with the -lock flag but it is not recommended.”