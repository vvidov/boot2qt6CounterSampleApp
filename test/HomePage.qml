import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Page {
    property int counter: 0

    title: "Home"
    font.pixelSize: 150

    function isCounter()
    {
        return counter !== 0
    }

    Column{
        anchors.centerIn: parent
        spacing: 100

        Text {
            text: qsTr("Counter: %1").arg(counter)
            font.pointSize:  150
            horizontalAlignment: Text.AlignHCenter
            width:  parent.width
        }

        Row {
            spacing: 100

            Button{
                padding: 20
                text: "+1"
                background: Rectangle
                {
                    color: "green"
                }

                onClicked:
                {
                    counter +=1
                    main.logModel.insert(0, {"action": "+1", "datetime": new Date().toISOString(), "counter": counter})
                }
            }

            Button{
                padding: 20
                text: "Reset"
                enabled: isCounter() //counter !== 0
                background: Rectangle
                {
                    color: isCounter() ? "blue" : "lightgray"
                }
                onClicked: {
                    counter =0
                    main.logModel.insert(0, {"action": "Reset", "datetime": new Date().toISOString(), "counter": counter})
                }
            }

            Button{
                padding: 20
                text: "-1"
                background: Rectangle
                {
                    color: "red"
                }
                onClicked: {
                    counter -=1
                    main.logModel.insert(0, {"action": "-1", "datetime": new Date().toISOString(), "counter": counter})
                }
            }

        }

    }
    footer:
        Button
        {
            enabled: main.logModel.count > 0
            text: "Go To Log"
            onClicked: stackView.push(logPageComponent)
        }

}
