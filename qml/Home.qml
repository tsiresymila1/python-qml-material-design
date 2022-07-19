import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.11
import QtQuick.Dialogs 1.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.4 as QtC1
import "material_design.js" as MD

Component {

    id : homeComponent
    RowLayout {
        height : main_stack.height 
        width : main_stack.width
        Layout.alignment: Qt.AlignCenter
        id : homepage

        property var studentModelSelected : {} 

        Column {
            width:200
            height : main_stack.height
            Pane {
                id : pane_menu
                width:200
                height: parent.height
                Material.elevation:2
                Layout.fillWidth: true
                Layout.margins : 0
                padding : 0
                Material.background : "#292d33"

                ColumnLayout{
                    Layout.margins:0
                    Layout.alignment: Qt.AlignHCenter
                    width : parent.width
                    spacing : 5
                    y : 5
                    Material.background : Material.Blue

                    Row{
                        width : parent.width
                        Layout.topMargin : 20
                        Rectangle{
                            width : 200
                            height : 180
                            Material.background :"transparent"
                            color : "transparent"
                            Image{
                                y : 30
                                width : parent.width
                                source :'../assets/images/builder.png'
                                fillMode:Image.PreserveAspectCrop
                                sourceSize.width : 200
                            }
                        }
                    }

                    Row{
                        width : parent.width
                        // Layout.topMargin : 10
                        Rectangle{
                            property bool alredyClicked : true
                            id : btn1
                            width : 200
                            height : 36
                            color : mouseLoad1.containsMouse || alredyClicked ? Material.color(Material.Blue) : "transparent"
                            Row{
                                Rectangle {
                                    width: 48
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Image{
                                        // y : 10
                                        width : parent.width
                                        source :'../assets/images/robot.png'
                                        fillMode:Image.PreserveAspectFit
                                        sourceSize.width : 22
                                    }
                                }
                                Text{
                                    y : 8
                                    font.bold : true
                                    font.pixelSize: 14
                                    text: "Students"
                                    color: "#ffffff"
                                    
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                id : mouseLoad1
                                hoverEnabled : true
                                onClicked: {
                                    console.log("Loader source change ");
                                    btn5.color = "transparent"
                                    btn4.color = "transparent"
                                    btn3.color = "transparent"
                                    btn2.color = "transparent"
                                    btn1.color  =  Material.color(Material.Blue)
                                    btn1.alredyClicked = true
                                    btn2.alredyClicked = false
                                    btn3.alredyClicked = false
                                    btn4.alredyClicked = false
                                    btn5.alredyClicked = false
                                    menu_stack.push(listStudent)

                                }
                                onEntered : {
                                    btn1.color  =  Material.color(Material.Blue)
                                }
                                onExited :{
                                    if (!btn1.alredyClicked) btn1.color  =  "transparent"
                                }
                            }
                        }
                    }
                    Row{
                        width : parent.width
                        Layout.topMargin : 4
                        Rectangle{
                            id : btn2
                            property bool alredyClicked : false
                            width : 200
                            height : 36
                            Material.background : Material.Blue
                            color : mouseLoad2.containsMouse ? Material.color(Material.Blue) : "transparent"
                            Row{
                                Rectangle {
                                    width: 48
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Image{
                                        // y : 10
                                        width : parent.width
                                        source :'../assets/images/rendez-vous.png'
                                        fillMode:Image.PreserveAspectFit
                                        sourceSize.width : 22
                                    }
                                }
                                Text{
                                    y : 8
                                    font.bold : true
                                    font.pixelSize: 14
                                    text: "Time schedule"
                                    color : "#ffffff"
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                id : mouseLoad2
                                hoverEnabled : true
                                onClicked: {
                                    btn5.color = "transparent"
                                    btn4.color = "transparent"
                                    btn3.color = "transparent"
                                    btn2.color  =  Material.color(Material.Blue)
                                    btn1.color = "transparent"
                                    btn1.alredyClicked = false
                                    btn2.alredyClicked = true
                                    btn3.alredyClicked = false
                                    btn4.alredyClicked = false
                                    btn5.alredyClicked = false
                                    
                                }
                                onEntered : {
                                    btn2.color  =  Material.color(Material.Blue)
                                }
                                onExited :{
                                    if (!btn2.alredyClicked) btn2.color  =  "transparent"
                                }
                            }
                        }
                    }
                    Row{
                        width : parent.width
                        Layout.topMargin : 4
                        Rectangle{
                            id : btn3
                            property bool alredyClicked : false
                            width : 200
                            height : 36
                            Material.background : Material.Blue
                            color : mouseLoad3.containsMouse ? Material.color(Material.Blue) : "transparent"
                            Row{
                                Rectangle {
                                    width: 48
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Image{
                                        // y : 10
                                        width : parent.width
                                        source :'../assets/images/folder.png'
                                        fillMode:Image.PreserveAspectFit
                                        sourceSize.width : 22
                                    }
                                }
                                Text{
                                    y : 8
                                    font.bold : true
                                    font.pixelSize: 14
                                    text: "Documents"
                                    color : "#ffffff"
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                id : mouseLoad3
                                hoverEnabled : true
                                onClicked: {
                                    btn5.color = "transparent"
                                    btn4.color = "transparent"
                                    btn3.color  =  Material.color(Material.Blue)
                                    btn2.color = "transparent"
                                    btn1.color = "transparent"
                                    btn1.alredyClicked = false
                                    btn2.alredyClicked = false
                                    btn3.alredyClicked = true
                                    btn4.alredyClicked = false
                                    btn5.alredyClicked = false
                                }
                                onEntered : {
                                    btn3.color  =  Material.color(Material.Blue)
                                }
                                onExited :{
                                    if (!btn3.alredyClicked) btn3.color  =  "transparent"
                                }
                            }
                        }
                    }
                    Row{
                        width : parent.width
                        Layout.topMargin : 4
                        Rectangle{
                            id : btn4
                            property bool alredyClicked : false
                            width : 200
                            height : 36
                            Material.background : Material.Blue
                            color : mouseLoad4.containsMouse ? Material.color(Material.Blue) : "transparent"
                            Row{
                                Rectangle {
                                    width: 48
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5

                                    Image{
                                        // y : 10
                                        width : parent.width
                                        source :'../assets/images/coach.png'
                                        fillMode:Image.PreserveAspectFit
                                        sourceSize.width : 22
                                    }
                                }
                                Text{
                                    y : 8
                                    font.bold : true
                                    font.pixelSize: 14
                                    text: "Coachs"
                                    color : "#ffffff"
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                id : mouseLoad4
                                hoverEnabled : true
                                onClicked: {
                                    btn5.color = "transparent"
                                    btn4.color  =  Material.color(Material.Blue)
                                    btn3.color = "transparent"
                                    btn2.color = "transparent"
                                    btn1.color = "transparent"
                                    btn1.alredyClicked = false
                                    btn2.alredyClicked = false
                                    btn3.alredyClicked = false
                                    btn4.alredyClicked = true
                                    btn5.alredyClicked = false
                                }
                                onEntered : {
                                    btn4.color  =  Material.color(Material.Blue)
                                }
                                onExited :{
                                    if (!btn4.alredyClicked) btn4.color  =  "transparent"
                                }
                            }
                        }
                    }
                    Row{
                        width : parent.width
                        Layout.topMargin : 4
                        Rectangle{
                            id : btn5
                            property bool alredyClicked : false
                            width : 200
                            height : 36
                            Material.background : Material.Blue
                            color : mouseLoad4.containsMouse ? Material.color(Material.Blue) : "transparent"
                            Row{
                                Rectangle {
                                    width: 48
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5

                                    Image{
                                        // y : 10
                                        width : parent.width
                                        source :'../assets/images/coach.png'
                                        fillMode:Image.PreserveAspectFit
                                        sourceSize.width : 22
                                    }
                                }
                                Text{
                                    y : 8
                                    font.bold : true
                                    font.pixelSize: 14
                                    text: "About"
                                    color : "#ffffff"
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                id : mouseLoad5
                                hoverEnabled : true
                                onClicked: {
                                    btn5.color  =  Material.color(Material.Blue)
                                    btn4.color = "transparent"
                                    btn3.color = "transparent"
                                    btn3.color = "transparent"
                                    btn2.color = "transparent"
                                    btn1.color = "transparent"
                                    btn1.alredyClicked = false
                                    btn2.alredyClicked = false
                                    btn3.alredyClicked = false
                                    btn4.alredyClicked = false
                                    btn5.alredyClicked = true
                                    menu_stack.push(about)
                                }
                                onEntered : {
                                    btn5.color  =  Material.color(Material.Blue)
                                }
                                onExited :{
                                    if (!btn5.alredyClicked) btn5.color  =  "transparent"
                                }
                            }
                        }
                    }
                }
            }
        }
        Column {
            width:main_stack.width - 200
            height : main_stack.height
            x: 200
            Layout.alignment : Qt.AlignTop
            Pane{
                id : pane_content
                height: parent.height
                Material.elevation:6
                Layout.fillWidth: true
                Layout.margins : 0
                width: parent.width
                padding : 0
                Layout.alignment : Qt.AlignHCenter
                StackView{
                    id:menu_stack
                    initialItem : ListStudent{}
                    width: parent.width
                    height: parent.height
                    padding:2
                    Layout.margins : 0
                    Layout.alignment : Qt.AlignTop
                    pushEnter: Transition {
                        PropertyAnimation {
                            property: "opacity"
                            from: 0
                            to:1
                            duration: 200
                        }
                    }
                    pushExit: Transition {
                        PropertyAnimation {
                            property: "opacity"
                            from: 1
                            to:0
                            duration: 200
                        }
                    }
                    popEnter: Transition {
                        PropertyAnimation {
                            property: "opacity"
                            from: 0
                            to:1
                            duration: 200
                        }
                    }
                    popExit: Transition {
                        PropertyAnimation {
                            property: "opacity"
                            from: 1
                            to:0
                            duration: 200
                        }
                    }
                    replaceEnter: Transition {
                        PropertyAnimation {
                            property: "opacity"
                            from: 0
                            to:1
                            duration: 200
                        }
                    }
                    replaceExit: Transition {
                        PropertyAnimation {
                            property: "opacity"
                            from: 1
                            to:0
                            duration: 200
                        }
                    }
                    ListStudent{
                        id : listStudent
                    }
                    AddStudent{
                        id : addStudent
                    }
                    ViewStudent{
                        id : viewStudent
                    }
                    ModifyStudent{
                        id : modifyStudent
                    }
                    About{
                        id : about
                    }
                }
            }
        }
    } 
    
}