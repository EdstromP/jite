from django.conf.urls import patterns, include, url
#from jite.views import forstasida, root, tjanster, om_oss, exempel, kontakt
from django.views.generic import list_detail, ListView
from django.views.generic.simple import direct_to_template
from jite import settings
from jite.portal.models import Arbetsordrar
from jite.views import VisaAOListView, forstasida
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import login
from django.contrib.auth.models import User

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

#arbetsordrar_info = {
#        #'queryset': Arbetsordrar.objects.all(),
#        'queryset': Arbetsordrar.objects.filter(anstalld__namn='Carina Ferm'),
#        'template_name': 'arbetsordrar_lista.html',
#}

#class VisaAOListView(ListView):
#    template_name = 'arbetsordrar_lista.html'
#
#    def get_queryset(self):
#        return Arbetsordrar.objects.filter(anstalld = request.user)

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'jite.views.home', name='home'),
    # url(r'^jite/', include('jite.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
     url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    #('^$', root),
    ('^$', direct_to_template, {'template': 'index.html'}),
    (r'^forstasida/$', forstasida ),
    (r'^om-oss/$', direct_to_template, {'template': 'omoss.html'}),
    (r'^tjanster/$', direct_to_template, {'template': 'tjanster.html'}),
    (r'^kontakt/$', direct_to_template, {'template': 'kontakt.html'}),
    (r'^exempel/$', direct_to_template, {'template': 'exempel.html'}),
#    (r'^inloggad/$', login_required(list_detail.object_list), arbetsordrar_info),
    (r'^inloggad/$', login_required(VisaAOListView.as_view())),
    (r'^login/$', login),
)

if settings.DEBUG:
    urlpatterns += patterns('',
            ('^media/(?P<path>.*)$', 'django.views.static.serve',
                {'document_root': settings.MEDIA_ROOT}),
    )
