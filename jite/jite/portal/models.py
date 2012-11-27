# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save

# Create your models here.

AO_STATUSALT = (
        ('AR', 'Arbetsbegäran'),
        ('UT', 'Utskriven'),
        ('EJ', 'Ej klar'),
        ('OK', 'Klar'),
)

class Grupper(models.Model):
    grupp = models.CharField(max_length=50)

    def __unicode__(self):
        return self.grupp

    class Meta:
        verbose_name = "Grupp"
        verbose_name_plural = "Grupper"

class Kunder(models.Model):
    namn = models.CharField(max_length=50)
    personnummer = models.CharField(max_length=15, blank=True, null=True)
    adress = models.CharField(max_length=50)
    regdatum = models.DateField()

    def __unicode__(self):
        return self.namn

    class Meta:
        verbose_name = "Kund"
        verbose_name_plural = "Kunder"

class Tjanster(models.Model):
    tjanst = models.CharField(max_length=50)
    placering = models.CharField(max_length=50)
    riktpris = models.FloatField(blank=True, null=True)

    def __unicode__(self):
        return self.tjanst

    class Meta:
        verbose_name = "Tjänst"
        verbose_name_plural = "Tjänster"

class Anstallda(models.Model):
    namn = models.CharField(max_length=50)
    personnummer = models.CharField(max_length=15, blank=True, null=True)
    adress = models.CharField(max_length=50, blank=True, null=True)
    regdatum = models.DateField()
    grupp = models.ManyToManyField(Grupper)

    def __unicode__(self):
        return self.namn

    class Meta:
        verbose_name = "Anställda"
        verbose_name_plural = "Anställda"

class Avtal(models.Model):
    kund = models.ForeignKey(Kunder)
    tjanst = models.ForeignKey(Tjanster)
    periodicitet = models.CharField(max_length=50)
    grupp = models.ForeignKey(Grupper)
    regdatum = models.DateField()
    pris = models.FloatField(blank=True, null=True)
    status = models.CharField(max_length=50)
    veckodag = models.CharField(max_length=10, blank=True, null=True)
    kommentar = models.CharField(max_length=300, blank=True, null=True)

    def __unicode__(self):
        return u'%s: %s' % (self.kund, self.tjanst)

    class Meta:
        verbose_name = "Avtal"
        verbose_name_plural = "Avtal"

#class Arbetsordrar_status(modesl.Model):
#    status = models.CharField(max_length=20)
#    
#    def __unicode__(self):
#        return self.status

class Arbetsordrar(models.Model):
    arbetsbeskrivning = models.CharField(max_length=50)
    #tjanst = models.ForeignKey(Tjanster)
    avtal = models.ForeignKey(Avtal, null=True)
    anstalld = models.ForeignKey(Anstallda)
    regdatum = models.DateField()
    klardatum = models.DateField(blank=True, null=True)
    #status = models.ForeignKey(Arbetsordrar_status, null=True)
    status = models.CharField(max_length=2, choices=AO_STATUSALT, default='AR')
    rapporterad_tid = models.FloatField(blank=True, null=True)
    kommentar_utforare = models.CharField(max_length=300, blank=True, null=True)
    kommentar = models.CharField(max_length=300, blank=True, null=True)

    def __unicode__(self):
        return u'%s: %s' % (self.arbetsbeskrivning, self.anstalld)

    class Meta:
        verbose_name = "Arbetsorder"
        verbose_name_plural = "Arbetsordrar"

class UserProfile(models.Model):
    user = models.OneToOneField(User)
    anstalld = models.OneToOneField(Anstallda, null=True, blank=True)
    testfalt = models.CharField(max_length=50, null=True, blank=True)

    def __unicode__(self):
        return u'%s: %s' % (self.user, self.anstalld)

    class Meta:
        verbose_name = "Användarprofil"
        verbose_name_plural = "Användarprofiler"

def create_user_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.get_or_create(user=instance)

post_save.connect(create_user_profile, sender=User)
