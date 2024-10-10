#if you change this file, you need to run Build>Run qmake. It may or may not happen automatically when you build/run the project
QT = core
#QT       += core gui
#QT       += widgets
#QT       += charts

#compiler flags can go here (QMAKE_CXXFLAGS)? There are also some places for arguements in the Projects tab
#below I'm just suppressing some silly compiler warnings I have no intention of "fixing"
QMAKE_CXXFLAGS +=   -Wno-reorder \
                    -Wno-unused-parameter

CONFIG += c++17

#TARGET will be the name of the .exe created
#the name of this file will be the project name displayed in the file tree view at left and what it's called by the run buttons and in project tab (can be safely changed)
TARGET = opencv-test
TEMPLATE = app
#TEMPLATE = QMAKE_APP_FLAG


#everything with ../* is a relative path. Relative to the location of this .pro file. Thus you can move or rename the ../Qt directory this project file resides in, but don't change stuff below ../Qt/ (or update these ../ things here if you do)
#You can use absolute paths or some sort of %myPath% environment variable, instead, but just be careful about moving or renaming files/directories
#Qt will add the header/source files here if you rightclick project > add new... > c++ class. It also updates if you rename from the project file tree!
#you can also manually add headers/sources to your project by creating the files then listing them below
#careful with captialization! Qt like to make the file names all lower case, regardless of if the actual class has capital letters..
SOURCES += \
        main.cpp

#this tells the build process to compile ui_mainwindow.h from gui layout form thing you can edit (mainwindow.ui)
#note that ui_mainwindow.h doesn't appear in the project tree, but it's in the actual folder with this .pro file. It's also the code your project is actually using from the .ui (compiler does not consider the .ui file, only ui_mainwindow.h)
#you could ditch the .ui form entirely and just manually write the code in ui_mainwindow, then add it to your project... I find this .ui has caused a lot of trouble doing hidden things I didn't understand.
#FORMS +=    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#win32:CONFIG(release, debug|release): LIBS += -L../../opencv-4.9.0_MinGW_Release/x64/mingw/lib/
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../opencv-4.9.0_MinGW_Release/x64/mingw/lib/
#else:unix: LIBS += -L$$PWD/../../opencv-4.9.0_MinGW_Release/x64/mingw/lib/


# so ../.. no longer applies relative to .pro file, seems like it's relative to C:Qt6/whatever/qmake or such, at least for libs
 LIBS += -L$$PWD/../opencv-4.9.0_MinGW_Release/x64/mingw/bin/
 LIBS += -lopencv_highgui490 \
         -lopencv_core490 \
         -lopencv_imgproc490 \
         -lopencv_features2d490 \
         -lopencv_imgcodecs490 \
         -lopencv_videoio490 \
         -lopencv_video490



INCLUDEPATH += $$PWD/../opencv-4.9.0_MinGW_Release/include
#DEPENDPATH += $$PWD/../opencv-4.9.0_MinGW_Release/include
