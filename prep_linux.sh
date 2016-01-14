#!/bin/bash -e
ver=$(fgrep '#define VERSION ' stringtie.cpp)
ver=${ver#*\"}
ver=${ver%%\"*}
srcpack=stringtie-$ver
source prep_source.sh
linpack=$srcpack.Linux_x86_64
echo "preparing $linpack.tar.gz"
echo "-------------------"
/bin/rm -rf $linpack
/bin/rm -f $linpack.tar.gz
mkdir $linpack
cd $srcpack
make cleanall
make static
cp LICENSE README stringtie ../$linpack/
cd ..
tar cvfz $linpack.tar.gz $linpack
ls -l $linpack.tar.gz
echo "If you're on igmN machines you can also update the web files:"
echo "cp $linpack.tar.gz $srcpack.tar.gz  ~/html/software/stringtie/dl/"
echo "perl -i -pe 's/stringtie\-\d\.\d+\.\d+\w?\./stringtie-$ver./g' ~/html/software/stringtie/home.shtml"
