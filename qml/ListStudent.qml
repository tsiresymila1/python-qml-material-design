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

    id : listStudentComponent

    ColumnLayout{
        height : parent.height
        width : menu_stack.width
        spacing: 0
        Layout.alignment: Qt.AlignHCenter
        id : student
        property var tableRowSelected : null
        Row{
            id : btns
            width : parent.width
            Layout.alignment: Qt.AlignRight
            spacing : 5

            Rectangle{
                width : 160
                height : 100
                color: "transparent"
                Layout.alignment: Qt.AlignHCenter
                ComboBox {
                    height : 50
                    width : 150
                    anchors.centerIn : parent
                    id : student_category
                    font.pointSize: 10
                    model : ListModel{
                        id: categories
                        ListElement { key: "All" ;}
                        ListElement { key: "A1" ;}
                        ListElement { key: "A2";  }
                        ListElement { key: "A3";}
                        ListElement { key: "A4 10h" ;}
                        ListElement { key: "A4 13h" ;}
                        ListElement { key: "B1";  }
                        ListElement { key: "B2";}
                        ListElement { key: "C1";  }
                        ListElement { key: "C2";}
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
            Rectangle{
                width : 160
                height : 100
                color: "transparent"
                Layout.alignment: Qt.AlignHCenter
                ComboBox {
                    height : 50
                    width : 150
                    anchors.centerIn : parent
                    id : student_select
                    font.pointSize: 10
                    model : ListModel{
                        id: properties
                        ListElement { key: "Matricule"; }
                        ListElement { key: "Name"; }
                    }
                    delegate: ItemDelegate {
                        id:itemDlgt
                        width: student_select.width
                        height:40
                        padding:0

                        contentItem: Text {
                            id:textItem
                            text: modelData
                            color: hovered ?"white":"#507BF6"
                            font: student_select.font
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
                }
            }
            Rectangle{
                width : 160
                height : 100
                color: "transparent"
                Layout.alignment: Qt.AlignHCenter
                ComboBox {
                    height : 50
                    width : 150
                    anchors.centerIn : parent
                    id : student_ordered
                    font.pointSize: 10
                    model : ListModel{
                        id: orders
                        ListElement { key: "Ascendant"; }
                        ListElement { key: "Descendant"; }
                        // ListElement { key: "Group 3"; }
                    }
                    delegate: ItemDelegate {
                        id:itemDlgt
                        width: student_ordered.width
                        height:40
                        padding:0

                        contentItem: Text {
                            id:textItem
                            text: modelData
                            color: hovered ?"white":"#507BF6"
                            font: student_ordered.font
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
            }

            Rectangle{
                width : 100
                height : 100
                color: "transparent"
                Layout.alignment: Qt.AlignHCenter
                Button{
                    x : 2
                    anchors.centerIn : parent
                    id : filtrer
                    width : 100
                    text : "Filtrer"
                    Material.foreground : "#ffffff"
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 35
                        color: filtrer.down ? "#90CAF9" : Material.color(Material.Blue)
                        radius : 5
                    }
                    onClicked : {
                        var cat = categories.get(student_category.currentIndex).key
                        var ppt = properties.get(student_select.currentIndex).key
                        var sens = orders.get(student_ordered.currentIndex).key
                        console.log(cat,ppt,sens)  
                        MainWindow.filterStudent(cat,ppt,sens)                    
                    }

                }
            }
            Rectangle{
                width : 230
                height : 100
                color : "transparent"
                Layout.alignment: Qt.AlignHCenter
                Row{
                    anchors.centerIn: parent
                    height :40
                    TextField {
                        x : 20
                        y : 4
                        id: search
                        placeholderText: "Search"
                        Layout.margins: 10
                        implicitWidth :200
                        font.pixelSize: 12
                        rightPadding: 24
                        leftPadding: 24
                        bottomPadding: 10
                        onEditingFinished : {
                            if (search.text != ""){
                                MainWindow.searchStudent(search.text)
                            }
                            else{
                               MainWindow.loadData() 
                            }
                        }
                        background: Rectangle { 
                            radius : 20
                            color: "transparent" 
                            border.width : 1
                            border.color : Material.color(Material.Blue)
                        }
                    }
                }
            }
            Rectangle{
                width : 70
                height : 100
                color: "transparent"
                RoundButton{
                    Layout.fillWidth : true
                    font.family: iconFont.name
                    Material.background : Material.color(Material.Blue)
                    Text{
                        font.family: iconFont.name
                        font.pixelSize: 24
                        text: MD.icons.visibility
                        anchors.centerIn : parent
                        color : "white"
                    }
                    padding:-5
                    font.pixelSize: 40
                    Layout.alignment: Qt.AlignCenter
                    anchors.centerIn : parent
                    Material.foreground : Material.Pink

                    onClicked : {
                        if(student.tableRowSelected != null){
                            var modelSelected = studentListModel.get(student.tableRowSelected)
                            homepage.studentModelSelected = modelSelected
                            menu_stack.replace(listStudent,viewStudent)

                        }
                        
                    }
                }
            }
            Rectangle{
                width : 70
                height : 100
                color: "transparent"
                RoundButton{
                    Layout.fillWidth : true
                    font.family: iconFont.name
                    Material.background : Material.color(Material.Blue)
                    Text{
                        font.family: iconFont.name
                        font.pixelSize: 24
                        text: MD.icons.add
                        anchors.centerIn : parent
                        color : "white"
                    }
                    padding:-5
                    font.pixelSize: 40
                    Layout.alignment: Qt.AlignCenter
                    anchors.centerIn : parent
                    Material.foreground : Material.Pink

                    onClicked : {
                        menu_stack.replace(listStudent,addStudent)
                    }
                }
            }
            Rectangle{
                width : 70
                height : 100
                color: "transparent"
                RoundButton{
                    Layout.fillWidth : true
                    font.family: iconFont.name
                    Material.background : Material.color(Material.Green)
                    Text{
                        font.family: iconFont.name
                        font.pixelSize: 24
                        text: MD.icons.edit
                        anchors.centerIn : parent
                        color : "white"
                    }
                    padding:-5
                    font.pixelSize: 40
                    Layout.alignment: Qt.AlignCenter
                    anchors.centerIn : parent
                    Material.foreground : Material.Pink

                    onClicked : {
                        if(student.tableRowSelected != null){
                            console.log(student.tableRowSelected )
                            var modelSelected = studentListModel.get(student.tableRowSelected)
                            homepage.studentModelSelected = modelSelected
                            menu_stack.push(modifyStudent)
                        }
                        else {
                            popup_loader.isError = true 
                            popup_title.text = "Notifications"
                            popup_content.text = "Please, specify and select an element to modify in the array ."
                            popup_loader.open()
                        }
                        
                    }
                }
            }
            Rectangle{
                width : 70
                height : 100
                color: "transparent"
                RoundButton{
                    Layout.fillWidth : true
                    font.family: iconFont.name
                    Material.background : Material.color(Material.Red)
                    Text{
                        font.family: iconFont.name
                        font.pixelSize: 24
                        text: MD.icons.delete
                        anchors.centerIn : parent
                        color : "white"
                    }
                    padding:-5
                    font.pixelSize: 40
                    Layout.alignment: Qt.AlignCenter
                    anchors.centerIn : parent
                    Material.foreground : Material.Pink

                    onClicked : {
                        if(student.tableRowSelected != null){
                            var modelSelected = studentListModel.get(student.tableRowSelected)
                            popup_loader.isError = false 
                            popup_title.text = "Notifications"
                            popup_content.text = "Do you really want to delete perma nently "+modelSelected.name+" "+modelSelected.lastname+' in your database ?? '
                            popup_loader.open()
                            popup_loader.validateBtn = function(){
                                var modelSelected = studentListModel.get(student.tableRowSelected)
                                MainWindow.deleteStudent(modelSelected.id,modelSelected.userId)
                                MainWindow.loadData()
                                popup_loader.close()
                            }
                        }
                        else {
                            popup_loader.isError = true 
                            popup_title.text = "Notifications"
                            popup_content.text = "Please, specify and select an element to delete in the array ."
                            popup_loader.open()
                        }
                    }
                }
            }
            
        }
        Row{
            width : menu_stack.width 
            height : parent.height
            anchors.left : parent.left
            anchors.right : parent.right
            anchors.top : btns.bottom
            anchors.bottom : parent.bottom
            padding : 5

            QtC1.TableView {
                id: tableStudents
                frameVisible: true
                width : menu_stack.width - 5
                height : menu_stack.height - 105
                Layout.margins : 5
                backgroundVisible : false

                anchors{
                    top:parent.top
                    left:parent.left
                    right:parent.right
                    bottom:parent.bottom
                }

                Component.onCompleted : {
                    MainWindow.updateStudent.connect(updateTable);
                    MainWindow.loadData();
                }

                property var  updateTable: function(newTable){
                    var studentData = JSON.parse(newTable);
                    studentListModel.clear();
                    for(var i = 0 ; i< studentData.length ; i++){
                        var single_data = studentData[i]
                        studentListModel.append({
                            id : single_data['id'],
                            userId : single_data["userId"],
                            matricule : single_data['matricule'],
                            name: single_data["name"],
                            lastname : single_data["lastname"],
                            genre : single_data["genre"],
                            category : single_data["category"],
                            grade : single_data["grade"],
                            email : single_data["email"],
                            phone : single_data["phone"],
                            facebook : single_data["facebook"],
                            school : single_data["school"],
                            motivation : single_data["motivation"]
                        });
                    }
                }
                onClicked :{
                    student.tableRowSelected = row
                    if(student.tableRowSelected != null){
                        homepage.studentModelSelected = studentListModel.get(row)
                    }
                }
                onDoubleClicked : {
                    student.tableRowSelected = row
                    if(student.tableRowSelected != null){
                        homepage.studentModelSelected = studentListModel.get(row)
                        menu_stack.replace(listStudent,viewStudent)

                    }
                }
                model: ListModel{
                    id:studentListModel
                }

                Component{
                    id:itemDelegateText
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        color: styleData.selected ?  "white" : Material.color(Material.Blue)
                        elide: styleData.elideMode
                        text: styleData.value
                        padding : 10
                        font.pointSize: 10
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }
                }

                QtC1.TableViewColumn{
                    role:"matricule"
                    title:qsTr("Matricule")
                    width:80
                    delegate: itemDelegateText
                    resizable : false
                }
                QtC1.TableViewColumn{
                    role:"name"
                    title:qsTr("Name")
                    width:(tableStudents.width - 740) /2
                    delegate: itemDelegateText
                    resizable : false
                }
                QtC1.TableViewColumn{
                    role:"lastname"
                    title:qsTr("Lastname")
                    width:(tableStudents.width - 740) /2
                    delegate: itemDelegateText
                    resizable : false
                }
                QtC1.TableViewColumn{
                    role:"genre"
                    title:qsTr("Genre")
                    width:100
                    delegate:itemDelegateText
                    resizable : false
                }
                QtC1.TableViewColumn{
                    role:"category"
                    title:qsTr("Category")
                    width:80
                    delegate:itemDelegateText
                    resizable : false
                }

                QtC1.TableViewColumn{
                    role:"grade"
                    title:qsTr("Grade")
                    width:90
                    delegate: itemDelegateText
                    resizable : false
                }
                QtC1.TableViewColumn{
                    role:"email"
                    title:qsTr("Email")
                    width:140
                    delegate: itemDelegateText
                    resizable : false
                }
                QtC1.TableViewColumn{
                    role:"facebook"
                    title:qsTr("Facebook")
                    width:140
                    delegate: itemDelegateText
                    resizable : false
                }
                
                QtC1.TableViewColumn{
                    role:"phone"
                    title:qsTr("Phone number")
                    width:100
                    delegate: itemDelegateText
                    resizable : false
                }

                headerDelegate: Rectangle{
                    height: 40
                    border.width: 1
                    color: Material.color(Material.Blue)
                    border.color: Material.color(Material.Blue)
                    Text {
                        padding : 10
                        id: headerName
                        text: styleData.value
                        font.pointSize: 10
                        font.bold: true
                        color : "white"
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }
                }
                rowDelegate: Rectangle{
                    id:rowRectangle
                    property color rowColor: styleData.selected ? Material.color(Material.Blue): "transparent" //(styleData.alternate ? "#F0FFF0":"#E6E6FA")
                    color: rowColor
                    height : 40
                }
            }
        }
    }
}