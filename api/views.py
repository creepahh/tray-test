from django.shortcuts import render

import requests
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import WeatherSerializer, EventSerializer

class WeatherView(APIView):
    def get(self, request, *args, **kwargs):
        city = request.query_params.get('city', 'London')
        api_key = 'YOUR_OPENWEATHERMAP_API_KEY'
        url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric'
        response = requests.get(url).json()
        data = {
            'city': city,
            'temperature': response['main']['temp'],
            'description': response['weather'][0]['description'],
        }
        serializer = WeatherSerializer(data)
        return Response(serializer.data)

class EventView(APIView):
    def get(self, request, *args, **kwargs):
        city = request.query_params.get('city', 'New York')
        api_key = 'YOUR_TICKETMASTER_API_KEY'
        url = f'https://app.ticketmaster.com/discovery/v2/events.json?city={city}&apikey={api_key}'
        response = requests.get(url).json()
        events = response['_embedded']['events']
        data = [{'event_name': event['name'], 'date': event['dates']['start']['dateTime'], 'location': event['venues'][0]['name']} for event in events]
        serializer = EventSerializer(data, many=True)
        return Response(serializer.data)

