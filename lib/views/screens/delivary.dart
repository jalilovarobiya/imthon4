import 'package:imthon3/utils/main_util.dart';
import 'package:http/http.dart' as http;

class Delivary extends StatefulWidget {
  const Delivary({super.key});

  @override
  State<Delivary> createState() => _DelivaryState();
}

class _DelivaryState extends State<Delivary> {
  late GoogleMapController mapController;
  LatLng? currentLocation;
  LatLng? destination;
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};

  static String googleAPIKey = 'AIzaSyBbYLPuhexAOd4QO8e3UI_s2qdoZJQEIdY';

  Future<void> _getMyLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }
    Position pos = await Geolocator.getCurrentPosition();
    setState(() {
      currentLocation = LatLng(pos.latitude, pos.longitude);
      markers.add(
        Marker(markerId: const MarkerId("origin"), position: currentLocation!),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _getMyLocation();
  }

  Future<void> _getDirections(LatLng origin, LatLng destination) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$googleAPIKey',
    );

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    if (data['routes'].isNotEmpty) {
      final points = data['routes'][0]['overview_polyline']['points'];
      final polylinePoints = _decodePolyline(points);

      setState(() {
        polylines.clear();
        polylines.add(
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylinePoints,
            color: Colors.blue,
            width: 4,
          ),
        );
      });
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0) ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0) ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map Screen")),
      body:
          currentLocation == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: currentLocation!,
                  zoom: 14,
                ),
                onMapCreated: (controller) {
                  mapController = controller;
                },
                myLocationEnabled: true,
                markers: markers,
                polylines: polylines,
                onTap: (LatLng point) async {
                  setState(() {
                    destination = point;
                    markers.removeWhere((m) => m.markerId.value == "dest");
                    markers.add(
                      Marker(markerId: const MarkerId("dest"), position: point),
                    );
                  });

                  await _getDirections(currentLocation!, point);
                },
              ),
    );
  }
}
