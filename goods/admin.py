from django.contrib import admin
from django.core.cache import cache
from goods.models import GoodsSKU, GoodsType, Goods, IndexPromotionBanner, IndexGoodsBanner,  IndexTypeGoodsBanner

class BaseModelAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)
        from celery_tasks.tasks import generate_static_index_html
        print('发出重新生成静态首页的任务')
        generate_static_index_html.delay()
        cache.delete('index_page_data')

    def delete_model(self, request, obj):
        super().delete_model(request, obj)
        from celery_tasks.tasks import generate_static_index_html
        generate_static_index_html.delay()
        cache.delete('index_page_data')


class GoodsSKUAdmin(BaseModelAdmin):
    list_per_page = 10

class GoodsAdmin(BaseModelAdmin):
    list_per_page = 10
    list_display = ['id', 'name']

class GoodsTypeAdmin(BaseModelAdmin):
    list_per_page = 10
    list_display = ['id', 'name']

class IndexGoodsBannerAdmin(BaseModelAdmin):
    list_per_page = 10

class IndexTypeGoodsBannerAdmin(BaseModelAdmin):
    list_per_page = 10

class IndexPromotionBannerAdmin(BaseModelAdmin):
    list_per_page = 10

admin.site.register(GoodsSKU, GoodsSKUAdmin)
admin.site.register(GoodsType, GoodsTypeAdmin)
admin.site.register(IndexGoodsBanner, IndexGoodsBannerAdmin)
admin.site.register(IndexPromotionBanner, IndexPromotionBannerAdmin)
admin.site.register(IndexTypeGoodsBanner, IndexTypeGoodsBannerAdmin)
admin.site.register(Goods,GoodsAdmin)

