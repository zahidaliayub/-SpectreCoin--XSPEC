TEMPLATE = app
TARGET = "$$PROJECT_APP_DISPLAY_NAME"
VERSION = "$$PROJECT_APP_VERSION"

#QT += qml quick quickwidgets

#CONFIG *= c++14

#HEADERS += ...
SOURCES += \
    "$$PWD"/main.cpp

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH +=

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH +=

DEFINES += \
    QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII \
    QT_NO_CAST_FROM_BYTEARRAY \
    QT_NO_URL_CAST_FROM_STRING \
    QT_DEPRECATED_WARNINGS \
    QT_DISABLE_DEPRECATED_BEFORE=0x050701 # Disables all the APIs deprected before selected version
