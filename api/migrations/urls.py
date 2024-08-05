from django.urls import path
from .views import WeatherView, EventView

urlpatterns = [
    path('weather/', WeatherView.as_view(), name='weather'),
    path('events/', EventView.as_view(), name='events'),
]
