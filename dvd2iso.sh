#!/bin/bash
TEMPDIR=/rips/`date +%s`
TITILE=`lsdvd 2> /dev/null | awk '/Disc Title: / {print $3}'`

echo ">> ripping DVD to " $TEMPDIR/$TITILE".iso"

mkdir -p "$TEMPDIR"

echo ">> dvdbackup..."
dvdbackup -i /dev/dvd -M -o "$TEMPDIR" -n "$TITILE"

echo ">> genisoimage..."
genisoimage -dvd-video -o $TEMPDIR/$TITILE".iso" "$TEMPDIR/$TITILE"

echo ">> rm dvd folder..."
rm -rf "$TEMPDIR/$TITILE"
