package clientAPI;

public class FactoryRequest {

    public static RequestClient make(String type){

        RequestClient client;

        switch (type){

            case "put":
                client= new RequestPUT();
                break;
            case "post":
                client= new RequestPOST();
                break;
            case "delete":
                client= new RequestDELETE();
                break;
            default:
                client= new RequestPUT();
                break;
        }

        return client;
    }
}