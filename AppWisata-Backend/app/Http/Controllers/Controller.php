<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    // ================ Response Server ================ //

    public function responseJSON($data = [], $status = Response::HTTP_OK)
    {
        return response()
            ->json($data, $status, ['Content-Type: application/json'], JSON_PRETTY_PRINT);
    }

    public function successResponse($message, $status = Response::HTTP_OK)
    {
        return response()
            ->json(['statusCode' => $status, 'message' => $message], $status, ['Content-Type: application/json'], JSON_PRETTY_PRINT);
    }

    public function errorResponse($data = [], $status = Response::HTTP_INTERNAL_SERVER_ERROR)
    {
        return response()
            ->json(['statusCode' => $status, 'error' => $data], $status, ['Content-Type: application/json'], JSON_PRETTY_PRINT);
    }

    // ================ Multiple Upload File ================ //

    public function multipleFileUpload(Request $request, $nameForm, $dir)
    {
        $fileList = [];
        if ($request->hasfile($nameForm)) {
            foreach ($request->file($nameForm) as $key => $file) {
                $fileName = $file->hashName();
                $file->storeAs($dir, $fileName);

                $fileList[$key] = $fileName;
            }
        }

        return $fileList;
    }
}
