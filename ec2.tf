provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "android_ec2" {
    ami           = "ami-0c02fb55956c7d316" # Replace with a valid Android-compatible AMI ID
    instance_type = "t2.medium"

    tags = {
        Name = "Android-EC2"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update",
            "sudo apt-get install -y openjdk-11-jdk",
            "wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip",
            "unzip commandlinetools-linux-8512546_latest.zip -d android-sdk",
            "yes | android-sdk/cmdline-tools/bin/sdkmanager --licenses",
            "android-sdk/cmdline-tools/bin/sdkmanager 'platform-tools' 'platforms;android-30'"
        ]

        connection {
            type     = "ssh"
            user     = "ubuntu"
            private_key = file("~/.ssh/id_rsa")
            host     = self.public_ip
        }
    }
}