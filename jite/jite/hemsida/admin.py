# -*- coding: utf-8 -*-
from django.contrib import admin
from jite.hemsida.models import * 

#class AnstalldaAdmin(admin.ModelAdmin):
#    list_display = ('namn', 'grupp')
#    search_fields = ('namn',)

#class ArbetsordrarAdmin(admin.ModelAdmin):
#    #a = Arbetsordrar.objects.get()
#    #kundnamn = a.avtal.kund.namn
#    list_display = ('id', 'kund', 'anstalld', 'arbetsbeskrivning',)
#    
#    def kund(self, obj):
#        return '%s' % (obj.avtal.kund.namn)
# 
#    kund.short_description = 'Kund'
#
#class AvtalInline(admin.TabularInline):
#    model = Avtal
#
#class TjansterAdmin(admin.ModelAdmin):
#    inlines = [AvtalInline,]
#    list_display = ('tjanst', 'placering', 'riktpris',)
#
#admin.site.register(Grupper)
#admin.site.register(Kunder)
#admin.site.register(Tjanster, TjansterAdmin)
#admin.site.register(Anstallda, AnstalldaAdmin)
#admin.site.register(Avtal)
#admin.site.register(Arbetsordrar, ArbetsordrarAdmin)

admin.site.register(Innehall)
