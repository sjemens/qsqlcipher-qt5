TEMPLATE = subdirs
SUBDIRS += qsqlcipher
CONFIG(withTests): SUBDIRS += tests

OTHER_FILES += .qmake.conf README.md
