<?php

namespace App\Http;

class Response
{
    public function json(object | array $data = null, int $state = 200)
    {
        header('Content-Type: application/json; charset=utf-8');
        http_response_code($state);

        echo json_encode($data);
        exit;
    }
}
