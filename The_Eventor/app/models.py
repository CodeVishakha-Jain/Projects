from django.db import models
from datetime import date
# Create your models here.

class user(models.Model):
    username=models.CharField(max_length=50)
    email=models.EmailField(max_length=50)
    password=models.CharField(max_length=50)
    is_created=models.DateTimeField(auto_now_add=True)
    budget=models.IntegerField(default=10000)
    time=models.DateField(default=date.today)

class venues(models.Model):
    venue_pic=models.ImageField(upload_to="img/")
    venue_description=models.TextField()

class experts(models.Model):
    expert_name=models.CharField(max_length=50)
    expert_details=models.TextField()

class todo(models.Model):
    user_id=models.ForeignKey(user, on_delete=models.CASCADE)
    to_do=models.TextField()
    completed = models.BooleanField(default=False)

class guests(models.Model):
    user_id=models.ForeignKey(user, on_delete=models.CASCADE)
    guest_name=models.CharField(max_length=20)


