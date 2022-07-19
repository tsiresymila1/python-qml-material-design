import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.11
import QtQuick.Dialogs 1.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.4 as QtC1
import "material_design.js" as MD

Component{

    id : aboutComponent

    RowLayout{
        width : menu_stack.width
        height : menu_stack.height
        Layout.alignment : Qt.AlignCenter

        Rectangle {
            width : (parent.width / 2) -100 
            implicitHeight : 200
            color : "transparent"
            ColumnLayout{
                width : parent.width
                implicitHeight : 100
                Layout.alignment : Qt.AlignCenter
                Row{
                    width : parent.width
                    height : 200
                    Layout.alignment : Qt.AlignCenter
                    Rectangle{
                        width : 120
                        height : 120
                        color : "transparent"
                        Image{
                            Layout.alignment: Qt.AlignCenter
                            width : 120
                            height : parent.height
                            sourceSize.width : parent.width
                            sourceSize.height : parent.height
                            fillMode : Image.PreserveAspectCrop
                            source : "../assets/images/robot.png"

                        }
                    }
                }
                Row {
                    width : parent.width
                    height : 60
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignCenter
                    spacing : 0
                    Rectangle {
                        width : 60
                        height : 24
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.laptop_mac
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                    }
                    Rectangle {
                        width : 300
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Layout.alignment :Qt.AlignRight
                        Text{
                            width : parent.width-10
                            anchors.right : parent.right
                            font.pixelSize: 14
                            font.bold : true
                            text: "Here is the produit name"
                            anchors.centerIn : parent
                            color : "#211e33"
                            clip: true
                            elide: Text.ElideRight
                        }
                    }
                    
                }
                Row {
                    width : parent.width
                    height : 60
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignCenter
                    spacing : 0
                    Rectangle {
                        width : 60
                        height : 24
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.info
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                    }
                    Rectangle {
                        width : 300
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Layout.alignment :Qt.AlignRight
                        Text{
                            width : parent.width-10
                            anchors.right : parent.right
                            font.pixelSize: 14
                            font.bold : true
                            text: "Version 1.0"
                            anchors.centerIn : parent
                            color : "#211e33"
                        }
                    }
                    
                }
                Row {
                    width : parent.width
                    height : 60
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignCenter
                    spacing : 0
                    Rectangle {
                        width : 60
                        height : 24
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.fingerprint
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                    }
                    Rectangle {
                        width : 300
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Layout.alignment :Qt.AlignRight
                        Text{
                            width : parent.width-10
                            anchors.right : parent.right
                            font.pixelSize: 14
                            font.bold : true
                            text: "3feerdfshsinfo1yuzdffeiokY0"
                            anchors.centerIn : parent
                            color : "#211e33"
                        }
                    }
                    
                }
                Row {
                    width : parent.width
                    height : 60
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignCenter
                    spacing : 0
                    Rectangle {
                        width : 60
                        height : 24
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.developer_mode
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                    }
                    Rectangle {
                        width : 300
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Layout.alignment :Qt.AlignRight
                        Text{
                            width : parent.width-10
                            anchors.right : parent.right
                            font.pixelSize: 14
                            font.bold : true
                            text: "Still in development mode"
                            anchors.centerIn : parent
                            color : "#211e33"
                        }
                    }
                    
                }
              }
        }
        Rectangle {
            width : (parent.width / 2 ) - 100
            implicitHeight : 200
            color : "transparent"
            ColumnLayout{
                width : parent.width
                implicitHeight : 100
                Layout.alignment : Qt.AlignCenter
                Row{
                    width : parent.width
                    height : 200
                    Layout.alignment : Qt.AlignCenter
                    Rectangle{
                        width : 120
                        height : 120
                        color : "transparent"
                        Image{
                            Layout.alignment: Qt.AlignCenter
                            width : parent.width
                            height : parent.height
                            sourceSize.width : parent.width
                            sourceSize.height : parent.height
                            fillMode : Image.PreserveAspectCrop
                            source : "../assets/images/developer.jpg"

                        }
                    }
                }
                Row {
                    width : parent.width
                    height : 60
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignCenter
                    spacing : 0
                    Rectangle {
                        width : 60
                        height : 24
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.person
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                    }
                    Rectangle {
                        width : 300
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Layout.alignment :Qt.AlignRight
                        Text{
                            width : parent.width-10
                            anchors.right : parent.right
                            font.pixelSize: 14
                            font.bold : true
                            text: "Tsiresy Milà RANDRIARIMANANA"
                            anchors.centerIn : parent
                            color : "#211e33"
                            clip: true
                            elide: Text.ElideRight
                        }
                    }
                    
                }
                Row {
                    width : parent.width
                    height : 60
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignCenter
                    spacing : 0
                    Rectangle {
                        width : 60
                        height : 24
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.work
                            anchors.centerIn : parent
                            color : Material.color(Material.Grey)
                        }
                    }
                    Rectangle {
                        width : 300
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Layout.alignment :Qt.AlignRight
                        Text{
                            width : parent.width-10
                            anchors.right : parent.right
                            font.pixelSize: 14
                            font.bold : true
                            text: "System and Network administrator , Developer"
                            anchors.centerIn : parent
                            color : "#211e33"
                        }
                    }
                    
                }
                Row {
                    width : parent.width
                    height : 60
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignCenter
                    spacing : 0
                    Rectangle {
                        width : 60
                        height : 24
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.email
                            anchors.centerIn : parent
                            color : Material.color(Material.Red)
                        }
                    }
                    Rectangle {
                        width : 300
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Layout.alignment :Qt.AlignRight
                        Text{
                            width : parent.width-10
                            anchors.right : parent.right
                            font.pixelSize: 14
                            font.bold : true
                            text: "tsiresymila@gmail.com"
                            anchors.centerIn : parent
                            color : "#211e33"
                        }
                    }
                    
                }
                Row {
                    width : parent.width
                    height : 60
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignCenter
                    spacing : 0
                    Rectangle {
                        width : 60
                        height : 24
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.call
                            anchors.centerIn : parent
                            color : Material.color(Material.Green)
                        }
                    }
                    Rectangle {
                        width : 300
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Layout.alignment :Qt.AlignRight
                        Text{
                            width : parent.width-10
                            anchors.right : parent.right
                            font.pixelSize: 14
                            font.bold : true
                            text: "+26134 20 835 74 / +261 33 62 318 57"
                            anchors.centerIn : parent
                            color : "#211e33"
                        }
                    }
                    
                }
            }
        }
    }
}