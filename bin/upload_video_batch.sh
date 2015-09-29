#!/bin/bash

# upload_video_batch.sh /path/to/batch/directory

# Setting for directory to where the batch directory ought to be uploaded
upload_batch_directory_base=/html5/video/uploads

# This only works if the local user
whoami=`whoami`

# Grab the first argument into a variable so that we can do the basename substitution.
argv0=$1
# The basename from whatever path was given
basename=`basename $argv0`

# full upload path
full_upload_path=${upload_batch_directory_base}/${basename}
full_upload_path_contents=${full_upload_path}/*

# Copy the files to the remote server under the upload batch directory.
echo -e 'Copying the files to av1... (May need to enter password).\n'
scp -r $1 $whoami@av1.lib.ncsu.edu:$upload_batch_directory_base

echo -e 'Changing group permissions of files. (May need to enter password).'
ssh $whoami@av1.lib.ncsu.edu "chgrp uploaders $full_upload_path && chmod g+rx $full_upload_path && chmod g+rw $full_upload_path_contents"

echo "Hit ENTER when you wish to continue with processing the video. (May need to enter password)."
read SOMETHIGNANYTHING

# Trigger the processing job on the remove server and background it using nohup.
# Output and errors will go into files. FFmpeg output goes to standard error.
ssh $whoami@av1.lib.ncsu.edu "PROCESS_VIDEO_OUTPUT_DIRECTORY=/html5/video/output nohup process_video $full_upload_path > upload_batch.out 2> upload_batch.err < /dev/null &"
