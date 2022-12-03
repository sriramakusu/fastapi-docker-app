# project/app/models/tortoise.py

from tortoise import fields, models
# from tortoise.models import Model
# from tortoise import fields

class TextSummary(models.Model):
    url = fields.TextField()
    summary = fields.TextField()
    created_at = fields.DatetimeField(auto_now_add=True)
    
    def __str__(self):
        return self.url