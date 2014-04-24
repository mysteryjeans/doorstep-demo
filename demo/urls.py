from django.conf.urls import patterns, include, url
from django.contrib import admin

import doorsale.catalog.urls

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'demo.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^', include(doorsale.catalog.urls)),
    url(r'^admin/', include(admin.site.urls)),
)
