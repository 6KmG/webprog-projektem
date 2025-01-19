import requests

# URLs for login and form submission
login_url = "https://hardverapro.hu/index.html"
submit_url = "https://hardverapro.hu/hirdetesfeladas/uj.php"

# Step 1: Define login credentials

login_data = {
    'username': 'your_username',
    'password': 'your_password'
}

# Step 2: Create a session to maintain cookies
session = requests.Session()

# Step 3: Perform login
login_response = session.post(login_url, data=login_data)

# Check if login was successful
if login_response.status_code == 200 and "Welcome" in login_response.text:
    print("Login successful")

    # Form data (including file uploads if necessary)
    data = {
        'title': 'Sample aProduct Title',
        'content': ' <p>This is a detailed description of the sample product.</p>',
        'cities': '19415',
        'price_option': '3'
    }

    # Define file uploads (if necessary)
    files = {
        # Example for an image upload
        # 'image': ('product_image.jpg', open('path/to/image.jpg', 'rb'), 'image/jpeg')
    }

    # Step 5: Prepare the request to capture the payload
    prepared_request = requests.Request(
        method='POST',
        url=submit_url,
        data=form_data,
        files=files
    ).prepare()

    # Step 6: Send the prepared request
    response = session.send(prepared_request)

    # **Capture and print request details**
    print("**Request URL**:")
    print(prepared_request.url)
    print("\n**Request Headers**:")
    print(prepared_request.headers)
    print("\n**Request Body (Payload)**:")
    print(prepared_request.body.decode('utf-8') if prepared_request.body else 'No Body')

    # **Capture and print response details**
    print("\n**Response Status Code**:")
    print(response.status_code)
    print("\n**Response Headers**:")
    print(response.headers)
    print("\n**Response Content**:")
    print(response.text)

else:
    print("Login failed")
    print(login_response.text)
