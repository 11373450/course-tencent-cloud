<?php

namespace App\Services\Logic\Course;

use App\Caches\CategoryTreeList as CategoryTreeListCache;
use App\Models\Category as CategoryModel;
use App\Services\Logic\Service as LogicService;

class CategoryList extends LogicService
{

    public function handle()
    {
        $cache = new CategoryTreeListCache();

        return $cache->get(CategoryModel::TYPE_COURSE);
    }

}
