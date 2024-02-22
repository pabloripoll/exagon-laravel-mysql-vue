<?php

namespace App;

class Response
{
    public function json(object | array $data = null, int $state = 200)
    {
        header('Content-Type: application/json; charset=utf-8');

        echo json_encode($data);
    }
}
