data "template_file" "init-script" {
  template = file("scripts/init.cfg")
}

data "template_file" "shell-script" {
  template = file("scripts/volumes.sh")
   vars = {
       druid_version =var.DRUID_VERSION
     }
}

data "template_cloudinit_config" "cloudinit-example" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.init-script.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.shell-script.rendered
  }
}
