terraform {
  required_providers {
    prismacloud = {
      source = "PaloAltoNetworks/prismacloud"
      version = "1.3.7"
    }
  }
}

# Onboard the cloud account onto Prisma Cloud platform
resource "prismacloud_cloud_account_v2" "aws_account_onboarding_example" {
    disable_on_destroy = true
    aws {
        name = "myAwsAccountName" // should be unique for each account
        account_id = "xxxxxxxxxx"
        group_ids = [
            data.prismacloud_account_group.existing_account_group_id.group_id,// To use existing Account Group
            // prismacloud_account_group.new_account_group.group_id, // To create new Account group
        ]
        role_arn = "${aws_cloudformation_stack.prismacloud_iam_role_stack.outputs.PrismaCloudRoleARN}" // IAM role arn from prismacloud_iam_role_stack resource
        // features {              // feature names from prismacloud_supported_features data source
        //     name = "Remediation" // To enable Remediation also known as Monitor and Protect
        //     state = "enabled"
        // }
        // features {
        //     name = "Agentless Scanning" // To enable 'Agentless Scanning' feature if required.
        //     state = "enabled"
        // }
    }
}