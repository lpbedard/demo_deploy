#!groovy
library identifier: 'deploy_pipeline@master', retriever: modernSCM([
    $class       : 'GitSCMSource',
    remote       : 'git@bitbucket.org:coveord/deploy_pipeline.git',
    credentialsId: 'coveo-bitbucket-rd-ssh'])

node('linux&&docker') {
  checkout scm
  def deployStatus 

  // Deploy with terragrunt
  deployStatus = deployTerraform(
    terragruntDir      : 'deploy',
    slackChannel       : '@lpbedard',
  )

  if (deployStatus) {
    currentBuild.result = 'SUCCESS'
  } else {
    currentBuild.result = 'FAILURE'
  }
}
