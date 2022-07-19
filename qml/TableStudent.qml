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

Component {
    id : tableCOmponent
    
    QtC1.TableView {
        id: tableStudents
        frameVisible: true
        width : menu_stack.width - 5
        height : menu_stack.height - 105
        Layout.margins : 5
        backgroundVisible : false

        Component.onCompleted : {
            // MainWindow.update.connect(updateTable);
            // MainWindow.loadData();
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
            // student.tableRowSelected = row
            // console.log(listModel.get(row))
        }
        onDoubleClicked : {
            // if(c_layout.tableRowSelected != null){
            //     console.log(listModel.get(c_layout.tableRowSelected).name)
            //     var component = Qt.createComponent("PatientView.qml");
            //     if(component.status === Component.Ready){
            //         console.log(listModel.get(c_layout.tableRowSelected).profile)
            //         var dialog = component.createObject(parent,{
            //             userId :  listModel.get(c_layout.tableRowSelected).userId,
            //             profile : listModel.get(c_layout.tableRowSelected).profile,
            //             nom : listModel.get(c_layout.tableRowSelected).name,
            //             prenom :listModel.get(c_layout.tableRowSelected).lastname,
            //             date_de_naissance : listModel.get(c_layout.tableRowSelected).birthdate,
            //             lieu_de_naissance : listModel.get(c_layout.tableRowSelected).birthcity,
            //             mon_classe_index : c_layout.classes.indexOf(listModel.get(c_layout.tableRowSelected).classe),
            //             n_ins : listModel.get(c_layout.tableRowSelected).identifiant
            //             });
            //         dialog.show();
            //     }
            // }
        }
        model: ListModel{
            id:listModel
        }

        Component{
            id:itemDelegateText
            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: styleData.selected ? Material.color(Material.Blue) :"white"
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
            title:qsTr("Name")
            width:(tableStudents.width - 680) /2
            delegate: itemDelegateText
        }
        QtC1.TableViewColumn{
            role:"lastname"
            title:qsTr("Lastname")
            width:(tableStudents.width - 680) /2
            delegate: itemDelegateText
        }
        QtC1.TableViewColumn{
            role:"genre"
            title:qsTr("Genre")
            width:120
            delegate:itemDelegateText
        }
        QtC1.TableViewColumn{
            role:"category"
            title:qsTr("Category")
            width:120
            delegate:itemDelegateText
        }

        QtC1.TableViewColumn{
            role:"level"
            title:qsTr("Level")
            width:50
            delegate: itemDelegateText
        }
        QtC1.TableViewColumn{
            role:"email"
            title:qsTr("Email")
            width:100
            delegate: itemDelegateText
        }
        QtC1.TableViewColumn{
            role:"facebook"
            title:qsTr("Facebook")
            width:100
            delegate: itemDelegateText
        }
        
        QtC1.TableViewColumn{
            role:"phone"
            title:qsTr("Phone number")
            width:100
            delegate: itemDelegateText
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
            property color rowColor: styleData.selected ? "white": "transparent" //(styleData.alternate ? "#F0FFF0":"#E6E6FA")
            color: rowColor
            height : 40
        }
    }
}