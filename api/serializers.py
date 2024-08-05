from rest_framework import serializers

class WeatherSerializer(serializers.Serializer):
    city = serializers.CharField(max_length=100)
    temperature = serializers.FloatField()
    description = serializers.CharField(max_length=200)

class EventSerializer(serializers.Serializer):
    event_name = serializers.CharField(max_length=200)
    date = serializers.DateTimeField()
    location = serializers.CharField(max_length=200)
