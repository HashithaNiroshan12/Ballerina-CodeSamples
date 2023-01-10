import ballerina/http;

type Album2 readonly & record {|
    string title;
    string artist;

|};

table<Album2> key(title) albums2 = table [];

service / on new http:Listener(9092){
    resource function post albums(@http:Payload Album2 album2) returns Album2{
        albums2.add(album2);
        return album2;
        
    }
}