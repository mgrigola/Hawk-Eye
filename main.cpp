#include <QCoreApplication>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/opencv.hpp>

using namespace cv;

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // Set up code that uses the Qt event loop here.
    // Call a.quit() or a.exit() to quit the application.
    // A not very useful example would be including
    // #include <QTimer>
    // near the top of the file and calling
    // QTimer::singleShot(5000, &a, &QCoreApplication::quit);
    // which quits the application after 5 seconds.

    // If you do not need a running Qt event loop, remove the call
    // to a.exec() or use the Non-Qt Plain C++ Application template.
    Mat img;
    char keyPress;

    img = imread("C:/Users/m/Pictures/Biohazard 512.png", IMREAD_COLOR);
    namedWindow( "Display window", WINDOW_AUTOSIZE ); // Create a window for display.
    imshow( "Display window", img ); // Show our image inside it.

    while(true) {
        keyPress = waitKey();
        if (keyPress == 'q') {
            destroyAllWindows();
            break;
        }

    }

    //return 0;
    return a.exec();
}
