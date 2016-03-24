# Access Derivatives

Ruby scripts used at NCSU Libraries for creating access derivatives.

## Installation

    $ gem install access-derivatives

## Usage

TODO: Write usage instructions here

### Usage JP2 processing

NOT YET IMPLEMENTED

TIF images are expected to be uploaded to `av1.lib.ncsu.edu:/html5/tifs/`, have an ending extension of ".tif" and made group readable and writable by a user in the `iiif` group. Subdirectories are OK.

The user that runs this script needs to be in the `iiif` group to write to /access-images/jp2s and the `scrc` group to write to /storage/temporary.

```
process_jp2s
```

This will also be set up as a cron job.

## OUTDATED: Example of fixing a batch

```sh
mkdir /html5/video/output/mc00256-jnronall/
PROCESS_VIDEO_OUTPUT_DIRECTORY=/html5/video/output/mc00256-jnronall/ nohup process_video /html5/video/uploads/mc00256 > upload_batch.out 2> upload_batch.err < /dev/null &
```
