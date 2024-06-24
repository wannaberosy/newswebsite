from django.contrib.auth import authenticate, login as user_login, logout as user_logout
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, redirect, HttpResponse

from newswebsite.forms import *
from newswebsite.models import *


# 01首页显示
def index(request):
    cates = Category.objects.all().order_by("-id")  # 分类列表

    # 取出一篇今日热闻作为大标题
    todaynew_big = Best.objects.filter(select_reason="今日热闻")[0].select_article

    # 取出三篇首页推荐（不足三篇取出所有）
    todaynew = Best.objects.filter(select_reason="首页推荐")
    if len(todaynew) > 3:
        todaynew = todaynew[:3]
    todaynew_top3 = [i.select_article for i in todaynew]

    # 取出三篇编辑推荐
    editor_recommendtop3 = Best.objects.filter(select_reason="小编推荐")
    if len(editor_recommendtop3) > 3:
        editor_recommendtop3 = editor_recommendtop3[:3]
    editor_recommendtop3list = [i.select_article for i in editor_recommendtop3]

    article_list = Article.objects.all().order_by("-publish_time")  # 取出所有文章
    pagerobot = Paginator(article_list, 3)  # 创建分页器，每页限定5篇文章
    page_num = request.GET.get("page", 1)  # 取到当前页数
    try:
        article_list = pagerobot.page(page_num)  # 返回当前页码下的文章
    except EmptyPage:
        article_list = pagerobot.page(pagerobot.num_pages)  # 如果不存在该页，返回最后一页
    except PageNotAnInteger:
        article_list = pagerobot.page(1)  # 如果页码不是一个整数，返回第一页

    # 封装参数送到前端
    context = {
        "cates": cates,  # 类别
        "todaynew_big": todaynew_big,  # 今日热闻
        "todaynew_top3": todaynew_top3,  # 首页推荐
        "editor_recommendtop3list": editor_recommendtop3list,  # 小编推荐
        "article_list": article_list
    }
    return render(request, 'index.html', context=context)


# 02按类别显示新闻
def category(request, cate_id):
    cates = Category.objects.all().order_by("-id")  # 分类列表

    editors = Best.objects.filter(select_reason="小编推荐")
    # 符合该分类的小编推荐
    editor_recommends = []
    for editor in editors:
        article = Article.objects.filter(id=editor.select_article_id, category_id=cate_id).first()
        print("article", article)
        if article is not None:
            editor_recommends.append(article)

    if len(editor_recommends) > 3:
        editor_recommendtop3list = editor_recommends[:3]
    else:
        editor_recommendtop3list = editor_recommends

    article_list = Article.objects.filter(category=int(cate_id)).order_by("-publish_time")  # 取出当前目录下的所有文章
    if len(article_list) == 0:
        context = {
            "cates": cates,  # 分类
            "message": "抱歉啦，该分类下暂无新闻内容！",  # 小编推荐
        }
        return render(request, 'category.html', context=context)
    print(article_list[0].category)
    pagerobot = Paginator(article_list, 5)  # 创建分页器，每页限定五篇文章
    page_num = request.GET.get("page", 1)  # 取到当前页数
    try:
        article_list = pagerobot.page(page_num)  # 一般情况下返回当前页码下的文章
    except EmptyPage:
        article_list = pagerobot.page(pagerobot.num_pages)  # 如果不存在该业，返回最后一页
    except PageNotAnInteger:
        article_list = pagerobot.page(1)  # 如果页码不是一个整数，返回第一页

    context = {
        "cates": cates,  # 分类
        "editor_recommendtop3list": editor_recommendtop3list,  # 小编推荐
        "article_list": article_list  # 分类下的所有文章
    }

    return render(request, 'category.html', context=context)


# 03新闻详情展示
def detail(request, article_id):
    cates = Category.objects.all().order_by("-id")  # 分类列表

    editors = Best.objects.filter(select_reason="小编推荐")

    # 符合该分类的小编推荐
    category_id = Article.objects.filter(id=article_id).first().category_id
    editor_recommends = []
    for editor in editors:
        article = Article.objects.filter(id=editor.select_article_id, category_id=category_id).first()
        if article is not None:
            editor_recommends.append(article)
    if len(editor_recommends) > 3:
        editor_recommendtop3list = editor_recommends[:3]
    else:
        editor_recommendtop3list = editor_recommends  # 取出三篇小编推荐

    article = Article.objects.get(id=article_id)

    # 获取该新闻的评论信息
    comments = Comment.objects.filter(belong_article=article)

    # 提交评论
    form = CommentForm()
    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            words = form.cleaned_data.get("comment")
            comment = Comment(belong_user=request.user, words=words, belong_article=Article.objects.get(id=article_id))
            comment.save()
            form = CommentForm()

    context = {
        "cates": cates,  # 分类
        "editor_recommendtop3list": editor_recommendtop3list,  # 小编推荐
        "article": article,  # 文章信息
        "comments": comments,  # 评论信息
        "form": form  # 表单
    }

    return render(request, 'detail.html', context=context)


# 04用户登录
def login(request):
    if request.method == 'GET':
        form = LoginForm()
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
            user = authenticate(username=username, password=password)
            if user:
                user_login(request, user)
                return redirect(to='index')
            else:
                return HttpResponse('用户名不存在或用户名密码错误')
    context = {'form': form}
    return render(request, 'login.html', context=context)


# 05用户注册
def register(request):
    if request.method == 'GET':
        form = RegisterForm()
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get("username")
            email = form.cleaned_data.get("email")
            password = form.cleaned_data.get("password")
            user = User(username=username, email=email)
            user.set_password(password)
            user.save()  # 创建用户保存
            userprofile = UserProfile(belong_to=user, avatar='avatar/avatar.png')  # 默认logo
            userprofile.save()  # 创建该用户的资料
            return redirect(to='login')

    context = {
        'form': form
    }
    return render(request, 'register.html', context=context)


# 06个人信息修改
@login_required(login_url='login')  # 装饰器 未登录则跳转到登录页面
def profile(request):
    if request.method == 'GET':
        form = EditForm(initial={'username': request.user.username, 'email': request.user.email})
    if request.method == 'POST':
        form = EditForm(request.POST, request.FILES)
        if form.is_valid():
            user = request.user
            email = form.cleaned_data.get("email")
            password = form.cleaned_data.get("password")
            avatar = form.cleaned_data.get("avatar")
            user.email = email
            if avatar:
                user_profile = UserProfile.objects.get(belong_to=user)
                user_profile.avatar = avatar
                # 如果有上传头像，替换用户的头像
                user_profile.save()
            user.set_password(password)
            user.save()
            return redirect(to='login')
    context = {'form': form}
    return render(request, 'profile.html', context=context)


# 07退出登录
def logout(request):
    request.session.clear()
    user_logout(request)
    return redirect(to='login')
