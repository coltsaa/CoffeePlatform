from django.db import models
from django.contrib.auth.models import AbstractUser
from db.base_model import BaseModel

class User(AbstractUser, BaseModel):

    class Meta:
        db_table = 'sk_user'
        verbose_name = '用户'
        verbose_name_plural = verbose_name


class AddressManager(models.Manager):

    def get_default_address(self, user):
        try:
            address = self.get(user=user, is_default=True)
        except self.model.DoesNotExist:
            address = None
        return address

    def get_all_address(self, user):
        try:
            have_address = self.filter(user=user)
        except self.model.DoesNotExist:
            have_address = None
        return have_address


class Address(BaseModel):
    user = models.ForeignKey('User', verbose_name='所属账户', on_delete=models.CASCADE)
    receiver = models.CharField(max_length=20, verbose_name='联系人')
    addr = models.CharField(max_length=256, verbose_name='联系地址')
    phone = models.CharField(max_length=11, verbose_name='联系电话')
    is_default = models.BooleanField(default=False, verbose_name='是否默认')

    objects = AddressManager()

    class Meta:
        db_table = 'sk_address'
        verbose_name = '地址'
        verbose_name_plural = verbose_name
