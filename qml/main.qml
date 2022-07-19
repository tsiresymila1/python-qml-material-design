
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.11
import QtQuick.Dialogs 1.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.4 as QtC1
import "material_design.js" as MD


ApplicationWindow {

    id : windows
    visible: true
    title: "Soft Manager"
    width: Screen.width 
    height: Screen.height -20
    // visibility:Window.FullScreen
    minimumHeight: height
    minimumWidth: width
    Material.theme: Material.System
    Material.accent: Material.Blue
    Material.primary : Material.Blue
    Material.background : Material.White
    Material.foreground : Material.White
    // Material.variant : Material.ense

    property var logged : false ;
    property var genres : ['Man','Woman'];
    property var categories : ['A1','A2','A3','A4 10h','A4 13h','B1','B2','C1','Coach']
    property var centers : ['Eufonie Ankorondrano','Ivotech Ankatso']
    property var user : null

    function validateData(name,lastname,matricule,grade,school,facebook,email,phone,motivation){
        if(verifyLen(name,4) && verifyLen(lastname,4) && verifyLen(matricule,4)  && verifyLen(grade,4) && verifyLen(school,4) && verifyLen(facebook,0) && verifyLen(email,0) && verifyLen(phone,0) && verifyLen(motivation,0) ){
            return true ;
        }
        else return false ;
    }
    function verifyLen(texte,len) {
        return texte.length >= len ;
    }

    Component.onCompleted: {
        setX((Screen.width / 2) - (width / 2));
        setY((Screen.height / 2 )- (height / 2));
    }
    onWidthChanged: {
        student.width = width
        console.log(width)
    }

    onHeightChanged: {
        student.height = height
        console.log(height)
    }

    FontLoader {
        id: iconFont
        source: "../assets/fonts/MaterialIcons-Regular.ttf"
    }

    header: ToolBar {
        height : 60
        Material.elevation : 2
        RowLayout {
            anchors.fill: parent
            Rectangle {
                width: 48
                height : 48
                Material.background :"transparent"
                color : "transparent"
                Image{
                    width : parent.width
                    source :'../assets/images/robot.png'
                    fillMode:Image.PreserveAspectFit
                    sourceSize.width : 48
                }
            }
            Label {
                text: 'Soft Manager'
                font.bold : true
                font.pixelSize: 16
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignLeft
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                font.family: iconFont.name
                font.pixelSize: 24
                text: MD.icons.notifications
                visible : windows.logged 
            }
            ToolButton {
                font.family: iconFont.name
                font.pixelSize: 24
                text: MD.icons.email
                id: mail_button
                Material.foreground : Material.Red
                visible : windows.logged
            }
            Rectangle {
                width : 40
                height : 40
                radius : 20
                color : Material.color(Material.Blue)
                Layout.rightMargin : 20
                visible : windows.logged
                Image{
                    id : profile_user
                    width : 28
                    anchors.centerIn: parent
                    fillMode:Image.PreserveAspectFit
                    sourceSize.height : 28
                }
                Rectangle { 
                    width : 40
                    height : 40
                    color: "transparent"
                    border.color: Material.color(Material.Blue)
                    border.width: 8
                    radius : 20
                }

                MouseArea{
                    width : parent.width
                    height : parent.height

                    onClicked : {
                        menu_profile.open()
                    }
                }
                Menu {
                    id: menu_profile
                    y: parent.height
                    MenuItem { 
                        text: 'Logout' 
                        icon.name: "logout"
                        icon.source: "../assets/images/logout.png"
                        onTriggered: {
                            console.log("Open action triggered");
                            windows.logged = false ;
                            main_stack.push(login);
                        }
                    }
                }
            }
        }
    }

    Pane {
        width: parent.width
        height: parent.height
        Layout.margins : 0
        padding : 0
        
        StackView {
            id : main_stack
            width: parent.width
            height: parent.height
            padding:0
            Layout.margins : 0
            initialItem : Login{}
            Layout.alignment: Qt.AlignCenter
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
            Login {
                id : login
            }
            Register {
                id : register
            }
            Home {
                id : home
            }
        }
    }
    Popup {
        id: popup_loader
        x : (Screen.width / 2) - (width / 2)
        y : (Screen.height / 2 )- (height / 2) - 50
        width: 400
        height: 280
        modal: true
        focus: true
        padding : 0
        // Material.background : "transparent"
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        property var isError : false ;
        property var validateBtn : function(){
            popup_loader.close()
        }

        ColumnLayout {
            width : parent.width 
            Layout.fillHeight: true
            Layout.alignment : Qt.AlignHCenter
            Material.background :Material.Blue
            spacing : 0
            Row{
                width : parent.width
                Layout.alignment: Qt.AlignHCenter
                Rectangle {
                    width : parent.width
                    height : 50
                    Material.background :Material.Blue
                    color : popup_loader.isError ? Material.color(Material.Red) : Material.color(Material.Blue)
                    Layout.alignment: Qt.AlignCenter
                    Text{
                        id : popup_title
                        font.pixelSize: 15
                        font.bold : true
                        text: "Exemple Dialog"
                        anchors.centerIn : parent
                        color : "#ffffff"
                    }
                }  
            }
            Row{
                width : parent.width
                Layout.alignment: Qt.AlignCenter
                Rectangle {
                    width : parent.width
                    height : 150
                    Material.background :Material.Blue
                    color : "transparent"
                    Layout.alignment: Qt.AlignCenter
                    Text{
                        width : parent.width - 20
                        id : popup_content
                        font.pixelSize: 13
                        lineHeight: 1.5
                        font.bold : true
                        text: "Do you relly want to Delete Tsiresy Milà RAndriarimanana ?? "
                        anchors.centerIn : parent
                        color : "#211e33"
                        wrapMode : Text.WordWrap
                    }
                }  
            }
            Row{
                width : parent.width
                Layout.alignment: Qt.AlignCenter
                Rectangle {
                    width : parent.width / 2
                    height : 60
                    Material.background :Material.Blue
                    color : "transparent"
                    Layout.alignment: Qt.AlignCenter
                    Button{
                        id : popup_cancel_btn
                        width : parent.width -20 
                        text : "Cancel"
                        Material.foreground : "#ffffff"
                        anchors.centerIn: parent
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: popup_cancel_btn.down ? 0.6 : 1
                            color: Material.color(Material.Red)
                            radius : 5
                        }
                        onClicked : {
                            popup_loader.close()
                        }
                    }
                    
                } 
                Rectangle {
                    width : parent.width / 2
                    height : 60
                    Material.background :Material.Blue
                    color : "transparent"
                    Layout.alignment: Qt.AlignCenter
                    Button{
                        id : popup_ok_btn
                        width : parent.width -20 
                        anchors.centerIn: parent
                        text : "Ok"
                        Material.foreground : "#ffffff"
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: popup_ok_btn.down ? 0.6 : 1
                            color: Material.color(Material.Blue)
                            radius : 5
                        }
                        onClicked : popup_loader.validateBtn()
                    }
                } 
            }
            
        }

    }
    
    footer: Pane {
        height:20
        Material.elevation : 2
        Layout.alignment : Qt.AlignRight
        padding : 0
        
        RowLayout{
            Layout.alignment: Qt.AlignRight
            width : parent.width
            Layout.rightMargin : 10
            Item{
                Layout.fillWidth: true
                // implicitWidth : parent.width
                Button{
                    id:buttonAbout
                    background:Rectangle{
                        color:"transparent"
                    }
                }
            }
            Rectangle {
                width: 20
                height : 20
                Material.background :"transparent"
                color : "transparent"
                Text{
                    font.family: iconFont.name
                    font.pixelSize: 12
                    text: MD.icons.copyright
                    anchors.centerIn : parent
                    color : Material.accent
                }
            }
            Text {
                Layout.rightMargin : 10
                // font.bold: true
                font.pixelSize: 8
                minimumPixelSize: 6
                fontSizeMode: Label.Fit
                horizontalAlignment: Qt.AlignLeft
                verticalAlignment: Qt.AlignVCenter
                visible : true
                text: "Copyright reserved Tsiresy Milà"
            }
        }
    }
    
}