resource "aws_s3_bucket" "dev" {
    bucket = "jhfufekjipoqnwbyefnbhrnkn"
  
}
#Usage: terraform [global options] workspace

  #new, list, show, select and delete Terraform workspaces.

#Subcommands:
    #delete    Delete a workspace
    #list      List Workspaces
    #new       Create a new workspace
    #select    Select a workspace
    #show      Show the name of the current workspace


#1)list----->List Workspaces:
#terraform workspace list
  #default
# * dev

#2)new----->Create a new workspace:command = terraform workspace new "Name"

#3)select---->Select a workspace:command = terraform workspace select "Name"[Switched to workspace]

#4)show----->Show the name of the current workspace:command = terraform workspace show

#5)delete----->Delete a workspace:command = terraform workspace delete "Name"
