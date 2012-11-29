# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Tjanster'
        db.create_table('portal_tjanster', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('tjanst', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('placering', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('riktpris', self.gf('django.db.models.fields.FloatField')(null=True, blank=True)),
        ))
        db.send_create_signal('portal', ['Tjanster'])

        # Adding model 'Avtal'
        db.create_table('portal_avtal', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('kund', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['portal.Kunder'])),
            ('tjanst', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['portal.Tjanster'])),
            ('periodicitet', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('grupp', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['portal.Grupper'])),
            ('regdatum', self.gf('django.db.models.fields.DateField')()),
            ('pris', self.gf('django.db.models.fields.FloatField')(null=True, blank=True)),
            ('status', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('veckodag', self.gf('django.db.models.fields.CharField')(max_length=10, null=True, blank=True)),
            ('kommentar', self.gf('django.db.models.fields.CharField')(max_length=300, null=True, blank=True)),
        ))
        db.send_create_signal('portal', ['Avtal'])

        # Adding model 'Grupper'
        db.create_table('portal_grupper', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('grupp', self.gf('django.db.models.fields.CharField')(max_length=50)),
        ))
        db.send_create_signal('portal', ['Grupper'])

        # Adding model 'Kunder'
        db.create_table('portal_kunder', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('namn', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('personnummer', self.gf('django.db.models.fields.CharField')(max_length=15, null=True, blank=True)),
            ('adress', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('regdatum', self.gf('django.db.models.fields.DateField')()),
        ))
        db.send_create_signal('portal', ['Kunder'])

        # Adding model 'Anstallda'
        db.create_table('portal_anstallda', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('namn', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('personnummer', self.gf('django.db.models.fields.CharField')(max_length=15, null=True, blank=True)),
            ('adress', self.gf('django.db.models.fields.CharField')(max_length=50, null=True, blank=True)),
            ('regdatum', self.gf('django.db.models.fields.DateField')()),
            ('grupp', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['portal.Grupper'])),
        ))
        db.send_create_signal('portal', ['Anstallda'])

        # Adding model 'Arbetsordrar'
        db.create_table('portal_arbetsordrar', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('arbetsbeskrivning', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('avtal', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['portal.Avtal'], null=True)),
            ('anstalld', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['portal.Anstallda'])),
            ('regdatum', self.gf('django.db.models.fields.DateField')()),
            ('klardatum', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('status', self.gf('django.db.models.fields.CharField')(default='AR', max_length=2)),
            ('rapporterad_tid', self.gf('django.db.models.fields.FloatField')(null=True, blank=True)),
            ('kommentar_utforare', self.gf('django.db.models.fields.CharField')(max_length=300, null=True, blank=True)),
            ('kommentar', self.gf('django.db.models.fields.CharField')(max_length=300, null=True, blank=True)),
        ))
        db.send_create_signal('portal', ['Arbetsordrar'])

        # Adding model 'UserProfile'
        db.create_table('portal_userprofile', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['auth.User'], unique=True)),
            ('anstalld', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['portal.Anstallda'], null=True)),
        ))
        db.send_create_signal('portal', ['UserProfile'])


    def backwards(self, orm):
        # Deleting model 'Tjanster'
        db.delete_table('portal_tjanster')

        # Deleting model 'Avtal'
        db.delete_table('portal_avtal')

        # Deleting model 'Grupper'
        db.delete_table('portal_grupper')

        # Deleting model 'Kunder'
        db.delete_table('portal_kunder')

        # Deleting model 'Anstallda'
        db.delete_table('portal_anstallda')

        # Deleting model 'Arbetsordrar'
        db.delete_table('portal_arbetsordrar')

        # Deleting model 'UserProfile'
        db.delete_table('portal_userprofile')


    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'content_type__model', 'codename')", 'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'portal.anstallda': {
            'Meta': {'object_name': 'Anstallda'},
            'adress': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'grupp': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['portal.Grupper']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'namn': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'personnummer': ('django.db.models.fields.CharField', [], {'max_length': '15', 'null': 'True', 'blank': 'True'}),
            'regdatum': ('django.db.models.fields.DateField', [], {})
        },
        'portal.arbetsordrar': {
            'Meta': {'object_name': 'Arbetsordrar'},
            'anstalld': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['portal.Anstallda']"}),
            'arbetsbeskrivning': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'avtal': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['portal.Avtal']", 'null': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'klardatum': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'kommentar': ('django.db.models.fields.CharField', [], {'max_length': '300', 'null': 'True', 'blank': 'True'}),
            'kommentar_utforare': ('django.db.models.fields.CharField', [], {'max_length': '300', 'null': 'True', 'blank': 'True'}),
            'rapporterad_tid': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'regdatum': ('django.db.models.fields.DateField', [], {}),
            'status': ('django.db.models.fields.CharField', [], {'default': "'AR'", 'max_length': '2'})
        },
        'portal.avtal': {
            'Meta': {'object_name': 'Avtal'},
            'grupp': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['portal.Grupper']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'kommentar': ('django.db.models.fields.CharField', [], {'max_length': '300', 'null': 'True', 'blank': 'True'}),
            'kund': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['portal.Kunder']"}),
            'periodicitet': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'pris': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'regdatum': ('django.db.models.fields.DateField', [], {}),
            'status': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'tjanst': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['portal.Tjanster']"}),
            'veckodag': ('django.db.models.fields.CharField', [], {'max_length': '10', 'null': 'True', 'blank': 'True'})
        },
        'portal.grupper': {
            'Meta': {'object_name': 'Grupper'},
            'grupp': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        'portal.kunder': {
            'Meta': {'object_name': 'Kunder'},
            'adress': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'namn': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'personnummer': ('django.db.models.fields.CharField', [], {'max_length': '15', 'null': 'True', 'blank': 'True'}),
            'regdatum': ('django.db.models.fields.DateField', [], {})
        },
        'portal.tjanster': {
            'Meta': {'object_name': 'Tjanster'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'placering': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'riktpris': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'tjanst': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'portal.userprofile': {
            'Meta': {'object_name': 'UserProfile'},
            'anstalld': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['portal.Anstallda']", 'null': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'user': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['auth.User']", 'unique': 'True'})
        }
    }

    complete_apps = ['portal']