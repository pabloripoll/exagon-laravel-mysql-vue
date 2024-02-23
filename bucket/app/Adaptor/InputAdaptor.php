<?php

namespace App\Adaptor;

use App\Http\Response;

class InputAdaptor
{
    public function httpWeb()
    {
        return (new Response)->json([__CLASS__ => __FUNCTION__]);
    }

    public function httpApiGet()
    {
        return (new Response)->json([__CLASS__ => __FUNCTION__]);
    }

    public function httpApiPost()
    {
        return (new Response)->json([__CLASS__ => __FUNCTION__]);
    }

    public function httpApiPut()
    {
        return (new Response)->json([__CLASS__ => __FUNCTION__]);
    }

    public function httpApiPatch()
    {
        return (new Response)->json([__CLASS__ => __FUNCTION__]);
    }

    public function httpApiDelete()
    {
        return (new Response)->json([__CLASS__ => __FUNCTION__]);
    }

    public function httpApiHead()
    {
        return (new Response)->json([__CLASS__ => __FUNCTION__]);
    }

    public function httpApiOptions()
    {
        return (new Response)->json([__CLASS__ => __FUNCTION__]);
    }
}
