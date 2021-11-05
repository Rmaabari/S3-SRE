#!/bin/bash

ENDPOINT=http://192.168.42.12:7480
BUCKET=test
FILE=200M

echo -e "Starting Downloading $FILE from s3 $BUCKET bucket"
#FILESIZE=$(stat -c%s "$FILE")
#echo "Size of $FILE = $FILESIZE bytes."
START_TIME=$SECONDS
/usr/local/bin/aws s3 cp --endpoint-url=$ENDPOINT s3://$BUCKET/$FILE .
ELAPSED_TIME=$(($SECONDS - $START_TIME))
#echo -e "Completed uploading binaries ."
echo -e "File $FILE of size $FILESIZE bytes downloaded from s3 Bucket $BUCKET in : $(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) sec \n"
echo ""
#Verify the file uploaded
echo -e "Verifying file Downloaded "
echo ""
file $FILE
echo ""
