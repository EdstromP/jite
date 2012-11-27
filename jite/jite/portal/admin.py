# -*- coding: utf-8 -*-
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from jite.portal.models import * 

class AnstalldaAdmin(admin.ModelAdmin):
    def get_grupp(self):
        values = ", " . join ([x.__str__() for x in self.grupp.all()])
        return values

    list_display = ('namn', get_grupp)
    search_fields = ('namn',)
    get_grupp.short_description = 'Grupp'

class GrupperInline(admin.TabularInline):
    model = Anstallda.grupp.through
    verbose_name = 'Anställda'
    verbose_name_plural = 'Anställda'

class GrupperAdmin(admin.ModelAdmin):
    def get_anstalld(self):
        values = ", " . join ([x.__str__() for x in self.anstallda_set.all()])
        return values

    list_display = ('grupp', get_anstalld)
    get_anstalld.short_description = 'Anställd'
    inlines = [GrupperInline,]

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
#    inlines = [AvtalInline,]
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

admin.site.register(Grupper, GrupperAdmin)
admin.site.register(Kunder)
admin.site.register(Tjanster, TjansterAdmin)
admin.site.register(Anstallda, AnstalldaAdmin)
admin.site.register(Avtal)
admin.site.register(Arbetsordrar, ArbetsordrarAdmin)
admin.site.register(UserProfile)

