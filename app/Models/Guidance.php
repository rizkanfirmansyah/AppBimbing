<?php

namespace App\Models;

use Carbon\Traits\Timestamp;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Guidance extends Model
{
    use HasFactory;
    use Timestamp;

    protected $table = 'guidances';
    protected $fillable = [
        'mahasiswa_id',
        'title',
        'file',
        'description',
        'status',
        'description_dosen',
        'memo'
    ];

    public function mahasiswa()
    {
        return $this->belongsTo(Mahasiswa::class, 'mahasiswa_id', 'id');
    }
}
