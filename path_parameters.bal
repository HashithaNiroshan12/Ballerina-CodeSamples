import ballerina/http;

type Album5 readonly & record {|
    string title;
    string artist;

|};

table<Album5> key(title) albums5 = table [
        {title: "Blue train", artist: "john roo"},
        {title: "Jesu", artist: "rohnn"}
    ];

service / on new http:Listener(9095) {
    resource function get albums/[string title]() returns Album5|http:NotFound {
        Album5? album = albums[title];
        if album is () {
            return http:NOT_FOUND;

        }
        return album;
    }

}
