#coding:utf-8
from __future__ import unicode_literals

from django.db import models

# Create your models here.
"""
类名代表了数据库表名，且继承了models.Model，类里面的字段代表数据表中的字段(name)，数据类型则由CharField（相当于varchar）
、DateField（相当于datetime）， max_length 参数限定长度。
"""
class Test(models.Model):
    name = models.CharField(max_length=20)