#!/bin/sh

HOSTNAME=`hostname -s`
TODAY=`date +%Y%m%d`

SOURCEDIR="${HOME}/Library/Colors"
BACKUPDIR="Colors"

mkdir -p "${BACKUPDIR}"

for FILE in `find ${SOURCEDIR} -name "*.clr"`
do
	BASENAME=`basename ${FILE}`
	FILENAME=${BASENAME%.*}
	EXTNAME=${BASENAME##*.}
	
	DSTFILE="${BACKUPDIR}/${FILENAME}.${HOSTNAME}-${TODAY}.${EXTNAME}"
	
	echo "Backup '${FILE}' to ''${DSTFILE}."
	cp -f "${FILE}" "${DSTFILE}"
done


