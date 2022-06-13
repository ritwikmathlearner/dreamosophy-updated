<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Inventory;
use App\Models\Item;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class StoreController extends Controller
{
    public function index()
    {
        try {
            $items = Item::all();
            $data = [
                'items' => $items,
                'user_hoots' => getMetaValue('user_meta', ['user_id' => auth()->id(), 'meta_key' => 'hoots'])
            ];
            return sendSuccessResponse('Fetch items', [$data]);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to fetch store items");
        }
    }

    public function buy(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'user_id' => 'required|exists:users,id',
                'item_id' => 'required|exists:items,id',
                'units' => 'required|integer'
            ]);

            if ($validator->fails()) return sendFailResponse(Arr::flatten($validator->errors()->messages()));

            $hoots = (int) getMetaValue('user_meta', ['user_id' => auth()->id(), 'meta_key' => 'hoots']);

            $item = Item::find($request->item_id);

            $hootCost = isset($item->discounted_cost) ? $item->discounted_cost : $item->cost; 

            $updatedHoots = $hoots - $hootCost;

            if($updatedHoots < 0) return sendFailResponse("Do not have enough hoots", 400);

            saveMetaData('user_meta', ['user_id' => auth()->id(), 'meta_key' => 'hoots'], ['meta_value' => $updatedHoots]);
            
            Inventory::updateOrCreate(
                [
                    'user_id' => $request->user_id,
                    'item_id' => $request->item_id
                ],
                [
                    'available_units' => DB::raw('available_units + '. $request->units)
                ]
            );

            $data = [
                'items' => auth()->user()->items,
                'hoots' => $updatedHoots
            ];

            return sendSuccessResponse('Successfully bought item', [$data]);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse("Failed to buy item");
        }
    }
}
