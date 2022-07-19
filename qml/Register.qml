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

    id : registerComponent 

   
    ColumnLayout {
        height : parent.height 
        width : parent.width
        Layout.alignment: Qt.AlignCenter

         FileDialog {
                id: fileDialog
                title: "Choisissez un image"
                folder: shortcuts.home
                nameFilters: [ "Image files (*.jpg *.png *.jpeg *.gif)", "All files (*)" ]
                onAccepted: {
                    console.log("You chose: " + fileDialog.fileUrl)
                    var str = fileDialog.fileUrl
                    profileImage.source = str
                }
                onRejected: {
                }
            Component.onCompleted: visible = false
        }
        Component.onCompleted : {
            MainWindow.registerSignal.connect(function(user){
                if(user != "null"){
                    windows.logged = true
                    windows.user = JSON.parse(user)
                    profile_user.source = windows.user.profile
                    console.log(windows.user)
                    main_stack.replace(register,home)
                    
                }
                else{
                    popup_loader.isError = true ;
                    popup_title.text = "Register Error" ;
                    popup_content.text = "You are not yet allowed to use this soft . Please contact the owner to give you an autozization to use this prodict"
                    popup_loader.open()
                }
            })
        }

        Pane {

            Layout.alignment: Qt.AlignCenter
            Material.elevation : 6  
            height : 500
            width : 450

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
                            source : "../assets/images/profile.svg"

                        }
                        MouseArea{
                            width : parent.width
                            height : parent.height

                            onClicked : {
                                console.log("Change profile");
                                fileDialog.open()
                            }
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
                            text: MD.icons.account_circle
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                    }
                    TextField {
                        x : 20
                        id: user_text_name
                        placeholderText: "Name"
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
                            text: MD.icons.account_circle
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                    }
                    TextField {
                        x : 20
                        id: user_text_lastname
                        placeholderText: "Lastname"
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
                        id: user_text_email
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
                        id: user_text_password
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
                        id: user_text_cpassword
                        placeholderText: "Confirm Password"
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
                        text : "Register"
                        Material.foreground : "#ffffff"
                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                            color: btn_login.down ? "#90CAF9" : Material.color(Material.Blue)
                            radius : 5
                        }
                        onClicked : {
                            var n = user_text_name.text 
                            var l = user_text_lastname.text
                            var e = user_text_email.text
                            var p = user_text_password.text
                            var c = user_text_cpassword.text
                            if(windows.verifyLen(n,4) && windows.verifyLen(l,4) && windows.verifyLen(e,8) && windows.verifyLen(p,8) && windows.verifyLen(c,8)){
                                if (p == c){
                                    console.log(profileImage.source)
                                    MainWindow.addUser(JSON.stringify({
                                        profile : profileImage.source,
                                        name :n,
                                        lastname : l,
                                        email : e, 
                                        password : p
                                    }))
                                }
                                else{
                                    popup_loader.isError = true ;
                                    popup_title.text = "Password Error" ;
                                    popup_content.text = "Your password are not matched , please enter a new password and validate it."
                                    popup_loader.open()
                                }
                            }
                            else {
                                popup_loader.isError = true ;
                                popup_title.text = "Identy Error" ;
                                popup_content.text = "There are some identity not correct. Please verify it by following the identity require."
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
                            text: "Already have an account ?"
                            anchors.centerIn : parent
                        }
                    } 
                    Rectangle {
                        width: 80
                        height : 24
                        Material.background :"transparent"
                        color : "transparent"
                        Layout.alignment: Qt.AlignCenter
                        Text{
                            font.pixelSize: 12
                            font.bold : true
                            text: "Login"
                            anchors.centerIn : parent
                            color : Material.color(Material.Blue)
                        }
                        MouseArea{
                            width : parent.width
                            height : parent.height
                            onClicked : {
                                main_stack.push(login)
                            }
                        }
                    }
                    
                }
            }
        }
    }
}