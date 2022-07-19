import os
from sqlalchemy import create_engine,Column,MetaData,Integer,Text,or_,and_,text,desc
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import hashlib
import qrcode

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
engine = create_engine('sqlite:///'+BASE_DIR+'/assets/data/.robotika.db')

Session = sessionmaker(bind=engine)
metadata = MetaData()
Base = declarative_base(metadata=metadata)
session = Session()
import shutil
import json 


    
class Student(Base):
    
    __tablename__= 'students'
    
    id = Column(Integer,primary_key=True)
    userId = Column(Text)
    name = Column(Text)
    lastname = Column(Text)
    matricule = Column(Text)
    genre = Column(Text)
    grade = Column(Text)
    category = Column(Text)
    school = Column(Text)
    motivation = Column(Text)
    email = Column(Text)
    facebook = Column(Text)
    phone = Column(Text)
    
    def __repr__(self):
        return 'Student class'
     
    
class DatabaseStudent(object) :
    
    def __init__(self):
        pass
    
    def loading(self,students):
        listStudents = list()
        for student in students :
            std = {
                'id' : student.id,
                'userId' : str(student.userId),
                'name' : str(student.name),
                'lastname' : str(student.lastname),
                'matricule' : str(student.matricule),
                'genre' : str(student.genre),
                'grade' : str(student.grade),
                'category' : str(student.category),
                'school' : str(student.school),
                'facebook' : str(student.facebook),
                'email' : str(student.email),
                'phone' : str(student.phone),
                'motivation' : str(student.motivation) 
            }
            listStudents.append(std)
        return json.dumps(listStudents)
    
    def addStudent(self,data):
        hasher = hashlib.sha256()
        hasher.update(str(data).encode())
        userIdentifiant =  hasher.hexdigest()
        data = json.loads(data)
        student = Student(
            userId=userIdentifiant,
            name=str(data['name']),
            lastname=str(data['lastname']),
            matricule=str(data['matricule']),
            genre=str(data['genre']),
            grade=str(data['grade']),
            category=str(data['category']),
            school=str(data['school']),
            facebook=str(data['facebook']),
            email=str(data['email']),
            phone=str(data['phone']),
            motivation=str(data['motivation'])
        )
        self.generateQrCode(userIdentifiant)
        session.add(student)
        session.commit() 
        
    def deleteStudent(self,identifiant,userId):
        student = session.query(Student).filter(Student.id == int(identifiant)).first()
        session.delete(student)
        session.commit()
        try :
            os.remove(os.getcwd()+'/assets/data/qrcode/'+userId+'.png')
        except Exception :
            print('File  not found ') 
        
    def modifyStudent(self,data) :
        hasher = hashlib.sha256()
        hasher.update(str(data).encode())
        userId =  hasher.hexdigest()
        data = json.loads(data)
        identifiant = int(data['id'])
        student = session.query(Student).filter(Student.id == identifiant).first()
        oldUserid = student.userId
        print(student.name)
        if student != None:
            student.userId=userId
            student.name=data['name']
            student.lastname=data['lastname']
            student.matricule=data['matricule']
            student.genre=data['genre']
            student.grade=data['grade']
            student.category=data['category']
            student.school=data['school']
            student.facebook=data['facebook']
            student.email=data['email']
            student.phone=data['phone']
            student.motivation=data['motivation']
            try :
                os.remove(os.getcwd()+'/assets/data/qrcode/'+oldUserid+'.png')
            except Exception :
                print('File  not found ') 
            self.generateQrCode(userId)
            session.commit()
        else:
            print("Not student found to modify")
        
    def getAllStudent(self):
        students = session.query(Student).order_by(Student.matricule).all()
        return self.loading(students)
        
             
    
    def seachStudent(self,key):
        students = session.query(Student).filter(or_(
            Student.name.contains(str(key)), 
            Student.lastname.contains(str(key)),
            Student.matricule.contains(str(key)),
            # Student.genre.contains(str(key)), 
            # Student.grade.contains(str(key)),
            # Student.school.contains(str(key)), 
            Student.email.contains(str(key)),
            Student.facebook.contains(str(key)),
            # Student.phone.contains(str(key)),
            )).all()
        return self.loading(students)
    
    def filterStudent(self,category,order,sens):
        if category == "All" :
            if sens == "Descendant" :
                students = session.query(Student).order_by(desc(text(order))).all()
            else :
                students = session.query(Student).order_by(text(order)).all()
        else :
            if sens == "Descendant" :
                students = session.query(Student).filter(Student.category == category).order_by(desc(text(order))).all()
            else :
                students = session.query(Student).filter(Student.category == category).order_by(text(order)).all()
        return self.loading(students)
    
    def generateQrCode(self,userId):
        qr = qrcode.QRCode(
            version =1,
            error_correction=qrcode.constants.ERROR_CORRECT_L,
            box_size=10,
            border=4
        )
        qr.add_data(userId)
        qr.make(fit=True)
        img = qr.make_image(fill_color="black",back_color="white")
        img.save(os.getcwd()+"/assets/data/qrcode/"+userId+".png")

class User(Base) :
    
    __tablename__ = 'users' 
    id  = Column(Integer,primary_key=True)
    profile = Column(Text)
    name = Column(Text)
    lastname = Column(Text)
    email = Column(Text)
    password = Column(Text)
    # allowed = Column(Integer)
    
    def __repr__(self):
        return 'User class'
    
    def toJson(self) :
        return json.dumps({
            'id':self.id,
            'profile' : self.profile,
            'name' : self.name,
            'lastname' : self.lastname,
            'email' : self.email,
            'password' : self.password
        })
    
class DatabaseUser(object) :
    
    def __init__(self):
        pass
    
    def addUser(self,data) :
        data = json.loads(data)
        hasher = SHA256.new()
        hasher.update(str(data['password']).encode())
        password =  hasher.hexdigest()
        extension = data["profile"].split('.')[-1]
        user = User(
            profile=password+'.'+extension,
            name=data['name'],
            lastname=data['lastname'],
            email=data['email'],
            password=password
        )
        shutil.copy(data['profile'][6:],'assets/data/profiles/'+password+'.'+extension)
        session.add(user)
        session.commit()
        print("Used added ")
        return user
    
    def login(self,data) :
        data = json.loads(data)
        print("login data :",data)
        email = data['user_email']
        hasher = hashlib.sha256()
        hasher.update(str(data['user_password']).encode())
        password =  hasher.hexdigest()
        user = session.query(User).filter(and_(User.email==email,User.password==password)).first()
        print(user)
        if user != None : return user 
        else : return None

            
        
Base.metadata.create_all(engine)