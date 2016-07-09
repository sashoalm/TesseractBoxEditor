TEMPLATE = app
VERSION = 1.13dev
TARGET = qt-box-editor-$${VERSION}

DEPENDPATH += ./ \
    resource/images \
    resource

QT += network

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
    Settings.h \
    TessTools.h \
    DelegateEditors.h \
    SettingsDialog.h \
    GetRowIDDialog.h \
    ShortCutsDialog.h \
    FindDialog.h \
    DrawRectangle.h

RESOURCES = resources/application.qrc

LIBS += -llept -ltesseract

win32 {
    DESTDIR = ./win32
    CONFIG += release embed_manifest_exe
    TMAKE_CXXFLAGS += -DQT_NODLL
    TMAKE_CXXFLAGS += -fno-exceptions -fno-rtti -static
    DEFINES += WINDOWS
    RC_FILE = resources/win.rc
    INCLUDEPATH += $$PWD/win32-external/include/
    LIBS += -lws2_32 -L$$PWD/win32-external/lib
}

unix:!macx {
    greaterThan(QT_MAJOR_VERSION, 5) {
      QT += widgets
      INCLUDEPATH += /opt/include/
      LIBS += -L/opt/lib
    }
}

# Libraries may be installed this way on Mac OS X:
# brew install leptonica
# brew install --training-tools --all-languages --HEAD https://gist.githubusercontent.com/fake-or-dead/8f1e817681847b689d2d/raw/915a5f6726a7aced6d75b902959fda1ae2d559c7/tesseract.rb
#
# TESSDATE_PREFIX in the Settings of the App is: /usr/local/share/
# Then close Settings and reopen Settings to select the language
macx {
    QT += widgets
    INCLUDEPATH += /usr/local/include/
    LIBS += -L/usr/local/lib
}
