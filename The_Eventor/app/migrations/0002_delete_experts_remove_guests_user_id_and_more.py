# Generated by Django 4.1.7 on 2023-05-16 10:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.DeleteModel(
            name='experts',
        ),
        migrations.RemoveField(
            model_name='guests',
            name='user_id',
        ),
        migrations.RemoveField(
            model_name='todo',
            name='user_id',
        ),
        migrations.DeleteModel(
            name='venues',
        ),
        migrations.DeleteModel(
            name='guests',
        ),
        migrations.DeleteModel(
            name='todo',
        ),
        migrations.DeleteModel(
            name='user',
        ),
    ]
