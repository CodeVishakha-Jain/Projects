from django.shortcuts import render,redirect
from .models import *
# Create your views here.
# whenever  we have to call any view then we have to use name of that view which we have defined in 'app/urls.py' or url,but function name is not used.
############ USER SIDE #############
def homepage(request):
    return render(request,"app/homepage.html");

def registerpage(request):
    return render(request,"app/register.html");

def registeruser(request):
    email=request.POST['email']
    username=request.POST['username']
    passwd=request.POST['passwd']
    cpasswd=request.POST['cpasswd']
    user__=user.objects.filter(email=email)
    if user__:
        message="user already exists"
        return render(request,"app/login.html",{'key1':message})
    elif(passwd==cpasswd):
        newuser=user.objects.create(username=username,email=email,password=passwd)
        return render(request,"app/login.html")

def loginpage(request):
    return render(request,"app/login.html")

def loginuser(request):
    email=request.POST['email']
    password=request.POST['passwd']
    user__=user.objects.get(email=email)
    if user__:
        if user__.password==password:
            request.session['id']=user__.id
            request.session['user']=user__.username
            request.session['email']=user__.email
            request.session['user_password']=user__.password
            return redirect("homepage")
        else:
            message="password does not match"
            return render(request,"app/login.html",{'msg':message})
            
    else:
        message="User does not exists"
        return render(request,"app/register.html",{'msg':message})

def venuespage(request):
    user=request.session['user']
    if user:
        new_venues=venues.objects.all()
        return render(request,"app/venue.html",{'venues':new_venues});
    else:
        return render(request,"app/login.html");

def guestspage(request):
    user=request.session['user']
    if user:
        items = guests.objects.all()
        return render(request, "app/guest.html", {'items': items})
    else:
        return render(request,"app/login.html");

def add_guest(request):
    if request.method == 'POST':
        user_id=request.session['id']
        existing_user=user.objects.get(pk=user_id)
        guest = request.POST['Guest']
        item = guests(user_id=existing_user,guest_name=guest)
        item.save()
        return redirect("guestspage")

def delete_guests(request, pk):
    item = guests.objects.get(pk=pk)
    item.delete()
    return redirect("guestspage")

def budgetPlanner(request):
    user=request.session['user']
    if user:
        return render(request,"app/budget.html");
    else:
        return render(request,"app/login.html");

def budget_store(request):
    user_id=request.session['id']
    existing_user=user.objects.get(pk=user_id)
    if existing_user:
        existing_user.budget=int(request.POST['budget'])
        existing_user.save()
        url=f'/profile/{user_id}'
        return redirect(url)
    else:
        return render(request,"app/login.html");

def todo_list(request):
    user=request.session['user']
    if user:
        items = todo.objects.all()
        return render(request, "app/to_do.html", {'items': items})
    else:
        return render(request,"app/login.html");

def add_todo_item(request):
    if request.method == 'POST':
        user_id=request.session['id']
        existing_user=user.objects.get(pk=user_id)
        title = request.POST['title']
        item = todo(user_id=existing_user,to_do=title)
        item.save()
        return redirect("todo_list")

def complete_todo_item(request, pk):
    item = todo.objects.get(pk=pk)
    item.completed = True
    item.save()
    return redirect("todo_list")

def delete_todo_item(request, pk):
    item = todo.objects.get(pk=pk)
    item.delete()
    return redirect("todo_list")

def timeCalculator(request):
    user=request.session['user']
    if user:
        return render(request,"app/time.html");
    else:
        return render(request,"app/login.html");

def time_calculate(request):
    user_id=request.session['id']
    existing_user=user.objects.get(pk=user_id)
    if existing_user:
        existing_user.time=request.POST['date']
        existing_user.save()
        url=f'/profile/{user_id}'
        return redirect(url)
    else:
        return render(request,"app/login.html");

def expertspage(request):
    user=request.session['user']
    if user:
        new_experts=experts.objects.all()
        return render(request,"app/expert.html",{'experts':new_experts});
    else:
        return render(request,"app/login.html");

def profilepage(request,pk):
    new_user=user.objects.get(pk=pk)
    return render(request,"app/profile.html",{'user':new_user})

def userlogout(request):
    del request.session['user']
    del request.session['user_password']
    return redirect('loginpage')


############## ADMIN SIDE ###########
def adminLoginPage(request):
    return render(request,"app/admin/login.html")

def adminindexpage(request):
    # this logic is used not directly open the index page first we have to login and then redirect to the index page
    if 'admin' in request.session and 'password' in request.session: 
        return render(request,"app/admin/index.html")
    else:
        return redirect('adminloginpage')

def adminlogin(request):
    admin=request.POST['uname']
    password=request.POST['password']
    if admin=="admin" and password=="admin":
        request.session['admin']=admin
        request.session['password']=password
        return redirect('adminindex')
    else:
        message="user name and password does not match"
        return render(request,"app/admin/login.html",{'msg':message})

def adminuserlist(request):
    all_user=user.objects.all();
    return render(request,"app/admin/userlist.html",{'all_user':all_user})

def userdelete(request,pk):
    user__=user.objects.get(pk=pk)
    user__.delete()
    return redirect('adminuserlist')

# when we have to call a function in template we have to use url name,but when we have to call function in views,we have to use function name.

def venuelist(request):
    all_venues=venues.objects.all()
    return render(request,"app/admin/venue_display.html",{'key1':all_venues})

def venueinsert(request):
    return render(request,"app/admin/venue_form.html")

def venue_upload(request):
    id=request.POST['id']
    if id !='1000000':
        updated_venue=venues.objects.get(pk=id)
        venue_pic=request.FILES['image']
        venue_details=request.POST['venue_details']
        updated_venue.venue_pic=venue_pic
        updated_venue.venue_description=venue_details
        updated_venue.save()
        return redirect('venuelist')
    else:
        venue_pic=request.FILES['image']
        venue_details=request.POST['venue_details']
        venue_one=venues.objects.create(venue_pic=venue_pic,venue_description=venue_details)
        return redirect('venuelist')

def venue_update(request,pk):
    updating_venue=venues.objects.get(pk=pk)
    return render(request,"app/admin/venue_form.html",{'key1':updating_venue})


def venue_delete(request,pk):
    existing_venue=venues.objects.get(pk=pk)
    existing_venue.delete()
    return redirect('venuelist')

def expertlist(request):
    all_experts=experts.objects.all()
    return render(request,"app/admin/expert_display.html",{'key1':all_experts})

def expertinsert(request):
    return render(request,"app/admin/expert_form.html")

def expert_upload(request):
    id=request.POST['id']
    if id !='1000000':
        updated_expert=experts.objects.get(pk=id)
        expert_name=request.POST['expert_name']
        expert_details=request.POST['expert_details']
        updated_expert.expert_name=expert_name
        updated_expert.expert_details=expert_details
        updated_expert.save()
        return redirect('expertlist')
    else:
        expert_name=request.POST['expert_name']
        expert_details=request.POST['expert_details']
        expert_one=experts.objects.create(expert_name=expert_name,expert_details=expert_details)
        return redirect('expertlist')

def expert_update(request,pk):
    updating_expert=experts.objects.get(pk=pk)
    return render(request,"app/admin/expert_form.html",{'key1':updating_expert})

def expert_delete(request,pk):
    existing_expert=experts.objects.get(pk=pk)
    existing_expert.delete()
    return redirect('expertlist')
