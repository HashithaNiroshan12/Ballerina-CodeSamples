import ballerina/http;
import ballerina/constraint;

type Album3 record {
    @constraint:String{
        maxLength: 5,
        minLength: 1
    }
    string title;
    string artist;
};

service / on new http:Listener(9094) {
    private Album3[] albums3 = [];

    resource function post albums (@http:Payload Album3 album3) returns http:Created {
        self.albums3.push(album3);
        return http:CREATED;
    }
}