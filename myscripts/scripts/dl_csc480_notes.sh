#!/bin/bash
#
# this downloads new pdf files (existing checked against timestamps) from specified site to specified dir
wget -Nrp -nd -A pdf -e robots=off 'http://www-cs.ccny.cuny.edu/~wes/CSC480F17/docs/lectures/' -P /home/mg/Dropbox/School/City\ College/2017/2017\ Fall/CSC480-CompSecurity/notes
