# AWS EC2

## Roles

* [Using an IAM role to grant permissions to applications running on Amazon EC2 instances](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html)

## User data

* [Run commands on your Linux instance at launch](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)
* Run user-data on each server restart (default is only when created) ([How can I utilize user data to automatically run a script with every restart of my Amazon EC2 Linux instance?](https://aws.amazon.com/premiumsupport/knowledge-center/execute-user-data-ec2/))
* View logs: `sudo tail -f /var/log/cloud-init-output.log`

## Debug user data

* <https://gist.github.com/jacoor/1088efc66c2bf168c08c290bf69f6969>

## Security groups

* [Security group rules](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-rules.html)