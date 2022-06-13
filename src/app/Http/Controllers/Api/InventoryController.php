<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Inventory;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class InventoryController extends Controller
{
    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'user_id' => 'required|exists:users,id',
                'item_id' => 'required|exists:items,id',
                'available_units' => 'required|integer'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $inventory = Inventory::updateOrCreate(
                [
                    'user_id' => $request->user_id,
                    'item_id' => $request->item_id
                ],
                [
                    'available_units' => DB::raw('available_units + '. $request->available_units)
                ]
            );

            return sendSuccessResponse('Inventory updated', $inventory);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to update dream");
        }
    }

    public function show()
    {
        try {
            $user_items = auth()->user()->items;
            return sendSuccessResponse('Fetched inevtory', $user_items);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch inventory");
        }
    }
}
