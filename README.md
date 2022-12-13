#### cisco-cml-on-aws ####


## Pre-requisties:
- Terraform 
- aws

## Steps:-
- Import to snapshot from VMDK
   - Type `aws ec2 import-snapshot
--disk-container Format=VMDK,UserBucket={S3Bucket=<Bucket_name>,S3Key=<Bucket_key>}` , to import VMDK to snapshot.

- Import Snapshot to AMI
   - Type `aws ec2 register-image
--name <Image_name>
--root-device-name /dev/xvda
--block-device-mappings DeviceName=/dev/xvda,Ebs={SnapshotId=<snapshot_id>} DeviceName=/dev/xvdf,Ebs={VolumeSize=100}` , to import AMI from snapshot.

- Running Jenkins Job
 ![image](https://user-images.githubusercontent.com/69294193/207245325-40c20dea-7869-455a-941a-7358a7887eae.png)

