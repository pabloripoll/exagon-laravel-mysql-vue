<?php

namespace App\Http;

use App\Http\Request;

class Route
{
    protected function request()
    {
        return new Request;
    }

    protected function callback(array $function)
    {
        $class = new $function[0];
        $method = $function[1];

        return $class->$method();
    }

    public static function get(string | array $path, $function)
    {
        $request = (new self)->request();
        if ($request->method == 'get') {
            if ($path == $request->route) {
                if (is_array($function)) {
                    (new self)->callback($function);
                } else {
                    $function();
                }
            }
        }
    }

    public static function post(string | array $path, $function)
    {
        $request = (new self)->request();
        if ($request->method == 'post') {
            if ($path == $request->route) {
                if (is_array($function)) {
                    (new self)->callback($function);
                } else {
                    $function();
                }
            }
        }
    }

    public static function put(string | array $path, $function)
    {
        $request = (new self)->request();
        if ($request->method == 'put') {
            if ($path == $request->route) {
                if (is_array($function)) {
                    (new self)->callback($function);
                } else {
                    $function();
                }
            }
        }
    }

    public static function patch(string | array $path, $function)
    {
        $request = (new self)->request();
        if ($request->method == 'patch') {
            if ($path == $request->route) {
                if (is_array($function)) {
                    (new self)->callback($function);
                } else {
                    $function();
                }
            }
        }
    }

    public static function delete(string | array $path, $function)
    {
        $request = (new self)->request();
        if ($request->method == 'delete') {
            if ($path == $request->route) {
                if (is_array($function)) {
                    (new self)->callback($function);
                } else {
                    $function();
                }
            }
        }
    }

    public static function head(string | array $path, $function)
    {
        $request = (new self)->request();
        if ($request->method == 'head') {
            if ($path == $request->route) {
                if (is_array($function)) {
                    (new self)->callback($function);
                } else {
                    $function();
                }
            }
        }
    }

    public static function options(string | array $path, $function)
    {
        $request = (new self)->request();
        if ($request->method == 'options') {
            if ($path == $request->route) {
                if (is_array($function)) {
                    (new self)->callback($function);
                } else {
                    $function();
                }
            }
        }
    }

}
