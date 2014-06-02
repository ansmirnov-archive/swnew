#!/bin/sh

# params: ip_host port

if echo $1 |grep -q -P '10\.25[45]\.\d\.254|10.25[45]\.0\.\d|172\.18\.\d\.\d'; then exit 0; fi
if echo $2 |grep -q -P '25|26|27|28'; then exit 0; fi
exit 1
