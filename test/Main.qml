import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: main
    width: 1024
    height: 600
    visible: true
    title: qsTr("Counter App")

    property var logModel: ListModel{
        id: logModel
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: homePageComponent
    }

    Component{
        id: homePageComponent
        HomePage{}
    }

    Component{
        id: logPageComponent
        LogPage{}
    }
}
