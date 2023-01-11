import ballerina/http;

type Album6 readonly & record {|
    string title;
    string artist;

|};

table<Album6> key(title) albums6 = table [
        {title: "Blue train", artist: "john roo"},
        {title: "Jesu", artist: "rohnn"}
    ];

service on new http:Listener(9096) {
    resource function get albums(string artist) returns Album6[] {
        return from Album6 album in albums6
        where album.artist == artist
        select album;
    }
}