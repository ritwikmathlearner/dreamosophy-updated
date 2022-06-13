<?php

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

function sendSuccessResponse($message, $data, $status_code = 200)
{
    $response = [
        "success" => true,
        "message" => $message,
        "data" => $data instanceof ResourceCollection || $data instanceof Collection || is_array($data) ? $data: [$data]
    ];
    return response($response, $status_code)->header('Content-Type', 'application/json');
}

function sendFailResponse($data, $status_code = 500)
{
    $response = [
        "success" => false,
        "error" => (array) $data
    ];
    return response($response, $status_code)->header('Content-Type', 'application/json');
}

function saveMetaData($table, $condition, $data)
{
    DB::table($table)->updateOrInsert(
        $condition,
        $data
    );
}

function getMetaValue($table, $condition)
{
    $query = DB::table($table)->where($condition)->first();
    if (empty($query)) return null;
    return $query->meta_value;
}

function getMetaValues($table, $condition)
{
    $metaCollection = DB::table($table)->where($condition)->get();
    $output = array();
    foreach($metaCollection as $data) {
        $output[$data->meta_key] = $data->meta_value;
    }
    return collect($output);
}

function deleteMetaValues($table, $condition)
{
    return DB::table($table)->where($condition)->delete();
}