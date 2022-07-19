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

    id : loginComponent 
    ColumnLayout {
        height : parent.height 
        width : parent.width
        Layout.alignment: Qt.AlignCenter

        Component.onCompleted : {
            MainWindow.loginSignal.connect(function(user){
                if(user != 'null'){
                    windows.logged = true ;
                    windows.user = JSON.parse(user)
                    profile_user.source = '../assets/data/profiles/'+windows.user.profile
                    console.log('../assets/data/profiles/'+windows.user.profile)
                    main_stack.replace(login,home);
                }
                else{
                    popup_loader.isError = true ;
                    popup_title.text = "Login Error"
                    popup_content.text = "Please verify you email and your password, or probaly , you are not allowed to use this product"
                    popup_loader.open()
                }
            })
        }
        Pane {

            Layout.alignment: Qt.AlignCenter
            Material.elevation : 6  
            height : 500
            width : 400

            ColumnLayout {
                height : parent.height 
                width : parent.width    
                spacing: 0
                id : login_layout

                Row{
                    width : parent.width
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin : 20
                    // Layout.rightMargin : 30

                    Rectangle {
                        width: 120
                        height : 120
                        Material.background :"transparent"
                        color : "transparent"
                        Layout.alignment: Qt.AlignCenter
                        y : 5

                        Image{
                            Layout.alignment: Qt.AlignCenter
                            id : profileImage
                            width : 120
                            height : 120
                            sourceSize.width : 120
                            sourceSize.height : 120
                            fillMode : Image.PreserveAspectCrop
                            source : "../assets/images/robot.png"

                        }
                    }
                }
                
                Row{
                    width : parent.width
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin : 20

                    Rectangle {
                        width: 48
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.email
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                    }
                    TextField {
                        x : 20
                        id: text_user_email
                        placeholderText: "Email"
                        Layout.margins: 10
                        implicitWidth : 280
                        font.pixelSize: 12
                        // enabled : false
                    }
                    Rectangle {
                        width: 20
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                    }
                }
                Row{
                    Layout.alignment: Qt.AlignHCenter
                    width : parent.width
                    Layout.topMargin : 20

                    Rectangle {
                        width: 48
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                        Text{
                            font.family: iconFont.name
                            font.pixelSize: 24
                            text: MD.icons.lock
                            anchors.centerIn : parent
                            color :  Material.color(Material.Blue)
                        }
                    }
                    TextField {
                        x : 20
                        id: text_user_password
                        placeholderText: "Password"
                        Layout.margins: 10
                        implicitWidth : 280
                        font.pixelSize: 12
                        echoMode: TextInput.Password
                    }
                    Rectangle {
                        width: 20
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                    }
                }
                Row{
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignRight
                    width : parent.width 

                    Button{
                        id : btn_login
                        width : 300
                        text : "Login"
                        Material.foreground : "#ffffff"
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                            color: btn_login.down ? "#90CAF9" : Material.color(Material.Blue)
                            radius : 5
                        }
                        onClicked : {
                            // main_stack.push(home);
                            // windows.logged = true ;
                            // loader.open()
                            var user_email = text_user_email.text 
                            var user_password = text_user_password.text 
                            if(windows.verifyLen(user_email,8) && windows.verifyLen(user_password,8)){
                                MainWindow.login(JSON.stringify({
                                    user_email : user_email,
                                    user_password : user_password
                                }))
                            }
                            else {
                                popup_loader.isError = true ;
                                popup_title.text = "Login Error"
                                popup_content.text = "Please verify you email and your password ."
                                popup_loader.open()
                            }
                        }
                    }
                    Rectangle {
                        width: 20
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                    }
                }
                Row{
                    Layout.topMargin : 20
                    Layout.alignment: Qt.AlignHCenter
                    width : parent.width
                    Layout.bottomMargin : 20
                    Rectangle {
                        width: 20
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        y : 5
                    }
                    Rectangle {
                        width: 100
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        Text{
                            font.pixelSize: 12
                            text: "Create a new account ."
                            anchors.centerIn : parent
                        }
                    } 
                    Rectangle {
                        width: 70
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        Layout.alignment: Qt.AlignCenter
                        Text{
                            font.pixelSize: 12
                            font.bold : true
                            text: "Register"
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                        MouseArea{
                            width : parent.width
                            height : parent.height
                            onClicked : {
                                main_stack.push(register)
                            }
                        }
                    }
                    
                }
            }
        }
    }
}