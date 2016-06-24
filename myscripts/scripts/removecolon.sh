# Explanation:
#   Replaces all Colons (:) in a filename or directory with an underscore (_)
#
# Code Breakdown:
#     for ... in ...; do ...; done is a loop
#     *:* matches all files and directories in the the current directory which have : in their name
#     f is assigned in turn to each such file name
#     mv renames its first argument to the second one; -v (verbose) asks it to print what it does; this option is GNU-utils specific, so it is available on Linux but not Solaris
#     $(...) executes the code in a sub-shell and substitutes the output
#     echo prints its argument to the standard output
#     tr reads standard output and translates the characters according to the supplied map

for f in *:*; do mv -v "$f" $(echo "$f" | tr ':' '_'); done
