<?php

namespace App\Models;

use Carbon\Traits\Timestamp;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PesertaSeminar extends Model
{
    use HasFactory;
    use Timestamp;

    protected $table = 'peserta_seminars';
    protected $guarded = ['id'];

    public function seminar()
    {
        return $this->belongsTo(Post::class);
    }
}
