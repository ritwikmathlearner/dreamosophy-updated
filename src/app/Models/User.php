<?php

namespace App\Models;

use App\Notifications\SendOTP;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'email',
        'username',
        'password',
        'dob',
        'bio',
        'interest',
        'profile_pic',
        'likes',
        'dislikes'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function dreams()
    {
        return $this->hasMany(Dream::class);
    }

    public function items()
    {
        return $this->belongsToMany(Item::class, 'inventories')->withPivot('available_units');
    }

    public function sendOTP()
    {
        $otp = mt_rand(1000, 9999);

        saveMetaData(
            'user_meta',
            [
                'user_id' => $this->id,
                'meta_key' => 'otp'
            ],
            [
                'meta_value' => $otp
            ]
        );

        $this->notify(new SendOTP($otp));
    }

    public function metaValue($metaKey)
    {
        return getMetaValue('user_meta', ['user_id' => $this->id, 'meta_key' => $metaKey]);
    }
}
