<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Streaming</title>
</head>
<body>
    <h1>Video Streaming Example</h1>
    <video width="640" height="360" controls>
        <source src="{{ url('/stream/untitled.mp4') }}" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</body>
</html>
