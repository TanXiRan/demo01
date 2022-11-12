from django.shortcuts import render
from django.http import JsonResponse


# Create your views here.
def get_user(request):
    return JsonResponse({'name': 'tanhong'})
