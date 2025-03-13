import QtQuick
import QtQuick.Layouts 2.15

Item {
    implicitHeight: 200
    width: 2000
    readonly property ListView __lv: ListView.view

    Rectangle{
        width: parent.width
        height: parent.height
        color: "transparent"
        Column{
            RowLayout{
                width: parent.width
                Column {
                    Text {
                        text: datetime
                        font.pointSize: 50
                        padding: 10
                        color: "blue"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        text: action
                        font.pointSize: 50
                        padding: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                Column {
                    width: parent.width/2

                    Text {
                        text: counter
                        font.pointSize: 90
                        leftPadding: 100
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }

        }

        MouseArea{
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                console.log("MauseArea clicked at index", index)
                __lv.currentIndex = index
                console.log("Item clicked at index:", index)
            }
        }
    }
}
