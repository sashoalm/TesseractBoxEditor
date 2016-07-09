TEMPLATE = app
VERSION = 1.13dev
TARGET = qt-box-editor-$${VERSION}

DEPENDPATH += ./ \
    resource/images \
    resource

INCLUDEPATH += ./ \
    dialogs \
    src/include \
    src

QT += network

DEFINES += VERSION=\\\"$${VERSION}\\\"

FORMS += \
    dialogs/ShortCutDialog.ui \
    dialogs/GetRowIDDialog.ui \
    dialogs/SettingsDialog.ui \
    dialogs/FindDialog.ui \
    dialogs/DrawRectangle.ui

SOURCES += src/main.cpp \
    src/MainWindow.cpp \
    src/ChildWidget.cpp \
    src/DelegateEditors.cpp \
    src/TessTools.cpp \
    dialogs/SettingsDialog.cpp \
    dialogs/GetRowIDDialog.cpp \
    dialogs/ShortCutsDialog.cpp \
    dialogs/FindDialog.cpp \
    dialogs/DrawRectangle.cpp

HEADERS += src/MainWindow.h \
    src/ChildWidget.h \
    src/Settings.h \
    src/TessTools.h \
    src/DelegateEditors.h \
    dialogs/SettingsDialog.h \
    dialogs/GetRowIDDialog.h \
    dialogs/ShortCutsDialog.h \
    dialogs/FindDialog.h \
    dialogs/DrawRectangle.h

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
