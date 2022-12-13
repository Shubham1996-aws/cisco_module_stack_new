
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
--root-device-name /dev/xvda --boot-mode uefi
--block-device-mappings DeviceName=/dev/xvda,Ebs={SnapshotId=<snapshot_id>} DeviceName=/dev/xvdf,Ebs={VolumeSize=100}` , to import AMI from snapshot.

- Running Jenkins Job

## Application which is running on server

- Application running on `443`
    `<public_ip:443>`
                  
     ![image](https://user-images.githubusercontent.com/69294193/207246036-3e0df538-0e1c-464a-a8a6-095c66c95177.png)

          
    

- Application running on `9090`
      `<public_ip:9090>`
 
    ![image](https://user-images.githubusercontent.com/69294193/207246424-60823eb0-6bb3-46ec-905e-ef170e41c5d0.png)
