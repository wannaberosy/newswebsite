from django.contrib import admin
from newswebsite.models import *


class ArticleInfoAdmin(admin.ModelAdmin):
    # 列表中的列
    list_display = ['id', 'title', 'intro', 'abstract', 'content',
                    'publish_time', 'author_name', 'category']
    # 搜索框
    search_fields = ['id', 'title', 'author_name', 'category']


class CategoryInfoAdmin(admin.ModelAdmin):
    # 列表中的列
    list_display = ['id', 'name']
    # 搜索框
    search_fields = ['id', 'name']


class CommentInfoAdmin(admin.ModelAdmin):
    # 列表中的列
    list_display = ['id', 'belong_article', 'belong_user', 'words', 'created']
    # 搜索框
    search_fields = ['id', 'belong_article', 'belong_user', 'words']


# 注册模型到后台管理系统
admin.site.register(Article, ArticleInfoAdmin)
admin.site.register(Category, CategoryInfoAdmin)
admin.site.register(Best)
admin.site.register(UserProfile)

admin.site.register(Comment, CommentInfoAdmin)

# 站点名称
admin.site.site_header = 'CQUPT学生新闻发布系统后台管理系统'

# 网页标题
admin.site.site_title = 'CQUPT学生新闻发布系统后台管理系统'
