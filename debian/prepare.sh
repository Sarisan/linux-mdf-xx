#!/bin/sh -e

while [ ${#} -gt 0 ]
do
    case "${1}" in
        (--upstream-version)
            version="${2}"
            shift 2
        ;;
        (*)
            exit 1
        ;;
    esac
done

tar -xC .. -f ../linux-mdf-xx-${version}.tar.xz
cp -a debian ../linux-mdf-xx-${version}
make -C ../linux-mdf-xx-${version} -f debian/rules debian/control
