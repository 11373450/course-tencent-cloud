{% if pager.total_pages > 0 %}
    <div class="im-user-list clearfix">
        <div class="layui-row layui-col-space20">
            {% for item in pager.items %}
                <div class="layui-col-md2">
                    <div class="user-card">
                        {% if item.type == 'course' %}
                            <span class="layui-badge layui-bg-green type">课</span>
                        {% elseif item.type == 'chat' %}
                            <span class="layui-badge layui-bg-blue type">聊</span>
                        {% endif %}
                        <div class="avatar">
                            <a href="javascript:">
                                <img src="{{ item.avatar }}" alt="{{ item.name }}" title="{{ item.about }}">
                            </a>
                        </div>
                        <div class="name layui-elip" title="{{ item.name }}">{{ item.name }}</div>
                        <div class="action">
                            <span class="layui-badge-rim apply-group" data-id="{{ item.id }}" data-name="{{ item.name }}" data-avatar="{{ item.avatar }}">申请加入</span>
                        </div>
                    </div>
                </div>
            {% endfor %}
        </div>
    </div>
    {{ partial('partials/pager_ajax') }}
{% endif %}