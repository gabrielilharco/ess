from django.db import models

class Country(models.Model):
	key = models.CharField(null=False, blank=False, max_length=5)
	name = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'ees_country'

class Language(models.Model):
	key = models.CharField(null=False, blank=False, max_length=5)
	name = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'ees_language'

class Occupation(models.Model):
	key = models.IntegerField(null=False, blank=False)
	name = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'ees_occupation'

class Industry(models.Model):
	key = models.IntegerField(null=False, blank=False)
	name = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'ees_industry'

class Ancestry(models.Model):
	key = models.IntegerField(null=False, blank=False)
	name = models.CharField(null=False, blank=False, max_length=100)
	
	class Meta:
		db_table = 'ees_ancestry'