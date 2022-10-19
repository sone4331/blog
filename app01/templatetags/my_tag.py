from django import template

register = template.Library()


# @register.filter()
# def add1(item):
#     return int(item) + 1


@register.inclusion_tag('my_tag/headers.html')
def banner(menu_name):
    img_list = [
        "http://www.fengfengzhidao.com/media/site_bg/wallhaven-k75977.jpg",
        "/media/site_bg/1.jpg",
        # "/media/site_bg/2.jpg",
    ]
    return {"img_list": img_list}
