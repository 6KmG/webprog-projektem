<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\StreamedResponse;

class VideoStreamController extends Controller
{
    public function stream($filename)
    {
        // Define the full path to the video file
        $path = storage_path('app/videos/' . $filename);

        // Check if the file exists
        if (!file_exists($path)) {
            abort(404, 'Video not found');
        }

        // Get file size and prepare the response
        $fileSize = filesize($path);
        $start = 0;
        $end = $fileSize - 1;
        $length = $fileSize;

        // Parse the Range header if it exists
        $headers = [];
        if (isset($_SERVER['HTTP_RANGE'])) {
            $range = $_SERVER['HTTP_RANGE'];
            list(, $range) = explode('=', $range, 2);
            [$start, $end] = explode('-', $range);

            // Convert to integers
            $start = intval($start);
            $end = $end === "" ? $fileSize - 1 : intval($end);
            $length = $end - $start + 1;

            // Set response headers for partial content
            $headers = [
                'Content-Type' => 'video/mp4',
                'Content-Length' => $length,
                'Accept-Ranges' => 'bytes',
                'Content-Range' => "bytes $start-$end/$fileSize",
                'HTTP/1.1 206 Partial Content',
            ];
        } else {
            // Set headers for full content if no Range header is provided
            $headers = [
                'Content-Type' => 'video/mp4',
                'Content-Length' => $fileSize,
                'Accept-Ranges' => 'bytes',
            ];
        }

        // Create a streamed response
        return response()->stream(function () use ($path, $start, $length) {
            $file = fopen($path, 'rb');
            fseek($file, $start);

            // Stream the file in chunks
            $bufferSize = 8192; // 8KB buffer
            $bytesSent = 0;
            while (!feof($file) && $bytesSent < $length) {
                $remainingBytes = $length - $bytesSent;
                $readBytes = min($bufferSize, $remainingBytes);
                echo fread($file, $readBytes);
                flush();
                $bytesSent += $readBytes;
            }

            fclose($file);
        }, 206, $headers);
    }
}
