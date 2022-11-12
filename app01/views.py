from django.shortcuts import render
from django.http import JsonResponse


def index(request):
    name = 'hhh'
    # return JsonResponse(request, locals())
    return JsonResponse({'name': 'hhh'})