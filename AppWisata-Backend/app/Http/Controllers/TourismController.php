<?php

namespace App\Http\Controllers;

use App\Models\TourismModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;

class TourismController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = TourismModel::all();

        foreach ($data as $key => $val) {
            $data[$key]->tourism_img = url('/storage') . '/' . $val->tourism_img;
            $data[$key]->tourism_img_list = TourismModel::getTourismImages($val->id);
        }

        return $this->responseJSON(['statusCode' => Response::HTTP_OK, 'listData' => $data]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->input();
        $uploadFile = $request->file('upload_file');

        $validate = Validator::make($request->all(), [
            'tourism_name' => 'required',
            'tourism_description' => 'required',
            'tourism_location' => 'required',
            'tourism_ticket_price' => 'required|integer',
            'tourism_working_hours' => 'required',
            'tourism_open_days' => 'required',
            'upload_file' => 'required|mimes:png,jpg,jpeg|max:1012',
            'upload_files.*' => 'required|mimes:png,jpg,jpeg|max:1012'
        ]);
        if ($validate->fails()) return $this->errorResponse($validate->errors(), Response::HTTP_BAD_REQUEST);

        if ($uploadFile) {
            $fileName = $uploadFile->hashName();
            $uploadFile->storeAs('public/', $fileName);

            $input['tourism_img'] = $fileName;
        }

        $multipleFile = $this->multipleFileUpload($request, 'upload_files', 'public/');

        $i = TourismModel::saveTourism($input);
        if ($multipleFile) TourismModel::saveTourismImages($i, $multipleFile);

        if (!$i) return $this->errorResponse(['Server is Maintenance, Please try later'], Response::HTTP_UNPROCESSABLE_ENTITY);

        return $this->successResponse('Data is Created', Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = TourismModel::where('id', $id)->first();
        $data->tourism_img_list = TourismModel::getTourismImages($id);

        $this->responseJSON(['statusCode' => Response::HTTP_OK, 'listData' => $data]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if (!$id) $this->errorResponse(['errors' => 'ID is Required', Response::HTTP_BAD_REQUEST]);

        $input = $request->input();
        $uploadFile = $request->file('upload_file');

        $validate = Validator::make($request->all(), [
            'tourism_name' => 'required',
            'tourism_description' => 'required',
            'tourism_location' => 'required',
            'tourism_ticket_price' => 'required|integer',
            'tourism_working_hours' => 'required',
            'tourism_open_days' => 'required',
            'upload_file' => 'mimes:png,jpg,jpeg|max:512',
            'upload_files.*' => 'mimes:png,jpg,jpeg|max:512'
        ]);
        if ($validate->fails()) return $this->errorResponse($validate->errors(), Response::HTTP_BAD_REQUEST);

        if ($uploadFile) {
            $fileName = $uploadFile->hashName();
            $uploadFile->storeAs('public/', $fileName);

            $input['wisata_img'] = $fileName;
        }

        $multipleImage = $this->multipleFileUpload($request, 'upload_files', 'public/');

        $i = TourismModel::saveTourism($input, $id);
        if ($multipleImage) TourismModel::saveTourismImages($i, $multipleImage);

        if (!$i) return $this->errorResponse(['Server is Maintenance, Please try later'], Response::HTTP_UNPROCESSABLE_ENTITY);

        return $this->successResponse('Data is Updated', Response::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (!$id) return $this->errorResponse(['errors' => 'ID is Required'], Response::HTTP_BAD_REQUEST);

        $i = TourismModel::deleteTourism($id);
        if (!$i) return $this->errorResponse(['Server sedang perbaikan !'], Response::HTTP_UNPROCESSABLE_ENTITY);

        return $this->successResponse('Data is Deleted !');
    }
}
