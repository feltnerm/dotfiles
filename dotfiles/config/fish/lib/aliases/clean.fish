# remove stuff
# pyc files
alias rmpyc "find . -name \*.pyc -exec rm -v {} \;"
# Recursively delete `.DS_Store` files
alias rmdstore "find . -name \*.DS_Store -exec rm -v {} \;"
alias clean "rmpyc; rmdstore"
