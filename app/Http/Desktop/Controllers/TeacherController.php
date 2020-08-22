<?php

namespace App\Http\Desktop\Controllers;

use App\Services\Frontend\Teacher\TeacherList as TeacherListService;
use Phalcon\Mvc\View;

/**
 * @RoutePrefix("/teacher")
 */
class TeacherController extends Controller
{

    /**
     * @Get("/list", name="desktop.teacher.list")
     */
    public function listAction()
    {
        $this->seo->prependTitle('教师');
    }

    /**
     * @Get("/pager", name="desktop.teacher.pager")
     */
    public function pagerAction()
    {
        $service = new TeacherListService();

        $pager = $service->handle();

        $pager->target = 'teacher-list';

        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        $this->view->pick('teacher/pager');
        $this->view->setVar('pager', $pager);
    }

    /**
     * @Get("/{id:[0-9]+}", name="desktop.teacher.show")
     */
    public function showAction($id)
    {
        return $this->dispatcher->forward([
            'controller' => 'user',
            'action' => 'show',
            'params' => ['id' => $id],
        ]);
    }

}
