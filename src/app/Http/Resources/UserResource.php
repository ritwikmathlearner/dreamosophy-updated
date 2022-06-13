<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use phpDocumentor\Reflection\Types\Boolean;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'created_at' => $this->created_at,
            'watched_tutorial' => (Boolean) getMetaValue('user_meta', ['user_id' => $this->id, 'meta_key' => 'watched_tutorial']),
            'hoots' => getMetaValue('user_meta', ['user_id' => $this->id, 'meta_key' => 'hoots']) ?? 0,
            'level' => getMetaValue('user_meta', ['user_id' => $this->id, 'meta_key' => 'level']) ?? 1,
        ];
    }
}
