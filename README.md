## Steps:-
- Prepare containers.json:-
  `{
    "Description": "My server VMDK",
    "Format": "VMDK",
    "UserBucket": {
    "S3Bucket": "<bucket_name>",
    "S3Key": "<S3_bucket_key>"
    }
  } `
  
  Reference: https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-import-snapshot.html
- Import to snapshot from VMDK
   - Type `aws ec2 import-snapshot \
--disk-container Format=VMDK,UserBucket={S3Bucket=<Bucket_name>,S3Key=<Bucket_key>}` , to import VMDK to snapshot.

- Import Snapshot to AMI
   - Type `aws ec2 register-image \
--name cisco-cml-on-aws \
--root-device-name /dev/xvda \
--boot-mode uefi \
--block-device-mappings DeviceName=/dev/xvda,Ebs={SnapshotId=<snapshot_id>} DeviceName=/dev/xvdf,Ebs={VolumeSize=50}` , to import AMI from snapshot.

## To Provision Stack from Jenkins:
    
   ![image](https://user-images.githubusercontent.com/69294193/207291650-f4f84213-c706-4e50-8ce5-f1cd2f538a7f.png)

  
  https://engci-jenkins-rtp.cisco.com/jenkins/job/learning-platform/job/learning-platform/job/cisco-cml-aws/job/main/
  
  - Jenkins console:-
     Click on link > Build 
## To Manage AWS Credentials:
  https://engci-jenkins-rtp.cisco.com/jenkins/job/learning-platform/credentials/store/folder/domain/_/credential/cisco_modeling_lab/ 

## Application which is running on server

- Application running on `443`
    `<eip:443>`
                  
     ![image](https://user-images.githubusercontent.com/69294193/207246036-3e0df538-0e1c-464a-a8a6-095c66c95177.png)

          
    

- Application running on `9090`
      `<eip:9090>`
 
    ![image](https://user-images.githubusercontent.com/69294193/207246424-60823eb0-6bb3-46ec-905e-ef170e41c5d0.png)
