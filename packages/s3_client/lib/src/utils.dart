import '../enum/acl.dart';

String aclToString(ACL acl) {
  switch (acl) {
    case ACL.private:
      return 'private';
    case ACL.publicRead:
      return 'public-read';
    case ACL.publicReadWrite:
      return 'public-read-write';
    case ACL.awsExecuteRead:
      return 'aws-exec-read';
    case ACL.authenticatedAccess:
      return 'authenticated-read';
    case ACL.bucketOwnerRead:
      return 'bucket-owner-read';
    case ACL.bucketOwnerFullControl:
      return 'bucket-owner-full-control';
    case ACL.logDeliveryWrite:
      return 'log-delivery-write';
  }
}
