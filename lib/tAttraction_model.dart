final String tAttractionsTable = 'tAttractions';

class TAttractionFields{
  static final List<String> values =[
    id, name, latitude, longitude, imagePath, rating, description, distance, location
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String latitude = 'latitude';
  static final String longitude = 'longitude';
  static final String imagePath = 'imagePath';
  static final String rating = 'rating';
  static final String description = 'description';
  static final String distance = 'distance';
  static final String location = 'location';
}

class TAttractions{
   final int? id;
   final String name;
   final String latitude;
   final String longitude;
   final String imagePath;
   final String rating;
   final String description;
   final String distance;
   final String location;

  TAttractions({
   this.id,
   required this.name,
   required this.latitude,
   required this.longitude,
   required this.imagePath,
   required this.rating,
   required this.description,
   required this.distance,
   required this.location
});

  TAttractions copy({
  int? id,
   String? name,
   String? latitude,
   String? longitude,
   String? imagePath,
   String?rating,
   String? description,
   String? distance,
   String? location,
})=>
  TAttractions(
    id: id?? this.id,
    name: name ?? this.name,
    latitude: latitude?? this.latitude,
    longitude: longitude?? this.longitude,
    imagePath: imagePath?? this.imagePath,
    rating: rating?? this.rating,
    description: description?? this.description,
    distance: distance?? this.distance,
    location: location?? this.location,
  );

  static TAttractions fromJson(Map<String, Object?>json)=>TAttractions(
    id: json[TAttractionFields.id] as int?,
    name: json[TAttractionFields.name] as String ,
    latitude: json[TAttractionFields.latitude] as String,
    longitude: json[TAttractionFields.longitude] as String,
    imagePath: json[TAttractionFields.imagePath] as String,
    rating: json[TAttractionFields.rating] as String,
    description:json[TAttractionFields.description] as String,
    distance: json[TAttractionFields.distance] as String,
    location:json[TAttractionFields.location] as String ,
  );

  Map <String, Object?> toJson()=> {
    TAttractionFields.id : id,
    TAttractionFields.name:name,
    TAttractionFields.latitude:latitude,
    TAttractionFields.longitude:longitude,
    TAttractionFields.imagePath:imagePath,
    TAttractionFields.distance:distance,
    TAttractionFields.rating:rating,
    TAttractionFields.location:location,
    TAttractionFields.description:description,

  };
}