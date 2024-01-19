# resource "aws_efs_file_system" "whisper_efs" {
#   creation_token = "whisper-efs"

#   tags = {
#     Name = "WhisperEFS"
#   }
# }


# resource "aws_efs_access_point" "whisper_efs_access_point" {
#   file_system_id = aws_efs_file_system.whisper_efs.id

#   // Optional: Specify the POSIX user and group
#   posix_user {
#     gid = 1000 # appuser defined in Dockerfile
#     uid = 1000
#   }

#   // Optional: Specify the root directory settings
#   root_directory {
#     path = "/tmp"
#     creation_info {
#       owner_gid   = 1000
#       owner_uid   = 1000
#       permissions = "0777"
#     }
#   }
# }

# resource "aws_security_group" "efs_sg" {
#   name        = "efs-sg"
#   description = "Security group for EFS"
#   vpc_id      = aws_vpc.whisper_vpc.id

#   // Allow inbound NFS traffic from the Fargate tasks' security group
#   ingress {
#     from_port       = 2049
#     to_port         = 2049
#     protocol        = "tcp"
#     security_groups = [aws_security_group.whisper_app_sg.id]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "EFS Security Group"
#   }
# }

# resource "aws_security_group_rule" "allow_nfs" {
#   type              = "ingress"
#   from_port         = 2049
#   to_port           = 2049
#   protocol          = "tcp"
#   cidr_blocks       = [aws_subnet.whisper_subnet_1.cidr_block]
#   security_group_id = aws_security_group.efs_sg.id
# }


# resource "aws_efs_mount_target" "efs_mt" {
#   file_system_id  = aws_efs_file_system.whisper_efs.id
#   subnet_id       = aws_subnet.whisper_subnet_1.id
#   security_groups = [aws_security_group.efs_sg.id] // Security group for the EFS mount target
# }
