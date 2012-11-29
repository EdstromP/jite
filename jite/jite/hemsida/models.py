# -*- coding: utf-8 -*-
from django.db import models

class Innehall(models.Model):
    titel = models.CharField(max_length=50)
    url = models.CharField(max_length=50)
    rubrik = models.CharField(max_length=50)
    content = models.TextField()

    def __unicode__(self):
        return self.titel

    class Meta:
        verbose_name = "Innehåll"
        verbose_name_plural = "Innehåll"
