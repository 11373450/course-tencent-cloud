{% extends 'templates/main.volt' %}

{% block content %}

    {{ partial('macros/course') }}
    {{ partial('macros/user') }}

    {% set full_user_url = full_url({'for':'home.user.show','id':user.id}) %}
    {% set qrcode_url = url({'for':'home.qrcode'},{'text':full_user_url}) %}
    {% set user.area = user.area ? user.area : '火星' %}
    {% set user.about = user.about ? user.about : '这个家伙很懒，什么都没留下！' %}
    {% set avatar_class = user.vip == 1 ? 'avatar vip' : 'avatar' %}

    <div class="breadcrumb">
        <span class="layui-breadcrumb">
            <a href="/">首页</a>
            <a><cite>个人主页</cite></a>
            <a><cite>{{ user.name }}</cite></a>
        </span>
        <span class="share">
            <a href="javascript:" title="添加好友" class="apply-friend" data-id="{{ user.id }}" data-name="{{ user.name }}" data-avatar="{{ user.avatar }}"><i class="layui-icon layui-icon-user"></i></a>
            <a href="javascript:" title="分享到微信"><i class="layui-icon layui-icon-login-wechat icon-wechat"></i></a>
            <a href="javascript:" title="分享到QQ空间"><i class="layui-icon layui-icon-login-qq icon-qq"></i></a>
            <a href="javascript:" title="分享到微博"><i class="layui-icon layui-icon-login-weibo icon-weibo"></i></a>
        </span>
    </div>

    <div class="user-profile wrap clearfix">
        <div class="{{ avatar_class }}">
            <img src="{{ user.avatar }}!avatar_160" alt="{{ user.name }}">
        </div>
        <div class="info">
            <p><span class="name">{{ user.name }}</span><span>{{ gender_icon(user.gender) }}</span></p>
            <p><span><i class="layui-icon layui-icon-location"></i></span><span>{{ user.area }}</span></p>
            <p><span><i class="layui-icon layui-icon-time"></i></span><span>{{ date('Y-m-d H:i',user.active_time) }}</span></p>
        </div>
        <div class="about">{{ user.about }}</div>
    </div>

    {% set show_tab_courses = user.course_count > 0 %}
    {% set show_tab_articles = user.article_count > 0 %}
    {% set show_tab_friends = user.friend_count > 0 %}
    {% set show_tab_groups = user.group_count > 0 %}

    {% set courses_url = url({'for':'home.user.courses','id':user.id}) %}
    {% set articles_url = url({'for':'home.user.articles','id':user.id}) %}
    {% set friends_url = url({'for':'home.user.friends','id':user.id}) %}
    {% set groups_url = url({'for':'home.user.groups','id':user.id}) %}

    <div class="tab-wrap">
        <div class="layui-tab layui-tab-brief user-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">课程</li>
                {% if show_tab_articles %}
                    <li>文章</li>
                {% endif %}
                {% if show_tab_friends %}
                    <li>好友</li>
                {% endif %}
                {% if show_tab_groups %}
                    <li>群组</li>
                {% endif %}
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show" id="tab-courses" data-url="{{ courses_url }}"></div>
                {% if show_tab_articles %}
                    <div class="layui-tab-item" id="tab-articles" data-url="{{ articles_url }}"></div>
                {% endif %}
                {% if show_tab_friends %}
                    <div class="layui-tab-item" id="tab-friends" data-url="{{ friends_url }}"></div>
                {% endif %}
                {% if show_tab_groups %}
                    <div class="layui-tab-item" id="tab-groups" data-url="{{ groups_url }}"></div>
                {% endif %}
            </div>
        </div>
    </div>

    <div class="layui-hide">
        <input type="hidden" name="share.title" value="{{ user.name }}">
        <input type="hidden" name="share.pic" value="{{ user.avatar }}">
        <input type="hidden" name="share.url" value="{{ full_user_url }}">
        <input type="hidden" name="share.qrcode" value="{{ qrcode_url }}">
    </div>

{% endblock %}

{% block include_js %}

    {{ js_include('home/js/user.show.js') }}
    {{ js_include('home/js/user.share.js') }}
    {{ js_include('home/js/im.apply.js') }}

{% endblock %}