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

Component{

    id : addStudentComponent

    ColumnLayout{

        id : assStudentPrpery

        width :  menu_stack.width
        height : menu_stack.height
        Layout.alignment: Qt.AlignTop
        spacing : 0
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
                                text: MD.icons.save
                                anchors.centerIn : parent
                                color : "white"
                            }
                            padding:-5
                            font.pixelSize: 40
                            Layout.alignment: Qt.AlignCenter
                            anchors.centerIn : parent
                            Material.foreground : Material.Pink

                            onClicked : {
                                var name = text_name.text
                                var lastname = text_lastname.text
                                var matricule = text_matricule.text
                                var genre = windows.genres[student_genre.currentIndex]
                                var grade = text_grade.text 
                                var category = windows.categories[student_category.currentIndex]
                                var motivation = textAreaMotivation.text 
                                var facebook = text_facebook.text 
                                var email = text_email.text 
                                var phone = text_phone.text
                                var school = windows.centers[school_category.currentIndex]

                                if(windows.validateData(name,lastname,matricule,grade,school,facebook,email,phone,motivation)){
                                    var data = {
                                        name : name,
                                        lastname : lastname,
                                        matricule : matricule,
                                        genre : genre,
                                        grade : grade,
                                        category : category,
                                        motivation : motivation,
                                        matricule : matricule,
                                        facebook : facebook,
                                        email : email ,
                                        school : school,
                                        phone : phone
                                    }
                                    var datastring = JSON.stringify(data)
                                    console.log(datastring)
                                    MainWindow.addStudent(datastring)
                                    menu_stack.replace(addStudent,listStudent)
                                }
                                else{
                                    popup_loader.isError = true ;
                                    popup_title.text = "Error notification"
                                    popup_content.text = "Error on your identity. Please verify your identity to be correctly with the standaed required by the application."
                                    popup_loader.open()
                                    
                                }

                            }
                        }
                    }
                    Row{
                       
                        Layout.alignment : Qt.AlignCenter
                        width : parent.width 
                        height : 20
                        Text{
                            font.pixelSize: 13
                            text: "Save"
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
                                menu_stack.replace(addStudent,listStudent)
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
            height : menu_stack.height - 105
            Material.background : Material.Teal
            spacing : 0
            Layout.leftMargin : 20
            Rectangle {
                width : menu_stack.width / 3  
                height : parent.height
                color : "transparent"
                ColumnLayout {
                    width: parent.width
                    implicitHeight : 60*5 
                    spacing : 0
                    Layout.alignment: Qt.AlignTop

                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
                        Layout.topMargin : 20
                        Layout.leftMargin : 20
                        Layout.bottomMargin : 20
                        Rectangle {
                            width: 320
                            height : 60
                            radius : 2
                            Material.background :"transparent"
                            color : Material.color(Material.Green)
                            y : 5
                            x : 50
                            opacity : 0.8
                            Row{
                                width : parent.width
                                height : parent.height
                                Layout.alignment : Qt.AlignHCenter
                                Rectangle {
                                    width : 48 
                                    height : parent.height
                                    color : "transparent"
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.perm_contact_calendar
                                        anchors.centerIn : parent
                                        color : "#ffffff"
                                    }
                                }
                                Text{
                                    font.pixelSize: 16
                                    text: "Identity"
                                    anchors.centerIn : parent
                                    color : "#ffffff"
                                    font.bold : true
                                }
                            }
                        }
                    }
                    Row {
                        width : parent.width
                        height : 60
                        Layout.topMargin : 20
                        Layout.alignment: Qt.AlignTop
                        spacing : 0
                        Rectangle {
                            width: 48
                            height : 24
                            Material.background :"transparent"
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
                        TextField {
                            x : 20
                            id: text_name
                            placeholderText: "Name"
                            Layout.margins: 10
                            implicitWidth : 280
                            font.pixelSize: 12
                            rightPadding: 10
                            leftPadding: 10
                            bottomPadding: 10
                            topPadding: 10
                            onEditingFinished : {
                            }
                            background: Rectangle { 
                                radius : 2
                                color: "transparent" 
                                border.width : 1
                                border.color : text_name.hoverEnabled ? Material.color(Material.Blue) : "grey"
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
                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
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
                                text: MD.icons.person
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        TextField {
                            x : 20
                            id: text_lastname
                            placeholderText: "Lastname"
                            Layout.margins: 10
                            implicitWidth : 280
                            font.pixelSize: 12
                            rightPadding: 10
                            leftPadding: 10
                            bottomPadding: 10
                            topPadding: 10
                            onEditingFinished : {
                            }
                            background: Rectangle { 
                                radius : 2
                                color: "transparent" 
                                border.width : 1
                                border.color : text_lastname.hoverEnabled ? Material.color(Material.Blue) : "grey"
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
                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
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
                                text: MD.icons.fingerprint
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        TextField {
                            x : 30
                            id: text_matricule
                            placeholderText: "Matricule"
                            Layout.margins: 10
                            implicitWidth : 280
                            font.pixelSize: 12
                            rightPadding: 10
                            leftPadding: 10
                            bottomPadding: 10
                            topPadding: 10
                            onEditingFinished : {
                            }
                            background: Rectangle { 
                                radius : 2
                                color: "transparent" 
                                border.width : 1
                                border.color : text_matricule.hoverEnabled ? Material.color(Material.Blue) : "grey"
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
                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
                        Layout.topMargin : 15
                        Rectangle {
                            width: 48
                            height : 24
                            Material.background :"transparent"
                            color : "transparent"
                            y : 16
                            Text{
                                font.family: iconFont.name
                                font.pixelSize: 24
                                text: MD.icons.wc
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        ComboBox {
                            height : 50
                            width : 280
                            flat: true
                            anchors.centerIn : parent
                            id : student_genre
                            font.pointSize: 10
                            Layout.margins : 0
                            background : Rectangle {
                                color : "transparent"
                                border.width : 1 
                                border.color : "grey"
                                radius : 2
                                anchors.leftMargin: 0
                            }
                            model : ListModel{
                                id: ordre
                                ListElement { key: "Man"; }
                                ListElement { key: "Woman"; }
                                // ListElement { key: "Group 3"; }
                            }
                            delegate: ItemDelegate {
                                id:itemDlgt
                                width: student_genre.width
                                height:40
                                padding:0

                                contentItem: Text {
                                    id:textItem
                                    text: modelData
                                    color: hovered ?"white":"#507BF6"
                                    font: student_genre.font
                                    elide: Text.ElideRight
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignLeft
                                    leftPadding: 20
                                }

                                background: Rectangle {
                                    // radius: 20
                                    color: itemDlgt.hovered ?"#507BF6":"white"
                                    anchors.left: itemDlgt.left
                                    anchors.leftMargin: 0
                                    width:itemDlgt.width - 2
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
                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
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
                                text: MD.icons.grade
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        TextField {
                            x : 20
                            id: text_grade
                            placeholderText: "Grade"
                            Layout.margins: 10
                            implicitWidth : 280
                            font.pixelSize: 12
                            rightPadding: 10
                            leftPadding: 10
                            bottomPadding: 10
                            topPadding: 10
                            onEditingFinished : {
                            }
                            background: Rectangle { 
                                radius : 2
                                color: "transparent" 
                                border.width : 1
                                border.color : text_grade.hoverEnabled ? Material.color(Material.Blue) : "grey"
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
                }

                
            }
            Rectangle {
                width : menu_stack.width / 3  
                height : parent.height
                color : "transparent"
                ColumnLayout {
                    width: parent.width
                    implicitHeight : 60*5
                    Layout.alignment: Qt.AlignTop

                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
                        Layout.topMargin : 20
                        Layout.leftMargin : 20
                        Layout.bottomMargin : 20
                        Rectangle {

                            width: 320
                            height : 60
                            radius : 2
                            opacity : 0.8
                            Material.background :"transparent"
                            color : Material.color(Material.Red)
                            y : 5
                            x : 50
                            Row{
                                width : parent.width
                                height : parent.height
                                Layout.alignment : Qt.AlignHCenter
                                Rectangle {
                                    width : 48 
                                    height : parent.height
                                    color : "transparent"
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.contact_mail
                                        anchors.centerIn : parent
                                        color : "#ffffff"
                                    }
                                }
                                Text{
                                    font.pixelSize: 16
                                    text: "Contacts"
                                    anchors.centerIn : parent
                                    color : "#ffffff"
                                    font.bold : true
                                }
                            }
                        }
                    }
                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
                        Layout.topMargin : 15
                        Rectangle {
                            width: 48
                            height : 24
                            Material.background :"transparent"
                            color : "transparent"
                            y : 5
                            Text{
                                font.family: iconFont.name
                                font.pixelSize: 24
                                text: MD.icons.group_add
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        TextField {
                            x : 20
                            id: text_facebook
                            placeholderText: "Facebook"
                            Layout.margins: 10
                            implicitWidth : 280
                            font.pixelSize: 12
                            rightPadding: 10
                            leftPadding: 10
                            bottomPadding: 10
                            topPadding: 10
                            onEditingFinished : {
                            }
                            background: Rectangle { 
                                radius : 2
                                color: "transparent" 
                                border.width : 1
                                border.color : text_facebook.hoverEnabled ? Material.color(Material.Blue) : "grey"
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
                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
                        Layout.topMargin : 15
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
                            id: text_email
                            placeholderText: "Email"
                            Layout.margins: 10
                            implicitWidth : 280
                            font.pixelSize: 12
                            rightPadding: 10
                            leftPadding: 10
                            bottomPadding: 10
                            topPadding: 10
                            onEditingFinished : {
                            }
                            background: Rectangle { 
                                radius : 2
                                color: "transparent" 
                                border.width : 1
                                border.color : text_email.hoverEnabled ? Material.color(Material.Blue) : "grey"
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
                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
                        Layout.topMargin : 15
                        Rectangle {
                            width: 48
                            height : 24
                            Material.background :"transparent"
                            color : "transparent"
                            y : 5
                            Text{
                                font.family: iconFont.name
                                font.pixelSize: 24
                                text: MD.icons.call
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        TextField {
                            x : 20
                            id: text_phone
                            placeholderText: "Phone number"
                            Layout.margins: 10
                            implicitWidth : 280
                            font.pixelSize: 12
                            rightPadding: 10
                            leftPadding: 10
                            bottomPadding: 10
                            topPadding: 10
                            onEditingFinished : {
                            }
                            background: Rectangle { 
                                radius : 2
                                color: "transparent" 
                                border.width : 1
                                border.color : text_phone.hoverEnabled ? Material.color(Material.Blue) : "grey"
                            }
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
                    Row {
                        width : parent.width 
                        height : 60 
                        Layout.alignment : Qt.AlignTop
                        Layout.topMargin : 10
                        Rectangle {
                            width: 48
                            height : 24
                            Material.background :"transparent"
                            color : "transparent"
                            y : 12
                            Text{
                                font.family: iconFont.name
                                font.pixelSize: 24
                                text: MD.icons.local_library
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        ComboBox {
                            height : 50
                            width : 280
                            anchors.centerIn : parent
                            id : student_category
                            font.pointSize: 10
                            background : Rectangle {
                                radius : 2
                                color : "transparent"
                                border.width : 1
                                border.color : "grey"
                            }
                            model : ListModel{
                                id: categories
                                ListElement { key: "A1" ;}
                                ListElement { key: "A2";  }
                                ListElement { key: "A3";}
                                ListElement { key: "A4 10h" ;}
                                ListElement { key: "A4 13h" ;}
                                ListElement { key: "B1";  }
                                ListElement { key: "B2";}
                                ListElement { key: "C1";  }
                                ListElement { key: "Coach";}
                            }

                            delegate: ItemDelegate {
                                id:itemDlgt
                                width: student_category.width
                                height:40
                                padding:0

                                contentItem: Text {
                                    id:textItem
                                    text: modelData
                                    color: hovered ?"white":"#507BF6"
                                    font: student_category.font
                                    elide: Text.ElideRight
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignLeft
                                    leftPadding: 20
                                }

                                background: Rectangle {
                                    // radius: 20
                                    color: itemDlgt.hovered ?"#507BF6":"white"
                                    anchors.left: itemDlgt.left
                                    anchors.leftMargin: 0
                                    width:itemDlgt.width-2
                                }

                            }
                            onCurrentIndexChanged: console.debug(categories.get(currentIndex).text + ", " + categories.get(currentIndex).value)
                        }
                        
                    }
                    Row {
                        width : parent.width 
                        height : 60 
                        Layout.alignment : Qt.AlignTop
                        Layout.topMargin : 5
                        Rectangle {
                            width: 48
                            height : 24
                            Material.background :"transparent"
                            color : "transparent"
                            y : 12
                            Text{
                                font.family: iconFont.name
                                font.pixelSize: 24
                                text: MD.icons.school
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        ComboBox {
                            height : 50
                            width : 280
                            anchors.centerIn : parent
                            id : school_category
                            font.pointSize: 10
                            background : Rectangle {
                                radius : 2
                                color : "transparent"
                                border.width : 1
                                border.color : "grey"
                            }
                            model : ListModel{
                                id: centers
                                ListElement { key: "Eufonie Ankorondrano" ;}
                                ListElement { key: "Ivotech Ankatso";  }
                                
                            }

                            delegate: ItemDelegate {
                                id:itemDlgt
                                width: school_category.width
                                height:40
                                padding:0

                                contentItem: Text {
                                    id:textItem
                                    text: modelData
                                    color: hovered ?"white":"#507BF6"
                                    font: student_category.font
                                    elide: Text.ElideRight
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignLeft
                                    leftPadding: 20
                                }

                                background: Rectangle {
                                    // radius: 20
                                    color: itemDlgt.hovered ?"#507BF6":"white"
                                    anchors.left: itemDlgt.left
                                    anchors.leftMargin: 0
                                    width:itemDlgt.width-2
                                }

                            }
                            onCurrentIndexChanged: console.debug(categories.get(currentIndex).text + ", " + categories.get(currentIndex).value)
                        }
                        
                    }
                }
            }
            Rectangle {
                width : menu_stack.width / 3  
                height : parent.height
                color : "transparent"
                ColumnLayout {
                    width: menu_stack.width /3
                    implicitHeight : 60*2
                    Row {
                        width : parent.width
                        height : 60
                        Layout.alignment: Qt.AlignTop
                        Layout.topMargin : 20
                        Layout.leftMargin : 20
                        Layout.bottomMargin : 20
                        Rectangle {
                            width: 320
                            height : 60
                            radius : 2
                            opacity : 0.8
                            Material.background :"transparent"
                            color : Material.color(Material.Blue)
                            y : 5
                            x : 50
                            Row{
                                width : parent.width
                                height : parent.height
                                Layout.alignment : Qt.AlignHCenter
                                Rectangle {
                                    width : 48 
                                    height : parent.height
                                    color : "transparent"
                                    Text{
                                        font.family: iconFont.name
                                        font.pixelSize: 24
                                        text: MD.icons.thumb_up
                                        anchors.centerIn : parent
                                        color : "#ffffff"
                                    }
                                }
                                Text{
                                    font.pixelSize: 16
                                    text: "Motivations"
                                    anchors.centerIn : parent
                                    color : "#ffffff"
                                    font.bold : true
                                }
                            }
                        }
                    }

                    Row {
                        width : parent.width
                        height : 280
                        Layout.alignment: Qt.AlignTop
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
                                text: MD.icons.insert_emoticon
                                anchors.centerIn : parent
                                color : Material.color(Material.Blue)
                            }
                        }
                        ColumnLayout{
                            width: 280
                            height : 270
                            FontMetrics {
                                id: fontMetrics
                                font: textAreaMotivation.font
                            }
                            Flickable {
                                id: flickable
                                width: parent.width
                                height: 270
                                contentWidth: width
                                contentHeight: 270
                                clip: true
                                TextArea.flickable : TextArea {
                                    id: textAreaMotivation
                                    placeholderText : "Your motivation here . . ."
                                    wrapMode: Text.WordWrap
                                    padding: 10
                                    height : 270
                                    font.pixelSize : 12
                                    background: Rectangle {
                                        border.color: Material.color(Material.Blue)
                                        radius : 5
                                        color : "transparent"
                                    }
                                }
                                ScrollBar.vertical: ScrollBar {}
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
                        Layout.alignment: Qt.AlignRight
                        Layout.rightMargin : 40

                        Button{
                            id : btn_validate
                            width : 100
                            text : "Validate"
                            Material.foreground : "#ffffff"
                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                color: btn_validate.down ? "#90CAF9" : Material.color(Material.Blue)
                                radius : 5
                            }
                            onClicked : {
                                var name = text_name.text
                                var lastname = text_lastname.text
                                var matricule = text_matricule.text
                                var genre = windows.genres[student_genre.currentIndex]
                                var grade = text_grade.text 
                                var category = windows.categories[student_category.currentIndex]
                                var motivation = textAreaMotivation.text 
                                var facebook = text_facebook.text 
                                var email = text_email.text 
                                var phone = text_phone.text
                                var school = windows.centers[school_category.currentIndex]

                                if(windows.validateData(name,lastname,matricule,grade,school,facebook,email,phone,motivation)){
                                    popup_loader.isError = false 
                                    popup_title.text = "Data notification"
                                    popup_content.text = "Your identity is correct , you can save it now by save button in the top ."
                                    popup_loader.open()
                                    popup_loader.validateBtn = function(){
                                        popup_loader.close()
                                    }
                                }
                                else{
                                    popup_loader.isError = true 
                                    popup_title.text = "Error notification"
                                    popup_content.text = "Error on your identity. Please verify your identity to be correctly with the standaed required by the application."
                                    popup_loader.open()
                                    popup_loader.validateBtn = function(){
                                        popup_loader.close()
                                    }
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
                }
            }
        }
        
    }

}