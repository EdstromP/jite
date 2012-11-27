# -*- coding: utf-8 -*-
from django.template.loader import get_template
from django.template import Context
from django.shortcuts import render_to_response
from django.http import HttpResponse, Http404
from django.views.generic import ListView
from django.contrib.auth.decorators import login_required
from jite.portal.models import Arbetsordrar
import datetime

def root(request):
    return render_to_response('index.html',)

def forstasida(request):
    return render_to_response('forstasida.html', {'inloggad':request.user.get_profile()})

def om_oss(request):
    return render_to_response('omoss.html',)

def tjanster(request):
    return render_to_response('tjanster.html',)

def kontakt(request):
    return render_to_response('kontakt.html',)

def exempel(request):
    return render_to_response('exempel.html',)

class VisaAOListView(ListView):
    template_name = 'arbetsordrar_lista.html'

    def get_context_data(self, **kwargs):
       context = super(VisaAOListView, self).get_context_data(**kwargs)
       context['test'] = self.request.user
       return context

    def get_queryset(self):
        #return Arbetsordrar.objects.filter(anstalld = self.request.user.id)
        return Arbetsordrar.objects.filter(anstalld = self.request.user.userprofile.anstalld)
