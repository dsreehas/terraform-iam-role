module "iam_role" {
  source = "github.com/dsreehas/terraform-eks-iam-role"

  role_name          = var.role_name
  assume_role_policy  = file("./policies/assume_role_policy.json")
  inline_policies     = [file("./policies/inline_policy_1.json"), file("./policies/inline_policy_2.json")]
  managed_policy_arns = var.managed_policy_arns
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "my-instance-profile"
  role = module.iam_role.iam_role_name
}