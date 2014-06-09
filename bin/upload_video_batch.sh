#!/bin/bash

# upload_video_batch.sh /path/to/batch/directory

# Setting for directory to where the batch directory ought to be uploaded
upload_batch_directory_base=/var/uploads/

# This only works if the local user
whoami=`whoami`

# Grab the first argument into a variable so that we can do the basename substitution.
argv0=$1
# The basename from whatever path was given
basename=${argv0##*/}

# Copy the files to the remote server under the upload batch directory.
scp -r $1 $whoami@av1.lib.ncsu.edu:$upload_batch_directory_base
chmod g+rx $upload_batch_directory_base/$basename
chmod g+r $upload_batch_directory_base/$basename/*

echo "Hit ENTER when you wish to continue."
read SOMETHIGNANYTHING

# Trigger the processing job on the remove server and background it using nohup.
# Output and errors will go into files. FFmpeg output goes to standard error.
ssh $whoami@av1.lib.ncsu.edu "nohup process_video /var/uploads/$basename > upload_batch.out 2> upload_batch.err < /dev/null &"