<?php

namespace App\Support;

class Random
{
    public static function randomIntNoCero($length) {
        $chars = '123456789';
        $token = '';
        for ($i = 0; $i < $length; $i++) {
            $rand = mt_rand(0, strlen($chars) - 1);
            $token .= substr($chars, $rand, 1);
        }

        return $token;
    }

    public static function randomInteger($length) {
        $chars = '1234567890';
        $token = '';
        for ($i = 0; $i < $length; $i++) {
            $rand = mt_rand(0, strlen($chars) - 1);
            $token .= substr($chars, $rand, 1);
        }

        return self::randomIntNoCero(1).substr($token, 1);
    }

}
