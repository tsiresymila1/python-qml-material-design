
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

    id : listPatient
    ColumnLayout{
        height : parent.height
        width : stack.width
        spacing: 0
        Layout.alignment: Qt.AlignHCenter
        id : c_layout
        property var tableRowSelected : null
        property var sickness : ["Master 2","Master Pro 2","Master 1","Master Pro 2","Licence 3","Licence Pro 3","Licence 2","Licence Pro 2","Licence 1","Licence Pro 1"]
        Row{
            id : btns
            width : parent.width
            //anchors.left : parent.left
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
                    id : f_sickness
                    model : ListModel{
                        id: groupList1
                        ListElement { key: "Tous" ;}
                        ListElement { key: "Master 2" ;}
                        ListElement { key: "Master Pro 2";  }
                        ListElement { key: "Master 1";}
                        ListElement { key: "Master Pro 1" ;}
                        ListElement { key: "Licence 3";  }
                        ListElement { key: "Licence Pro 3";}
                        ListElement { key: "Licence 2";  }
                        ListElement { key: "Licence Pro 2";}
                        ListElement { key: "Licence 1";  }
                        ListElement { key: "Licence Pro 1";}
                    }
                    onCurrentIndexChanged: console.debug(groupList1.get(currentIndex).text + ", " + groupList1.get(currentIndex).value)
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
                    id : f_trie
                    model : ListModel{
                        id: groupList2
                        ListElement { key: "Nom"; }
                        ListElement { key: "Age"; }
                        // ListElement { key: "Group 3"; }
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
                    id : f_sens
                    model : ListModel{
                        id: groupList3
                        ListElement { key: "Ascendant"; }
                        ListElement { key: "Descendant"; }
                        // ListElement { key: "Group 3"; }
                    }
                }
            }

            Rectangle{
                width : 150
                height : 100
                color: "transparent"
                Layout.alignment: Qt.AlignHCenter
                Button{
                    anchors.centerIn : parent
                    id : filtrer
                    width : 100
                    text : "Filtrer"
                    Material.foreground : "#ffffff"
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 35
                        color: filtrer.down ? "#d0d0d0" : Material.color(Material.Blue)
                        radius : 5
                    }
                    onClicked : {
                        var correspond = {
                            Nom :"name",
                            Age : "b_day",
                            Ascendant : "ASC",
                            Descendant : "DESC"

                        }
                        var classe_f = groupList1.get(f_classe.currentIndex).key
                        var trie_f = correspond[groupList2.get(f_trie.currentIndex).key]
                        var sens_f = correspond[groupList3.get(f_sens.currentIndex).key]
                        MainWindow.filterStudent(classe_f,trie_f,sens_f)
                    }

                }
            }
            Rectangle{
                width : 220
                height : 100
                color : "transparent"
                Layout.alignment: Qt.AlignHCenter
                Row{
                    anchors.centerIn:parent
                    height :40
                    TextField {
                        x : 20
                        y : 5
                        id: search
                        placeholderText: "Recherche"
                        Layout.margins: 10
                        implicitWidth :200
                        font.pixelSize: 12
                        onEditingFinished : {
                            console.log("text : "+search.text);
                            var correspond = {
                                Nom :"name",
                                Age : "b_day",
                                Ascendant : "ASC",
                                Descendant : "DESC"

                            }
                            var classe_f = groupList1.get(f_classe.currentIndex).key
                            var trie_f = correspond[groupList2.get(f_trie.currentIndex).key]
                            var sens_f = correspond[groupList3.get(f_sens.currentIndex).key]
                            MainWindow.findStudent(search.text,classe_f,trie_f,sens_f);
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
                        if(c_layout.tableRowSelected != null){
                            console.log(listModel.get(c_layout.tableRowSelected).name)
                            var component = Qt.createComponent("StudentView.qml");
                            if(component.status === Component.Ready){
                                console.log(listModel.get(c_layout.tableRowSelected).profile)
                                var dialog = component.createObject(parent,{
                                    userId :  listModel.get(c_layout.tableRowSelected).userId,
                                    profile : listModel.get(c_layout.tableRowSelected).profile,
                                    nom : listModel.get(c_layout.tableRowSelected).name,
                                    prenom :listModel.get(c_layout.tableRowSelected).lastname,
                                    date_de_naissance : listModel.get(c_layout.tableRowSelected).birthdate,
                                    lieu_de_naissance : listModel.get(c_layout.tableRowSelected).birthcity,
                                    mon_classe_index : c_layout.classes.indexOf(listModel.get(c_layout.tableRowSelected).classe),
                                    n_ins : listModel.get(c_layout.tableRowSelected).identifiant
                                    });
                                dialog.show();
                            }
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
                        if(c_layout.tableRowSelected != null){
                            console.log(listModel.get(c_layout.tableRowSelected).name)
                            var component = Qt.createComponent("NewStudentDialog.qml");
                            if(component.status === Component.Ready){
                                console.log(listModel.get(c_layout.tableRowSelected).profile)
                                var dialog = component.createObject(parent,{
                                    popupType:2,
                                    id:listModel.get(c_layout.tableRowSelected).id,
                                    userId :  listModel.get(c_layout.tableRowSelected).userId,
                                    profile : listModel.get(c_layout.tableRowSelected).profile,
                                    nom : listModel.get(c_layout.tableRowSelected).name,
                                    prenom :listModel.get(c_layout.tableRowSelected).lastname,
                                    date_de_naissance : listModel.get(c_layout.tableRowSelected).birthdate,
                                    lieu_de_naissance : listModel.get(c_layout.tableRowSelected).birthcity,
                                    mon_classe_index : c_layout.classes.indexOf(listModel.get(c_layout.tableRowSelected).classe),
                                    n_ins : listModel.get(c_layout.tableRowSelected).identifiant
                                    });
                                dialog.show();
                            }
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
                        if(c_layout.tableRowSelected != null){
                            // listModel.remove(c_layout.tableRowSelected)
                            MainWindow.deleteStudent(listModel.get(c_layout.tableRowSelected).userId);
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
                        var component = Qt.createComponent("NewPatientDialog.qml");
                        if(component.status === Component.Ready){
                            var dialog = component.createObject(parent,{popupType:1})
                            //dialogConnection.target = dilaog ;
                            dialog.show();
                        }
                    }
                }
            }
        }
        Row{
            width : stack.width 
            height : parent.height
            anchors.left : parent.left
            anchors.right : parent.right
            anchors.top : btns.bottom
            anchors.bottom : parent.bottom
            padding : 5
            QtC1.TableView {
                id: tableStudents
                frameVisible: true
                width : stack.width - 5
                height : stack.height - 105
                Layout.margins : 5
                backgroundVisible : false

                Component.onCompleted : {
                    MainWindow.update.connect(updateTable);
                    MainWindow.loadData();
                }

                property var  updateTable: function(newTable){
                    var data = JSON.parse(newTable);
                    listModel.clear();
                    for(var i = 0 ; i< data.length ; i++){
                        var single_data = data[i]
                        // listModel.append({
                        //     number : i+1,
                        //     id : single_data['id'],
                        //     userId : single_data["userId"],
                        //     profile : single_data["profile"],
                        //     name: single_data["name"],
                        //     lastname : single_data["lastname"],
                        //     birthdate : single_data["birthdate"],
                        //     birthcity : single_data["birthcity"],
                        //     classe : single_data["classe"],
                        //     identifiant : single_data["identifiant"]
                        // });
                    }
                }
                onClicked :{
                    c_layout.tableRowSelected = row
                    console.log(listModel.get(row))
                }
                onDoubleClicked : {
                    if(c_layout.tableRowSelected != null){
                        console.log(listModel.get(c_layout.tableRowSelected).name)
                        var component = Qt.createComponent("PatientView.qml");
                        if(component.status === Component.Ready){
                            console.log(listModel.get(c_layout.tableRowSelected).profile)
                            var dialog = component.createObject(parent,{
                                userId :  listModel.get(c_layout.tableRowSelected).userId,
                                profile : listModel.get(c_layout.tableRowSelected).profile,
                                nom : listModel.get(c_layout.tableRowSelected).name,
                                prenom :listModel.get(c_layout.tableRowSelected).lastname,
                                date_de_naissance : listModel.get(c_layout.tableRowSelected).birthdate,
                                lieu_de_naissance : listModel.get(c_layout.tableRowSelected).birthcity,
                                mon_classe_index : c_layout.classes.indexOf(listModel.get(c_layout.tableRowSelected).classe),
                                n_ins : listModel.get(c_layout.tableRowSelected).identifiant
                                });
                            dialog.show();
                        }
                    }
                }
                model: ListModel{
                    id:listModel
                }

                Component{
                    id:itemDelegateText
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        color: styleData.selected ? Material.color(Material.Teal) :"white"
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
                }
                QtC1.TableViewColumn{
                    role:"name"
                    title:qsTr("Nom")
                    width:(tableStudents.width - 680) /2
                    delegate: itemDelegateText
                }
                QtC1.TableViewColumn{
                    role:"lastname"
                    title:qsTr("Prénom")
                    width:(tableStudents.width - 680) /2
                    delegate: itemDelegateText
                }
                QtC1.TableViewColumn{
                    role:"birthdate"
                    title:qsTr("Date de naissance")
                    width:120
                    delegate:itemDelegateText
                }
                QtC1.TableViewColumn{
                    role:"location"
                    title:qsTr("Adresse")
                    width:120
                    delegate:itemDelegateText
                }

                QtC1.TableViewColumn{
                    role:"sexe"
                    title:qsTr("Sexe")
                    width:50
                    delegate: itemDelegateText
                }
                QtC1.TableViewColumn{
                    role:"telephone"
                    title:qsTr("N° Téléphone")
                    width:100
                    delegate: itemDelegateText
                }
                QtC1.TableViewColumn{
                    role:"maladie"
                    title:qsTr("Antecedents")
                    width:100
                    delegate: itemDelegateText
                }
                
                QtC1.TableViewColumn{
                    role:"groupe"
                    title:qsTr("Groupe")
                    width:100
                    delegate: itemDelegateText
                }

                headerDelegate: Rectangle{
                    height: 40
                    border.width: 1
                    color: Material.color(Material.Teal)
                    border.color: Material.color(Material.Teal)
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
                    property color rowColor: styleData.selected ? "white": "transparent" //(styleData.alternate ? "#F0FFF0":"#E6E6FA")
                    color: rowColor
                    height : 40
                }
            }
        }
    }
    

}
