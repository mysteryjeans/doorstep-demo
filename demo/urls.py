from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'doorsale_site.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    # url(r'^grappelli/', include('grappelli.urls')),  # grappelli URLS
    url(r'^admin/', include(admin.site.urls)),
)

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


############################################
# Doorsale urls containing urls for all apps
urlpatterns += patterns('',
                        url(r'^', include('doorsale.urls')),
)

################### OR #####################
# You adjust each app urls according to your preferences
# urlpatterns += patterns('',
#     # Doorsale apps urls
#     url(r'^', include('doorsale.catalog.urls')),
#     url(r'^accounts/', include('doorsale.accounts.urls')),
#     url(r'^sales/', include('doorsale.sales.urls')),
#     url(r'^payments/', include('doorsale.payments.urls')),
#     url(r'^pages/', include('doorsale.pages.urls'))
# )
