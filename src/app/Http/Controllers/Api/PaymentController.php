<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PaymentController extends Controller
{
    private function round_up($value, $precision)
    {
        $pow = pow(10, $precision);
        return (ceil($pow * $value) + ceil($pow * $value - ceil($pow * $value))) / $pow;
    }

    public function make(Request $request, User $user, $hoots)
    {
        $currentStatus = getMetaValue('user_meta', ['user_id' => $user->id, 'meta_key' => 'banned']);
        if (!empty($currentStatus)) {
            abort(403);
        }
        $hoots = (int) $hoots;
        $amount = 0;

        if ($hoots == 1000) {
            $amount = 25.99;
        } elseif ($hoots == 3000) {
            $amount = 50.99;
        } elseif ($hoots === 5000) {
            $amount = 75.99;
        } elseif ($hoots == 10000) {
            $amount = 100.99;
        } else {
            $amount = $this->round_up(($hoots * 1.99) / 100, 2);
        }

        return view('payment', ['user' => $user->id, 'amount' => $amount, 'hoots' => $hoots]);
    }

    public function store(Request $request)
    {
        try {
            [
                'paypal_id' => $paypalId,
                'intent' => $intent,
                'status' => $status,
                'amount' => $amount,
                'currency_code' => $currencyCode,
                'payment_on' => $paymentOn,
                'payer_name' => $payerName,
                'payer_email' => $payerEmail,
                'payer_country_code' => $payerCountryCode,
                'user_id' => $userId,
                'hoots' => $adjustHootsBy
            ] = $request->all();
            $payment = Payment::create([
                'paypal_id' => $paypalId,
                'intent' => $intent,
                'status' => $status,
                'amount' => $amount,
                'currency_code' => $currencyCode,
                'payment_on' => Carbon::parse($paymentOn),
                'payer_name' => $payerName,
                'payer_email' => $payerEmail,
                'payer_country_code' => $payerCountryCode,
                'user_id' => $userId
            ]);

            $hoots = (int) getMetaValue('user_meta', ['user_id' => $userId, 'meta_key' => 'hoots']) ?? 0;

            $newHoots = $hoots + $adjustHootsBy;

            saveMetaData('user_meta', ['user_id' => $userId, 'meta_key' => 'hoots'], ['meta_value' => $newHoots]);

            return sendSuccessResponse("Payment successful", $payment);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return sendFailResponse($e->getMessage());
        }
    }
}
