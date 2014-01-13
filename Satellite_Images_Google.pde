String[] images;
String api_key = "YOUR_API_KEY_GOES_HERE"; // Get an API key from Google's API Console: https://code.google.com/apis/console
String zoom = "ZOOM_LEVEL_GOES_HERE"; // Start with 16; Google accepts values from 0-21

void setup() {
}

void draw() {
  images = loadStrings("images.csv");
  for(int i = 0; i < images.length; i++) {
    String[] values = split(images[i], ",");
    String lon = values[0];
    String lat = values[1];
    String id = values[2];
    PImage img = getSatImage(lat,lon);
    img.save("img" + id + ".jpg");
  }
  
}

PImage getSatImage(String lat, String lon) {
    String url = "http://maps.googleapis.com/maps/api/staticmap?center=" + lat + "," + lon + "&zoom=" + zoom +"&scale=2&size=640x640&maptype=satellite&sensor=false&key=" + api_key + "&junk=.jpg";
    return(loadImage(url));
}
