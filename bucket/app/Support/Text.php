<?php

namespace App\Support;

class Text
{
    public static function print()
    {
        return new self;
    }

    public function limitedWords($text, $limit)
    {
        $text   = strip_tags($text);
        $words  = explode(' ', strip_tags($text));
        $return = trim(implode(' ', array_slice($words, 0, $limit)));
        $return.= (strlen($return) < strlen($text) ? '...' : null);

        return $return;
    }

}
