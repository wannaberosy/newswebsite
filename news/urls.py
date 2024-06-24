from django.urls import re_path as url
from django.urls import path
from django.contrib import admin
from newswebsite.views import *
from django.conf import settings
from django.conf.urls.static import static

# 路由配置
urlpatterns = [
    url(r'^admin/', admin.site.urls),  # 管理员
    path('', index, name='index'),  # 网站主页
    url(r'^index/', index, name='index'),  # 网站主页
    url(r'^category/(?P<cate_id>\d+)/$', category, name='category'),  # 分类页
    url(r'^detail/(?P<article_id>\d+)/$', detail, name='detail'),  # 新闻详情页
    url(r'^login/', login, name='login'),  # 登录
    url(r'^register/', register, name='register'),  # 注册
    url(r'^logout/', logout, name='logout'),  # 退出登录
    url(r'^profile/', profile, name='profile'),  # 个人信息
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
