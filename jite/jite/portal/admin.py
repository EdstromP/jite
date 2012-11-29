# -*- coding: utf-8 -*-
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from jite.portal.models import * 

class AnstalldaAdmin(admin.ModelAdmin):
    list_display = ('namn', 'grupp')
    search_fields = ('namn',)

class ArbetsordrarAdmin(admin.ModelAdmin):
    #a = Arbetsordrar.objects.get()
    #kundnamn = a.avtal.kund.namn
    list_display = ('id', 'kund', 'anstalld', 'arbetsbeskrivning',)
    
    def kund(self, obj):
        return '%s' % (obj.avtal.kund.namn)
 
    kund.short_description = 'Kund'

class AvtalInline(admin.TabularInline):
    model = Avtal

class TjansterAdmin(admin.ModelAdmin):
    inlines = [AvtalInline,]
    list_display = ('tjanst', 'placering', 'riktpris',)

class UserProfileInLine(admin.StackedInline):
    model = UserProfile
    can_delete = False
    verbose_name = 'Profil'
    verbose_name_plural = 'Profil'

class UserAdmin(UserAdmin):
    inlines = (UserProfileInLine,)

admin.site.unregister(User)
admin.site.register(User, UserAdmin)

admin.site.register(Grupper)
admin.site.register(Kunder)
admin.site.register(Tjanster, TjansterAdmin)
admin.site.register(Anstallda, AnstalldaAdmin)
admin.site.register(Avtal)
admin.site.register(Arbetsordrar, ArbetsordrarAdmin)
admin.site.register(UserProfile)

