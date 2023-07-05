from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(user)
admin.site.register(venues)
admin.site.register(experts)
admin.site.register(todo)
admin.site.register(guests)