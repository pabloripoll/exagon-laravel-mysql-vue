<?php

namespace App\Http;

class Request
{
    public $host;
    public $method;
    public $route;
    public $route_parsed;

    public function __construct()
    {
        $this->host = $this->host();
        $this->method = $this->method();
        $this->route = $this->route();
        $this->route_parsed = $this->routeParsed();
    }

    protected function server()
    {
        return $_SERVER;
    }

    protected function input()
    {
        return file_get_contents('php://input');
    }

    protected function host($use_forwarded_host = false): object
    {
        $server = $this->server();
        $ssl  = (! empty($server['HTTPS'] ) && $server['HTTPS'] == 'on');
        $prot = strtolower($server['SERVER_PROTOCOL']);
        $prot = substr($prot, 0, strpos( $prot, '/')).(($ssl) ? 's' : '');
        $port = $server['SERVER_PORT'];
        $port = ((! $ssl && $port=='80') || ($ssl && $port=='443' ) ) ? '' : ':'.$port;
        $host = ($use_forwarded_host && isset($server['HTTP_X_FORWARDED_HOST'])) ? $server['HTTP_X_FORWARDED_HOST'] : (! isset($server['HTTP_HOST'] ) ? : $server['HTTP_HOST']);
        $host = isset($host) ? $host : $server['SERVER_NAME'].$port;

        return (object) [
            'protocol' => $prot,
            'domain' => $host,
            'port' => $server['SERVER_PORT']
        ];
    }

    protected function method(): string
    {
        return strtolower($this->server()['REQUEST_METHOD']);
    }

    protected function route(): string
    {
        return $this->server()['REQUEST_URI'];
    }

    protected function routeParsed(): object
    {
        $uri = [];
        foreach (explode('/', $this->server()['REQUEST_URI']) as $key => $value) {
            if ($value == '') {
                continue;
            }

            $uri[] = $value;
        }

        return (object) $uri;
    }

}
