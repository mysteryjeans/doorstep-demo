from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static


import doorsale.urls


urlpatterns = patterns('',
    url(r'^', include(doorsale.urls)),
)


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)