<?php

namespace App\Caches;

use App\Repos\Tag as TagRepo;

class Tag extends Cache
{

    protected $lifetime = 365 * 86400;

    public function getLifetime()
    {
        return $this->lifetime;
    }

    public function getKey($id = null)
    {
        return "tag:{$id}";
    }

    public function getContent($id = null)
    {
        $tagRepo = new TagRepo();

        $tag = $tagRepo->findById($id);

        return $tag ?: null;
    }

}
