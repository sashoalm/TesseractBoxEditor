/**********************************************************************
* File:        main.cpp
* Description: Main function
* Author:      Marcel Kolodziejczyk
* Created:     2010-01-04
*
* (C) Copyright 2010, Marcel Kolodziejczyk
* (C) Copyright 2011, Zdenko Podobny
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**    http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*
**********************************************************************/

#include <QTextCodec>
#include <QApplication>
#include <QStyleFactory>

#include "MainWindow.h"

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);
    app.setOrganizationName("qt-box-editor");
    app.setApplicationName("QT Box Editor");
    app.setWindowIcon(QIcon(":/icons/qbe.png"));

    // For Qt4 there is this bug where Unicode string literals from the source
    // code were displayed as garbage text. Turns out the codec for string
    // literals was NULL, which caused Qt to treat them as Latin-1. The source
    // files themselves are encoded as UTF-8, at least on Linux. But I think Qt
    // Creator uses UTF-8 on Windows as well. It's Visual Studio that uses
    // UTF-16.
    if (!QTextCodec::codecForCStrings()) {
        QTextCodec::setCodecForCStrings(QTextCodec::codecForName("UTF-8"));
    }

#if QT_VERSION < QT_VERSION_CHECK(5, 0, 0)
    QTextCodec::setCodecForTr(QTextCodec::codecForName("UTF-8"));
#endif

    MainWindow mainWin;
    mainWin.show();
    for (int i = 1; i < argc; ++i) {
        mainWin.addChild(argv[i]);
    }

    return app.exec();
}

