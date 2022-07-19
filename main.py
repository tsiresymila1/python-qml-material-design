
import os
import sys
import json
from PyQt5 import QtGui, QtWidgets, QtPrintSupport
from PyQt5.QtGui import QGuiApplication,QIcon
from PyQt5.QtCore import QUrl
from PyQt5.QtCore import pyqtSlot, pyqtSignal,QObject
from PyQt5.QtQml import QQmlApplicationEngine,qmlRegisterType
from PyQt5.QtQuick import QQuickView
import PyQt5.QtQuick
import PyQt5.QtQml


from packages.database import DatabaseStudent,DatabaseUser

application_path = (
    os.path.dirname(sys.executable)
    if getattr(sys, "frozen", False)
    else os.path.dirname(os.path.abspath(__file__))
)

def resource_path(relative_path):
    """ Get absolute path to resource, works for dev and for PyInstaller """
    base_path = getattr(sys, '_MEIPASS', os.path.dirname(os.path.abspath(__file__)))
    return os.path.join(base_path, relative_path)

base_path = getattr(sys, '_MEIPASS', os.path.dirname(os.path.abspath(__file__)))

class MainWindow(QQmlApplicationEngine) :
    
    updateStudent = pyqtSignal('QVariant')
    loginSignal = pyqtSignal('QString')
    registerSignal = pyqtSignal('QString')
    # updateProf = pyqtSignal('QVariant')
    # updateFile = pyqtSignal('QVariant')
    #self.encodeResponse.emit(str(rep))

    def __init__(self,app):
        super().__init__()
        self.app = app
        self.rootContext().setContextProperty("MainWindow", self)
        self.studentDatabase = DatabaseStudent()
        self.userDatabase = DatabaseUser()
        
    def addProperty(self,string,value):
        self.rootContext().setContextProperty(string,value)
    
    @pyqtSlot('QVariant')
    def addUser(self,data):
        self.user = self.userDatabase.addUser(data)
        islogged = "null"
        if self.user != None :
            islogged = self.user.toJson()
        self.registerSignal.emit(islogged)
        
    @pyqtSlot('QVariant')
    def login(self,data):
        self.user = self.userDatabase.login(data)
        islogged = "null"
        if self.user != None :
            islogged = self.user.toJson()
        self.loginSignal.emit(islogged)
    
    @pyqtSlot()
    def loadData(self):
        data = self.studentDatabase.getAllStudent()
        self.updateStudent.emit(data)
        
    @pyqtSlot('QVariant')
    def addStudent(self,data):
        self.studentDatabase.addStudent(data)
        
    @pyqtSlot('QVariant')
    def modifyStudent(self,data):
        self.studentDatabase.modifyStudent(data)
        # self.loadData()
    @pyqtSlot('QVariant','QVariant')
    def deleteStudent(self,identifiant,userId):
        self.studentDatabase.deleteStudent(identifiant,userId)
    
    @pyqtSlot('QString')
    def searchStudent(self,text):
        data = self.studentDatabase.seachStudent(str(text))
        self.updateStudent.emit(data)
        
    @pyqtSlot('QString','QString','QString')
    def filterStudent(self,cat,select,order):
        data = self.studentDatabase.filterStudent(str(cat),str(select),str(order))
        self.updateStudent.emit(data)


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    app.setWindowIcon(QIcon('robot.png'))
    os.environ["QT_QUICK_CONTROLS_STYLE"] = "Material"
    engine = MainWindow(app)
    ctx = engine.rootContext()
    ctx.setContextProperty("qmlapp", engine)
    engine.load(QUrl.fromLocalFile(os.path.join(base_path,'qml','main.qml')))
    #engine.load(QUrl.fromLocalFile(os.path.join(os.path.dirname(__file__),'qml','StudentView.qml')))
    engine.quit.connect(app.quit)
    sys.exit(app.exec_())




