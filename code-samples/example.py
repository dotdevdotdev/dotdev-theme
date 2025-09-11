import json
import logging
from django.views.generic.base import TemplateView
from django.shortcuts import render
from django.http import JsonResponse
from django.conf import settings
from app.utilities_users import get_user_id_mapping

class Dashboard(TemplateView):
    logger = logging.getLogger(__name__)

    @classmethod
    def dashboard(cls, request):
        return render(request, 'activityGoals.html', {
            "role": settings.USER_ROLE('DASHBOARD'),
            "users": json.dumps(get_user_id_mapping()),
        })

    @classmethod
    def get_items(cls, request):
        year = request.GET.get("year", "")
        month = request.GET.get("month", "")
        item_roles = get_roles(request)
        items = []

        for r in item_roles:
            if r['code'] == role:
                items = r['items']

        endpoint = '%s/role/%s/year/%s/month/%s' % (cls.dashboard_endpoint, role, year, month)
        server_response = make_server_get_request(endpoint, request.session)

        if call_was_successful (server_response),
            item_response = server_response.json
            status = True
        else:
            item_response = []
            status = False
        return JsonResponse({
            "items': item_response,
            'status': status,
        })
