QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

VERSION = 1.13dev
TARGET = qt-box-editor-$${VERSION}
TEMPLATE = app

DEPENDPATH += ./ \
    resource/images \
    resource

DEFINES += VERSION=\\\"$${VERSION}\\\"

FORMS += \
    ShortCutDialog.ui \
    GetRowIDDialog.ui \
    SettingsDialog.ui \
    FindDialog.ui \
    DrawRectangle.ui

SOURCES += main.cpp \
    MainWindow.cpp \
    ChildWidget.cpp \
    DelegateEditors.cpp \
    TessTools.cpp \
    SettingsDialog.cpp \
    GetRowIDDialog.cpp \
    ShortCutsDialog.cpp \
    FindDialog.cpp \
    DrawRectangle.cpp

HEADERS += MainWindow.h \
    ChildWidget.h \
    TessTools.h \
    DelegateEditors.h \
    SettingsDialog.h \
    GetRowIDDialog.h \
    ShortCutsDialog.h \
    FindDialog.h \
    DrawRectangle.h

RESOURCES = resources/application.qrc

LIBS += -llept -ltesseract
