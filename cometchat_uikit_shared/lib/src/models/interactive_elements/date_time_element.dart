
import '../../../../cometchat_uikit_shared.dart';

/// Represents a dropdown model class , used to draw dropdown .
class DateTimeElement extends BaseInputElement<String> {
  DateTimeElement(
      {String elementType = UIElementTypeConstants.dropdown,
        required String elementId,
        required this.label,
        this.mode = DateTimeVisibilityMode.dateTime,
        this.from,
        this.to,
        this.placeholder,
        this.dateTimeFormat,
        this.defaultDateTime,
        String? response,
        String? defaultValue,
        bool? optional,
        this.formattedResponse
      })
      : super(
      elementType: elementType,
      elementId: elementId,
      defaultValue: defaultValue,
      optional: optional ?? true);


  String label;
  DateTimeVisibilityMode mode;
  DateTime? from;
  DateTime? to;
  TextInputPlaceholder? placeholder;
  DateTime? formattedResponse;
  String? dateTimeFormat;
  DateTime? defaultDateTime;




  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map[ModelFieldConstants.label] = label;
    return map;
  }

  factory DateTimeElement.fromMap(dynamic map) {

    DateTimeVisibilityMode mode;

    switch(map[ModelFieldConstants.mode]){
      case "date":
        mode = DateTimeVisibilityMode.date;
        break;
      case "dateTime":
        mode = DateTimeVisibilityMode.dateTime;
        break;
      case "time":
        mode = DateTimeVisibilityMode.time;
        break;
      default:
        mode = DateTimeVisibilityMode.dateTime;
        break;
    }

    DateTime? from;
    DateTime? to;
    DateTime? defaultDateTime;

    try{
      if(mode== DateTimeVisibilityMode.time){
        from  =  DateTime.parse( (cometchatConstantString+map[ModelFieldConstants.from]));
        defaultDateTime  =  DateTime.parse( (cometchatConstantString+map[ModelFieldConstants.defaultValue]));
      }else{
        from = DateTime.parse(map[ModelFieldConstants.from]);
        defaultDateTime = DateTime.parse(map[ModelFieldConstants.defaultValue]);
      }
    } catch(_){}

    try{
      if(mode== DateTimeVisibilityMode.time){
        to  =  DateTime.parse( (cometchatConstantString+map[ModelFieldConstants.to]));

      }else{
        to = DateTime.parse(map[ModelFieldConstants.to]);
      }
    } catch(_){
    }


    print("_defaultDateTime is $defaultDateTime");
    return DateTimeElement(
      elementType: map[ModelFieldConstants.elementType],
      elementId: map[ModelFieldConstants.elementId],
      optional: map[ModelFieldConstants.optional],
      label: map[ModelFieldConstants.label],
      defaultValue:  map[ModelFieldConstants.defaultValue],
      defaultDateTime: defaultDateTime,
      formattedResponse: defaultDateTime,
      //response:map[ModelFieldConstants.response],
        mode: mode,
      placeholder: map[ModelFieldConstants.placeholder],
      from: from,
      to: to,
      dateTimeFormat:  map[ModelFieldConstants.dateTimeFormat],
    );
  }

  @override
  bool validateResponse() {
    if (response == null) return false;
    return true;
  }
}

String cometchatConstantString = "1970-01-01T";
