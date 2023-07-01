# In this code we are setting multiple provider block and we are creating a elastic ip in two different regions in a single configuration file.

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-west-1"
  alias  = "N-California"
}

resource "aws_eip" "a" {
  vpc = "true"
}
resource "aws_eip" "b" {
  vpc      = "true"
  provider = "aws.N-California"
}
