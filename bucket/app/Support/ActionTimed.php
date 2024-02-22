<?php

namespace App\Support;

class ActionTimed
{

    /**
     *
     */
    public static function lastAction($stamp, $minutesCount = 5)
    {
        $currentDateTime = date('Y-m-d H:i:s');
        $time = new \DateTime($stamp);
        $time->add(new \DateInterval('PT'.$minutesCount.'M'));
        $stampUpdated = $time->format('Y-m-d H:i:s');

        return strtotime($currentDateTime) > strtotime($stampUpdated) ? true : false;
    }
}
