from django.contrib import admin
from django.urls import path,include
from .views import *;
urlpatterns = [
    ########## USER SIDE ############
    path("",homepage,name="homepage"),
    path("registerpage/",registerpage,name="registerpage"),
    path("register/",registeruser,name="register"),
    path("loginpage/",loginpage,name="loginpage"),
    path("login/",loginuser,name="login"),
    path("venuespage/",venuespage,name="venuespage"),
    path("guests/",guestspage,name="guestspage"),
    path("add_guests/",add_guest,name="add_guest"),
    path("delete_guests/<int:pk>",delete_guests,name="delete_guests"),
    path("budget/",budgetPlanner,name="budget"),
    path("budgetstore/",budget_store,name="budgetstore"),
    path("time/",timeCalculator,name="time"),
    path("timecalculate/",time_calculate,name="timecalculate"),
    path("expert/",expertspage,name="expert"),
    path("to_do/",todo_list,name="todo_list"),
    path("add_to_do/",add_todo_item,name="add_to_do"),
    path("complete_to_do/",complete_todo_item,name="complete_to_do"),
    path("delete_to_do/<int:pk>",delete_todo_item,name="delete_to_do"),
    path("profile/<int:pk>",profilepage,name="profilepage"),
    path("logout/",userlogout,name="userlogout"),



    ########## ADMIN SIDE #############
    path("adminloginpage/",adminLoginPage,name="adminloginpage"),
    path("adminindex/",adminindexpage,name="adminindex"),
    path("adminlogin/",adminlogin,name="adminlogin"),
    path("adminuserlist/",adminuserlist,name="adminuserlist"),
    path("userdelete/<int:pk>",userdelete,name="userdelete"),
    path("venuelist/",venuelist,name="venuelist"),
    path("venueinsert/",venueinsert,name="venueinsert"),
    path("venueupload/",venue_upload,name="venue_upload"),
    path("venueupdate/<int:pk>",venue_update,name="venue_update"),
    path("venuedelete/<int:pk>",venue_delete,name="venue_delete"),
    path("expertlist/",expertlist,name="expertlist"),
    path("expertinsert/",expertinsert,name="expertinsert"),
    path("expertupload/",expert_upload,name="expert_upload"),
    path("expertupdate/<int:pk>",expert_update,name="expert_update"),
    path("expertdelete/<int:pk>",expert_delete,name="expert_delete"),
]