<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class TourismModel extends Model
{
    use HasFactory;

    protected $table = 'tourism';
    protected $primaryKey = 'id';

    public static function getTourismImages($id)
    {
        $data = DB::table('tourism_img')
            ->select('tourism_img_file')
            ->where('tourism_id', $id)
            ->get();

        $listImages = [];
        foreach ($data as $val) {
            $listImages[] = url('/storage') . '/' . $val->tourism_img_file;
        }

        return $listImages;
    }

    public static function saveTourism($data, $id = '')
    {
        if ($id) {
            $DB = DB::table('tourism')
                ->where('id', $id)
                ->update($data);
        } else {
            $DB = DB::table('tourism')
                ->insertGetId($data);
            $id = $DB;
        }

        return $id;
    }

    public static function saveTourismImages($parentId, $multipleImage)
    {
        //Delete Images
        DB::table('tourism_img')
            ->where('tourism_id', $parentId)
            ->delete();

        //Insert Multiple Images
        foreach ($multipleImage as $fileName) {
            DB::table('tourism_img')->insert([
                'tourism_id' => $parentId,
                'tourism_img_file' => $fileName
            ]);
        }

        return true;
    }

    public static function deleteTourism($id)
    {
        //Delete Images
        DB::table('tourism_img')
            ->where('tourism_id', $id)
            ->delete();

        return DB::table('tourism')
            ->delete($id);
    }
}
