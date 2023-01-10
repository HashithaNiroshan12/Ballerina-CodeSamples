import ballerina/http;

type Album1 readonly & record {|
    string title;
    string artist;

|};

table<Album1> key(title) albums1 = table [
        {title: "Blue train", artist: "john roo"},
        {title: "Jesu", artist: "rohnn"}

    ];

service /info on new http:Listener(9091){
    resource function get albums () returns Album1[] {
        return albums1.toArray();
    }
}