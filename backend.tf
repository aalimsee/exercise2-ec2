terraform{
    backend "s3" {
    #bucket = "aalimsee-ce9-test-bucket" 
    bucket = "sctp-ce9-tfstate"
    key    = "aalimsee-ce9-exercise2-ec2.tfstate" 
    # Replace the value of key to <your suggested name>.tfstate, eg. terraform-ex-ec2-<NAME>.tfstate
    region = "us-east-1"
  }
}