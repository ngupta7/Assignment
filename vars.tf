variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AWS_ACCESS_KEY" {
}
variable "AWS_SECRET_KEY" {
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "AMIS" {
  default = "ami-0fb2e589f13f53026"
}
variable "DRUID_VERSION" {
  default ="0.15.0"
}
