from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    id = models.AutoField(primary_key=True)
    nickname = models.CharField(max_length=32, blank=False, null=False, verbose_name='用户名')
    # gender = models.CharField(max_length=16, blank=False, null=False, default='填写性别', verbose_name='用户姓名')
    tel = models.CharField(max_length=11, blank=True, null=True, verbose_name='用户手机号')
    mail = models.EmailField(blank=True, null=True, verbose_name='用户邮箱')
    animation = models.ManyToManyField(to='Animation', verbose_name='喜欢的动漫')
    avatar = models.ForeignKey(
        to='Avatar',
        to_field='id',
        on_delete=models.SET_NULL,
        verbose_name='用户头像',
        null=True
    )
    max_score = models.IntegerField(null=False, blank=False, default=0, verbose_name='最高得分')
    chapter = models.IntegerField(default=0, null=False, blank=False, verbose_name='学习过的章节')

    def __str__(self):
        return self.nickname

    class Meta:
        verbose_name_plural = '用户'


class Avatar(models.Model):
    id = models.AutoField(primary_key=True)
    path = models.FileField(upload_to='user_avatar/', verbose_name='用户头像路径')

    def __str__(self):
        return self.path.url

    class Meta:
        verbose_name_plural = '用户头像'


class Animation(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=128, blank=False, null=False, verbose_name='动漫名称')
    abstract = models.CharField(max_length=256, blank=True, null=True, verbose_name='简介')
    score = models.FloatField(blank=True, null=True, verbose_name='评分')
    cover = models.CharField(max_length=256, null=True, blank=True, verbose_name='海报地址')
    reason = models.CharField(max_length=128, null=True, blank=True, verbose_name='推荐理由')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '动漫'


# class Character(models.Model):
#     id = models.AutoField(primary_key=True)


class Chapter(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField('章节名称', max_length=32, null=False, blank=False)
    character = models.JSONField('章节包含的字符', null=True)
    category = models.ForeignKey(to='ChaCategory', to_field='id', verbose_name='章节分类', on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '章节'


class ChaCategory(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField('章节所属的分类', max_length=32, null=False, blank=False)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = '章节所属的分类'
