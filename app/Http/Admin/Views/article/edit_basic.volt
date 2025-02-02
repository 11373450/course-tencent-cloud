{% set source_url_display = article.source_type == 1 ? 'display:none' : 'display:block' %}

<form class="layui-form kg-form" method="POST" action="{{ url({'for':'admin.article.update','id':article.id}) }}">
    <div class="layui-form-item">
        <label class="layui-form-label">封面</label>
        <div class="layui-input-inline">
            <img id="img-cover" class="kg-cover" src="{{ article.cover }}">
            <input type="hidden" name="cover" value="{{ article.cover }}">
        </div>
        <div class="layui-input-inline" style="padding-top:35px;">
            <button id="change-cover" class="layui-btn layui-btn-sm" type="button">更换</button>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input class="layui-input" type="text" name="title" value="{{ article.title }}" lay-verify="required">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类</label>
        <div class="layui-input-block">
            <select name="category_id" lay-verify="required">
                <option value="">请选择</option>
                {% for item in categories %}
                    <option value="{{ item.id }}" {% if article.category_id == item.id %}selected="selected"{% endif %}>{{ item.name }}</option>
                {% endfor %}
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标签</label>
        <div class="layui-input-block">
            <div id="xm-tag-ids"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">来源类型</label>
        <div class="layui-input-block">
            {% for value,title in source_types %}
                <input type="radio" name="source_type" value="{{ value }}" title="{{ title }}" {% if article.source_type == value %}checked="checked"{% endif %} lay-filter="source_type">
            {% endfor %}
        </div>
    </div>
    <div id="source-url-block" style="{{ source_url_display }}">
        <div class="layui-form-item">
            <label class="layui-form-label">来源网址</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="source_url" value="{{ article.source_url }}">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">允许评论</label>
        <div class="layui-input-block">
            <input type="radio" name="allow_comment" value="1" title="是" {% if article.allow_comment == 1 %}checked="checked"{% endif %}>
            <input type="radio" name="allow_comment" value="0" title="否" {% if article.allow_comment == 0 %}checked="checked"{% endif %}>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <button class="layui-btn kg-submit" lay-submit="true" lay-filter="go">提交</button>
            <button type="button" class="kg-back layui-btn layui-btn-primary">返回</button>
        </div>
    </div>
</form>