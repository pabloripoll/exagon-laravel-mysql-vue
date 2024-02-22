<?php

namespace App\Support;

class Client
{
    static $_instance;

    public static function Access()
    {
        return self::$_instance ?? new self;
    }

    public function Restricted()
    {
        return ! in_array($this->IP(), $this->ValidIP());
    }

    public function IP(): string
    {
        // Get real visitor IP behind CloudFlare network
        if (isset($_SERVER["HTTP_CF_CONNECTING_IP"])) {
            $_SERVER['REMOTE_ADDR'] = $_SERVER["HTTP_CF_CONNECTING_IP"];
            $_SERVER['HTTP_CLIENT_IP'] = $_SERVER["HTTP_CF_CONNECTING_IP"];
        }

        $client  = $_SERVER['HTTP_CLIENT_IP'] ?? '';
        $forward = $_SERVER['HTTP_X_FORWARDED_FOR'] ?? '';
        $remote  = $_SERVER['REMOTE_ADDR'] ?? '';

        if (filter_var($client, FILTER_VALIDATE_IP)) {
            $ip = $client;
        } elseif (filter_var($forward, FILTER_VALIDATE_IP)) {
            $ip = $forward;
        } else {
            $ip = $remote;
        }

        return $ip;
    }

    public function ValidIP(): array
    {
        return [
            '::1', // Local Machine
            '203.161.63.21', // Remote Server
            '83.49.38.107'
        ];
    }
}