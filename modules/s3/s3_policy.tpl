{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "${mys3arn}/*",
            "Condition": {
                "StringEquals": {
                    "aws:SourceArn": "${cdnarn}"
                }
            }
        }
    ]
}
