import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Page {
    title: "Log"
    font.pixelSize: 150

    Component{
        id: itemDelegate

        Row{
            anchors
            {
                left: parent.left
                right: parent.right
            }

            readonly property ListView __lv: ListView.view
            Text {
                text: model.datetime + ' --> '+ model.action +' <--'
                font.pointSize: 50
                padding: 10
                clip: true
                MouseArea{
                    anchors.fill: parent
                    onClicked: __lv.currentIndex = model.index
                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        ListView {
            id: listView
            model: main.logModel
            delegate: LogItemDelegate{}
            Layout.fillWidth: true
            Layout.fillHeight: true

            highlight: Rectangle{
                implicitHeight: 200
                anchors{
                    left: parent.left
                    right: parent.right
                }

                color: "lightgreen"
            }
            onCurrentIndexChanged: {
                console.log("Selected index:", listView.currentIndex)
            }

        }
    }
    footer:
        Button {
        text: "Back to Home"
        onClicked: stackView.pop()
    }
}
