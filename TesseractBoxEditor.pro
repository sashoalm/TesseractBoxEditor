QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

VERSION = 1.13dev
TARGET = TesseractBoxEditor
TEMPLATE = app

DEPENDPATH += ./ \
    resource/images \
    resource

DEFINES += VERSION=\\\"$${VERSION}\\\"

FORMS += \
    drawrectangle.ui \
    finddialog.ui \
    getrowiddialog.ui \
    settingsdialog.ui \
    shortcutdialog.ui

SOURCES += main.cpp \
    childwidget.cpp \
    delegateeditors.cpp \
    drawrectangle.cpp \
    finddialog.cpp \
    getrowiddialog.cpp \
    mainwindow.cpp \
    settingsdialog.cpp \
    shortcutsdialog.cpp \
    tesstools.cpp

HEADERS += \
    childwidget.h \
    delegateeditors.h \
    drawrectangle.h \
    finddialog.h \
    getrowiddialog.h \
    mainwindow.h \
    settingsdialog.h \
    shortcutsdialog.h \
    tesstools.h

RESOURCES = resources/application.qrc

LIBS += -llept -ltesseract
