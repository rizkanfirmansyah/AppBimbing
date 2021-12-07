<?php

namespace App\Models;

use Carbon\Traits\Timestamp;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Guidance extends Model
{
    use HasFactory;
    use Timestamp;

    protected $guards = ['id'];
}
