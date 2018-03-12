project = "jenkins_demo_deploy"

source_path = "../terraform"

terragrunt = {
  include {
    source = "${discover("bootstrap/latest", default(var.env, "default"), default(var.region, "us-east-1"))}"
  }
}
