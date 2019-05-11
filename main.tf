provider "aws" {
  region = "${var.region}"
}

# define dynamoDB table to store weather info