{% if course.teachers %}
    <div class="layui-card">
        <div class="layui-card-header">授课教师</div>
        <div class="layui-card-body">
            {% for teacher in course.teachers %}
                {% set teacher_url = url({'for':'web.user.show','id':teacher.id}) %}
                {% set teacher.title = teacher.title ? teacher.title : '小小教书匠' %}
                <div class="sidebar-teacher-card clearfix">
                    <div class="avatar">
                        <img src="{{ teacher.avatar }}" alt="{{ teacher.name }}" title="{{ teacher.about }}">
                    </div>
                    <div class="info">
                        <div class="name layui-elip">
                            <a href="{{ teacher_url }}">{{ teacher.name }}</a>
                        </div>
                        <div class="title layui-elip">{{ teacher.title }}</div>
                    </div>
                </div>
            {% endfor %}
        </div>
    </div>
{% endif %}