TEMPLATE = subdirs
SUBDIRS += qsqlcipher
CONFIG(withTests): SUBDIRS += tests

OTHER_FILES += README.md
