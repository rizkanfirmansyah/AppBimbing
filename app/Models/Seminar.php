<?php

namespace App\Models;

use Carbon\Traits\Timestamp;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Seminar extends Model
{
    use HasFactory;
    use Timestamp;

    protected $table = 'seminars';
    protected $guarded = ['id'];

    public function participants()
    {
        return $this->hasMany(PesertaSeminar::class);
    }
}
