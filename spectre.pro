cache()

lessThan(QT_VERSION, "$${PROJECT_QT_VERSION_MIN}") {
    error("Qt version $${PROJECT_QT_VERSION_MIN} or higher is required")
}

TEMPLATE = subdirs
SUBDIRS = src #tests

OTHER_FILES += \
    "$$PWD"/.gitattributes \
    "$$PWD"/.gitignore \
    "$$PWD"/.qmake.conf \
    "$$PWD"/Makefile \
    "$$PWD"/README.md \
    "$$PWD"/Vagrantfile
