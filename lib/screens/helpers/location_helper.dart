const Mapquestapi_API_KEY = 'GG6QGUBx0EAiRff9LTPFFejcEBAdYrcj';
const BingMap_API_KEY =
    'AmeugOit994E0f1q6xxfc_6GVEHyLFV5Qeg_svNwn_GBnfsuOlPck93Jo6r-oc_z';


class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude,required int zoomIn}) {
    // return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
    //return 'https://www.mapquestapi.com/staticmap/v5/map?locations=$latitude,$longitude&zoom=17&size=@2x&key=$GOOGLE_API_KEY';
     return 'https://dev.virtualearth.net/REST/v1/Imagery/Map/Road/$latitude,$longitude/$zoomIn?mapSize=500,1020&pushpin=$latitude,$longitude;64;&key=$BingMap_API_KEY';
    //return 'https://dev.virtualearth.net/REST/v1/Imagery/Map/Road/33.511512,36.294322/$zoomIn?mapSize=700,500&pushpin=33.511512,36.294322;64;&key=$BingMap_API_KEY';
  }
}
