# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Innehall'
        db.create_table('hemsida_innehall', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('titel', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('url', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('rubrik', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('content', self.gf('django.db.models.fields.TextField')()),
        ))
        db.send_create_signal('hemsida', ['Innehall'])


    def backwards(self, orm):
        # Deleting model 'Innehall'
        db.delete_table('hemsida_innehall')


    models = {
        'hemsida.innehall': {
            'Meta': {'object_name': 'Innehall'},
            'content': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'rubrik': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'titel': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'url': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        }
    }

    complete_apps = ['hemsida']