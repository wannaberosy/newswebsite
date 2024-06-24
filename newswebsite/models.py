from django.db import models
from django.contrib.auth.models import User
from django.utils.timezone import now


# 分类表
class Category(models.Model):
    name = models.CharField(max_length=40, null=False, verbose_name="分类名")  # 分类名

    def __str__(self):
        return self.name

    # 修改显示的表的名字
    class Meta:
        # 给模型类起一个更可读的名字
        verbose_name = '新闻分类'
        # 模型的复数形式
        verbose_name_plural = '新闻分类信息表'
        # pass


# 文章表
class Article(models.Model):
    title = models.CharField(max_length=100, null=False, verbose_name="标题")  # 标题
    intro = models.CharField(max_length=1000, verbose_name="导语")  # 导语
    abstract = models.TextField(verbose_name="摘要")
    category = models.ForeignKey(Category, related_name="cate", on_delete=models.CASCADE,
                                 verbose_name="分类")  # 连接分类表的外键，多对一关系
    content = models.TextField(null=False, verbose_name="内容")  # 内容
    publish_time = models.DateTimeField(null=False, default=now, verbose_name="发布时间")  # 发布时间
    image = models.FileField(upload_to='article_image', verbose_name="图片")  # 文章配图
    author_name = models.CharField(max_length=100, null=False, verbose_name="作者")  # 作者名字
    author_avatar = models.FileField(upload_to='author_avatar', verbose_name="作者头像")  # 作者头像
    author_desc = models.CharField(max_length=100, null=False, verbose_name="作者签名")  # 作者签名

    def __str__(self):
        return self.title  # 在后台中以文章标题显示

    # 修改显示的表的名字
    class Meta:
        # 给模型类起一个更可读的名字
        verbose_name = '文章'
        # 模型的复数形式
        verbose_name_plural = '文章信息表'


# 精选文章
class Best(models.Model):
    select_article = models.ForeignKey(Article, related_name='select_article', on_delete=models.CASCADE,
                                       verbose_name="精选文章")  # 被精选的文章
    SELECT_REASON = (
        ('今日热闻', '今日热闻'),
        ('首页推荐', '首页推荐'),
        ('小编推荐', '小编推荐')
    )
    select_reason = models.CharField(choices=SELECT_REASON, max_length=50, null=False, verbose_name="推荐")  # 精选的理由

    def __str__(self):
        return self.select_article.category.name + '-' + self.select_reason + '-' + self.select_article.title

    # 修改显示的表的名字
    class Meta:
        # 给模型类起一个更可读的名字
        verbose_name = '精选文章'
        # 模型的复数形式
        verbose_name_plural = '精选文章信息表'


# 用户信息表
class UserProfile(models.Model):
    belong_to = models.OneToOneField(to=User, related_name="profile", on_delete=models.CASCADE,
                                     verbose_name="用户")  # 所属用户
    avatar = models.FileField(upload_to='avatar', verbose_name="用户头像")  # 用户头像

    def __str__(self):
        return self.belong_to.username

    # 修改显示的表的名字
    class Meta:
        # 给模型类起一个更可读的名字
        verbose_name = '用户'
        # 模型的复数形式
        verbose_name_plural = '用户信息表'


# 评论表
class Comment(models.Model):
    belong_article = models.ForeignKey(Article, related_name='article', on_delete=models.CASCADE,
                                       verbose_name="文章")  # 评论所属的文章
    belong_user = models.ForeignKey(User, related_name='user', on_delete=models.CASCADE, verbose_name="评论者")  # 评论者
    words = models.CharField(max_length=200, null=False, verbose_name="评论内容")  # 评论内容
    created = models.DateTimeField(null=False, default=now, verbose_name="评论时间")  # 评论时间

    def __str__(self):
        return self.belong_user.username + ': ' + self.words

    # 修改显示的表的名字
    class Meta:
        # 给模型类起一个更可读的名字
        verbose_name = '评论'
        # 模型的复数形式
        verbose_name_plural = '评论信息表'

# python manage.py makemigrations
# python manage.py migrate

# python manage.py createsuperuser