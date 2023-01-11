import ballerina/mime;
import ballerina/http;

type Album7 readonly & record {|
    string title;
    string artist;

|};

table<Album7> key(title) albums7 = table [
        {title: "Blue train", artist: "john roo"},
        {title: "Jesu", artist: "rohnn"}

    ];

service / on new http:Listener(9097) {
    resource function get albums(@http:Header string accept) returns Album7[]|http:NotAcceptable {
        if !string:equalsIgnoreCaseAscii(accept, mime:APPLICATION_JSON) {
            return http:NOT_ACCEPTABLE;
        }
        return albums7.toArray();
    }
}
