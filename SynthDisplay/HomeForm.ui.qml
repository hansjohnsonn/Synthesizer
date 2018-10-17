import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 320
    height: 240
    contentWidth: 108
    spacing: -4

    title: qsTr("Home")

    Label {
        color: "#ffffff"
        text: qsTr("You are on the home page.")
        z: 1
        anchors.centerIn: parent
    }

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 320
        height: 240
        color: "#000000"
    }
}
