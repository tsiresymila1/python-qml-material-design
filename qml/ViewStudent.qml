import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4 as STl
import QtQuick.Layouts 1.11
import QtQuick.Dialogs 1.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.4 as QtC1
import "material_design.js" as MD
import "get.js" as JS

Component{

    id : viewStudentComponent
    ColumnLayout{
        width :  menu_stack.width
        height : menu_stack.height
        Layout.alignment: Qt.AlignTop
        spacing : 0
        id : studentView
        property var identity: ""
        Component.onCompleted : {
            var modelSelected = homepage.studentModelSelected
            name_view.text = modelSelected.name
            lastname_view.text = modelSelected.lastname
            matricule_view.text = modelSelected.matricule
            grade_view.text = modelSelected.grade
            category_view.text = modelSelected.category
            facebook_view.text = modelSelected.facebook
            email_view.text = modelSelected.email
            phone_view.text = modelSelected.phone
            school_view.text = modelSelected.school
            motivation_view.text = modelSelected.motivation
            badge_name_lastname.text = modelSelected.name +' '+modelSelected.lastname
            badge_category.text = JS.getStringAt(modelSelected.category,0,2)+' MEMBER'
            badge_matricule.text = modelSelected.matricule
            badge_qrcode.source = "../assets/data/qrcode/"+modelSelected.userId+'.png'
            
            identity = (modelSelected.name+" "+modelSelected.lastname+" "+modelSelected.matricule).split(' ').join('_')

            
        }
        property var performScreenShot : function(item) {
            if(typeof(item) === "undefined") {
                console.log("undefined ");
                return;
            }
            else if(typeof(identity) !== "string") {
                identity = "screenshot"
            }
            item.grabToImage(function(result) {
                result.saveToFile('assets/data/identity/'+identity+'.png');
                console.log("Saved ",identity);
            });
        }


        Row{
            Layout.topMargin : 20
            Layout.alignment: Qt.AlignVCenter
            width : parent.width  
            height : 80
            Material.background : Material.Teal
            spacing:0
            
            Rectangle{
                width : parent.width - 160
                height : 60
                color: "transparent"
                Layout.alignment : Qt.AlignLeft
                Image{
                    width : 120
                    source :'../assets/images/studentrobot.png'
                    fillMode:Image.PreserveAspectFit
                    sourceSize.height : 60
                }
            }
            Rectangle{
                width : 70
                height : 60
                color: "transparent"
                ColumnLayout{
                    Layout.alignment : Qt.AlignCenter
                    width : parent.width 
                    height : parent.height
                    Row {
                        Layout.alignment : Qt.AlignBottom
                        width : parent.width 
                        height : 40
                        RoundButton{
                            Layout.fillWidth : true
                            font.family: iconFont.name
                            Material.background : Material.color(Material.Blue)
                            Text{
                                font.family: iconFont.name
                                font.pixelSize: 24
                                text: MD.icons.print
                                anchors.centerIn : parent
                                color : "white"
                            }
                            padding:-5
                            font.pixelSize: 40
                            Layout.alignment: Qt.AlignCenter
                            anchors.centerIn : parent
                            Material.foreground : Material.Pink

                            onClicked : {
                                studentView.performScreenShot(badge_identity)
                                popup_loader.isError = false ;
                                popup_title.text = "Print notification"
                                popup_content.text = "You badge is printed successfully and store in you stockage ! Thank you."
                                popup_loader.open()
                            }
                        }
                    }
                    Row{
                       
                        Layout.alignment : Qt.AlignCenter
                        width : parent.width 
                        height : 20
                        Text{
                            font.pixelSize: 13
                            text: "Print"
                            font.bold : true
                            anchors.centerIn : parent
                            color : "#292d33"
                        }   
                    }
                }
                   
            }
            Rectangle{
                width : 70
                height : 60
                color: "transparent"
                ColumnLayout{
                    Layout.alignment : Qt.AlignCenter
                    width : parent.width 
                    height : parent.height
                    Row {
                        Layout.alignment : Qt.AlignBottom
                        width : parent.width 
                        height : 40
                        RoundButton{
                            Layout.fillWidth : true
                            font.family: iconFont.name
                            Material.background : Material.color(Material.Red)
                            Text{
                                font.family: iconFont.name
                                font.pixelSize: 24
                                text: MD.icons.close
                                anchors.centerIn : parent
                                color : "white"
                            }
                            padding:-5
                            font.pixelSize: 40
                            Layout.alignment: Qt.AlignCenter
                            anchors.centerIn : parent
                            Material.foreground : Material.Pink

                            onClicked : {
                                menu_stack.replace(viewStudent,listStudent)
                            }
                        }
                    }
                    Row{
                        Layout.alignment : Qt.AlignCenter
                        width : parent.width 
                        height : 20
                        Text{
                            font.pixelSize: 13
                            text: "Cancel"
                            anchors.centerIn : parent
                            color : "#292d33"
                            font.bold : true
                        }   
                    }
                }
            }
            Rectangle{
                width : 20
                height : 60
                color: "transparent"
            }
        }
        Row{
            Layout.topMargin : 20
            Layout.alignment: Qt.AlignCenter
            width : parent.width
            height : 5
            Material.background : Material.Teal
            Rectangle {
                width: menu_stack.width
                height : 1
                Material.background :"transparent"
                color : Material.color(Material.Grey)
                y : 5
            }
        }
        RowLayout{
            Layout.topMargin : 20
            Layout.alignment: Qt.AlignCenter
            width : parent.width
            height : 360
            Material.background : Material.Teal
            spacing : 0
            ColumnLayout{
                width : parent.width -360
                height : parent.height
                Layout.alignment : Qt.AlignLeft

                RowLayout{
                    width : parent.width
                    height : 360
                    Layout.alignment : Qt.AlignCenter
                    Rectangle {
                        width : (menu_stack.width - 450) / 2 
                        height : 360
                        color : "transparent"
                        ColumnLayout{
                            width : parent.width
                            implicitHeight : 60*2
                            Layout.alignment : Qt.AlignTop
                            Rectangle {
                                Layout.topMargin : 30
                                Layout.leftMargin : 30
                                width : 120
                                height : 120 
                                border.width : 2
                                border.color : "grey"
                                Image{
                                    width : parent.width
                                    height : parent.height
                                    source :'../assets/images/studentrobot.png'
                                    fillMode:Image.PreserveAspectFit
                                    sourceSize.height : parent.width
                                }
                            }
                            Row {
                                width : parent.width
                                height : 60
                                Layout.topMargin : 20
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 100
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Name :"
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 136
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        id : name_view
                                        width : parent.width-10
                                        anchors.right : parent.right
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "RANDRIARIMANANA"
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
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 100
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Lastname :"
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 136
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        width : parent.width-10
                                        anchors.right : parent.right
                                        id : lastname_view
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Tsiresy Milà"
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
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 100
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Matricule :"
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 136
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        width : parent.width
                                        anchors.right : parent.right
                                        id : matricule_view
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "1253465"
                                        anchors.centerIn : parent
                                        color : "#211e33"
                                    }
                                }
                                
                            }
                            
                            
                        }
                    }
                    
                    Rectangle {
                        width : (menu_stack.width - 450) / 2 
                        height : 360
                        color : "transparent"
                        ColumnLayout{
                            width : parent.width
                            implicitHeight : parent.height - 100
                            Layout.alignment : Qt.AlignTop
                            Row {
                                width : parent.width
                                height : 60
                                Layout.topMargin : 20
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 100
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Genre :"
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 136
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        width : parent.width
                                        anchors.right : parent.right
                                        id : genre_view
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Woman"
                                        anchors.centerIn : parent
                                        color : "#211e33"
                                    }
                                }
                                
                            }
                            Row {
                                width : parent.width
                                height : 60
                                Layout.topMargin : 20
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 100
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Grade :"
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 136
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        width : parent.width-10
                                        anchors.right : parent.right
                                        id : grade_view
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Network and System Master 1"
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
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 100
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Category :"
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 136
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        width : parent.width
                                        anchors.right : parent.right
                                        id : category_view
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "C2"
                                        anchors.centerIn : parent
                                        color : "#211e33"
                                    }
                                }
                                
                            }
                            Row {
                                width : parent.width
                                height : 60
                                Layout.topMargin : 20
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 100
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Facebook :"
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 136
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        width : parent.width -10
                                        anchors.right : parent.right
                                        id : facebook_view
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Tsiresy Milà Randriarimanana"
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
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 100
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Email :"
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 136
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        width : parent.width
                                        anchors.right : parent.right
                                        id : email_view
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
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 120
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Phone number : "
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 156
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        width : parent.width
                                        anchors.right : parent.right
                                        id : phone_view
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "0342083574/0336231857"
                                        anchors.centerIn : parent
                                        color : "#211e33"
                                    }
                                }
                                
                            }
                            Row {
                                width : parent.width
                                height : 60
                                Layout.topMargin : 20
                                Layout.alignment: Qt.AlignLeft
                                spacing : 0
                                Rectangle {
                                    width : 36
                                    height : 24
                                    color : "transparent"
                                    y : 5
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.done
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Green)
                                    }
                                }
                                Rectangle {
                                    width: 120
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment: Qt.AlignLeft
                                    Text{
                                        anchors.left: parent.left
                                        width: parent.width
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "School center : "
                                        anchors.centerIn : parent
                                        color : Material.color(Material.Blue)
                                    }
                                }
                                Rectangle {
                                    width: parent.width - 156
                                    height : 24
                                    Material.background :"transparent"
                                    color : "transparent"
                                    y : 5
                                    Layout.alignment :Qt.AlignRight
                                    Text{
                                        width : parent.width
                                        anchors.right : parent.right
                                        id : school_view
                                        font.pixelSize: 14
                                        font.bold : true
                                        text: "Eufonie Ankorondrano"
                                        anchors.centerIn : parent
                                        color : "#211e33"
                                    }
                                }
                                
                            }
                        }

                    }
                }
                Rectangle{
                    width : parent.width -100
                    height : 140
                    color : "transparent"
                    Layout.alignment: Qt.AlignLeft
                    border.width : 1
                    border.color : "grey"
                    radius : 4

                    Row {
                        width : parent.width 
                        height : parent.height
                        Layout.topMargin : 20
                        Layout.alignment: Qt.AlignLeft
                        spacing : 0
                        Rectangle {
                            width : 36
                            height : 24
                            color : "transparent"
                            y : 5
                            Text{
                                font.family: iconFont.name
                                font.pixelSize: 24
                                text: MD.icons.done
                                anchors.centerIn : parent
                                color : Material.color(Material.Green)
                            }
                        }
                        Rectangle {
                            width: 100
                            height : 24
                            Material.background :"transparent"
                            color : "transparent"
                            y : 5
                            Layout.alignment: Qt.AlignLeft
                            Text{
                                anchors.left: parent.left
                                width: parent.width
                                font.pixelSize: 14
                                font.bold : true
                                text: "Motivation :"
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        Rectangle {
                            width: parent.width - 150
                            implicitHeight : 130
                            Material.background :"transparent"
                            color : "transparent"
                            y : 5
                            Layout.alignment :Qt.AlignRight
                            Text{
                                width : parent.width -20
                                height : parent.height -10
                                anchors.right : parent.right
                                id : motivation_view
                                font.pixelSize: 12
                                text: "Hello word Hello word Hello word Hello word Hello word Hello word Hello word Hello word Hello word Hello word Hello word Hello word Hello word Hello word Hello word Hello word "
                                anchors.centerIn : parent
                                color : "#211e33"
                                wrapMode: Text.WordWrap
                            }
                        }
                        Rectangle {
                            width: 20
                            height : 300
                            Material.background :"transparent"
                            color : "transparent"
                            y : 5
                            Layout.alignment :Qt.AlignRight
                            
                        }
                        
                    }
                }
            }
            Rectangle {
                width : 360
                height : 500
                color : "white"
                id : badge_identity
                ColumnLayout{
                    width : parent.width
                    implicitHeight : 200
                    Material.background : "#09061a"
                    Rectangle {
                        width : parent.width
                        height : 110
                        // color :"#09061a"
                        Material.background : "#09061a"
                        Layout.alignment : Qt.AlignCenter
                        Layout.topMargin : 0
                        Row{
                            width : parent.width 
                            height : 100
                            spacing:0
        
                            Rectangle{
                                width : 72
                                height : 100
                                color: "transparent"
                                Layout.alignment : Qt.AlignCenter
                                Image{
                                    width : parent.width
                                    height : parent.height
                                    source :'../assets/images/koonspace.jpg'
                                    fillMode:Image.PreserveAspectFit
                                    sourceSize.height : 100
                                }
                            }
                            Rectangle{
                                width : 72
                                height : 100
                                color: "transparent"
                                Layout.alignment : Qt.AlignCenter
                                Image{
                                    width : parent.width
                                    height : parent.height
                                    source :'../assets/images/ivotech.jpg'
                                    fillMode:Image.PreserveAspectFit
                                    sourceSize.height : 100
                                }
                            }
                            Rectangle{
                                width : 72
                                height : 100
                                color: "transparent"
                                Layout.alignment : Qt.AlignCenter
                                Image{
                                    width : parent.width
                                    height : parent.height
                                    source :'../assets/images/mwp.jpg'
                                    fillMode:Image.PreserveAspectFit
                                    sourceSize.height : 100
                                }
                            }
                            Rectangle{
                                width : 72
                                height : 100
                                color: "transparent"
                                Layout.alignment : Qt.AlignCenter
                                Image{
                                    width : parent.width
                                    height : parent.height
                                    source :'../assets/images/skillz.png'
                                    fillMode: Image.PreserveAspectFit
                                    sourceSize.height : 100
                                }
                            }
                            Rectangle{
                                width : 72
                                height : 100
                                color: "transparent"
                                Layout.alignment : Qt.AlignCenter
                                Image{
                                    width : parent.width
                                    height : parent.height
                                    source :'../assets/images/p4h.jpg'
                                    fillMode:Image.PreserveAspectFit
                                    sourceSize.height : 60
                                }
                            }
                        }
                        
                    }
                    Row{
                        width : parent.width
                        height : 30
                        Layout.alignment : Qt.AlignCenter
                        Layout.topMargin : 8
                        Rectangle {
                            width : parent.width 
                            height : 30
                            color : "transparent"
                            Layout.alignment : Qt.AlignCenter
                            Text{
                                font.pixelSize: 20
                                font.pointSize: 20
                                font.bold : true
                                text : "Club Robotika Madagascar"
                                color : Material.color(Material.Blue)
                                anchors.centerIn: parent
                            }
                        }
                    }
                    Row{
                        width : parent.width
                        height : 60
                        Layout.alignment : Qt.AlignCenter
                        Layout.topMargin : 10
                        Rectangle {
                            width : 120 
                            height : 120
                            color : "transparent"
                            Layout.alignment : Qt.AlignCenter
                            border.width : 2
                            border.color : "grey"
                        }
                    }

                    Row{
                        width : parent.width
                        height : 30
                        Layout.alignment : Qt.AlignCenter
                        Layout.topMargin : 10
                        Rectangle {
                            width : parent.width 
                            height : 30
                            color : "transparent"
                            Layout.alignment : Qt.AlignCenter
                            Text{
                                id : badge_name_lastname
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.pixelSize: 16
                                font.pointSize: 16
                                width : parent.width - 30
                                font.bold : true
                                text : "RANDRIARIMANANA Tsiresy Milà"
                                color : "#292d33"
                                anchors.centerIn: parent
                                wrapMode:Text.WordWrap
                                clip: true
                                elide: Text.ElideRight
                                maximumLineCount : 2
                            }
                            
                        }
                    }
                    Row{
                        width : parent.width
                        height : 30
                        Layout.alignment : Qt.AlignCenter
                        Layout.topMargin : 2
                        Layout.bottomMargin : 10
                        Rectangle {
                            width : parent.width 
                            height : 30
                            color : "transparent"
                            Layout.alignment : Qt.AlignCenter
                            Text{
                                id : badge_category
                                font.pixelSize: 30
                                font.pointSize: 30
                                font.bold : true
                                text : "C2 MEMBER"
                                color : Material.color(Material.Blue)
                                anchors.centerIn: parent
                            }
                        }
                    }
                    Row{
                        width : parent.width
                        height : 30
                        Layout.alignment : Qt.AlignCenter
                        Layout.topMargin : 2
                        Rectangle{
                            width : 180
                            height : 100
                            color: "transparent"
                            Layout.alignment : Qt.AlignLeft
                            ColumnLayout {
                                width : parent.width
                                height : parent.height
                                Layout.alignment : Qt.AlignCenter
                                Row{
                                    height : 20
                                    width : parent.width
                                    Layout.alignment :Qt.AlignCenter
                                    Rectangle{
                                        width : parent.width
                                        height : 15
                                        color : "transparent"
                                        Layout.alignment :Qt.AlignCenter
                                        Text{
                                            id : badge_matricule
                                            font.pixelSize: 12
                                            font.pointSize: 12
                                            font.bold : true
                                            text : "23561"
                                            color : Material.color(Material.Blue)
                                            anchors.centerIn: parent
                                        }
                                    }
                                }
                                Row{
                                    height : 80
                                    width : parent.width
                                    Layout.alignment :Qt.AlignCenter
                                    Rectangle{
                                        width : parent.width
                                        height : 80
                                        color : "transparent"
                                        Layout.alignment :Qt.AlignCenter
                                        Image{
                                            id : badge_qrcode
                                            width : parent.width
                                            height : parent.height
                                            fillMode:Image.PreserveAspectFit
                                            sourceSize.height : 80
                                        }
                                    }
                                }
                                
                                
                            }
                        }
                        Rectangle{
                            width : 180
                            height : 100
                            color: "transparent"
                            Layout.alignment : Qt.AlignRight    
                            Image{
                                width : parent.width
                                height : parent.height
                                source :'../assets/images/studentrobot.png'
                                fillMode:Image.PreserveAspectFit
                                sourceSize.width : 60
                                sourceSize.height : 60
                            }
                        }
                    }
                }
                Row{
                    width : parent.width
                    height : parent.height
                    Layout.alignment : Qt.AlignCent
                    Rectangle{
                        width : parent.width
                        height : parent.height +100
                        color: "transparent"
                        Layout.alignment : Qt.AlignCenter
                        Layout.topMargin : 100
                        Image{
                            width : parent.width
                            height : parent.height
                            source :'../assets/images/girlsrobotika.png'
                            fillMode:Image.PreserveAspectFit
                            sourceSize.height : 100
                            opacity : 0.1
                        }
                    }
                }
            }
        }
    }

}