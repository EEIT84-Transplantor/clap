package chat;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/chat")
public class MyWebSocketEndPoint {
//
private static final String USERNAME_KEY = "username";
private static Map<String, Session> clients = Collections.synchronizedMap(new LinkedHashMap<String, Session>());
@OnOpen
public void onOpen(Session session) throws Exception {

    //Get the new socket's username from url
    //e.g. url: ws://localhost:8080/chat?username=Andi, so Andi is the username
    Map<String, List<String>> parameter = session.getRequestParameterMap();
    List<String> list = parameter.get(USERNAME_KEY);
    String newUsername = list.get(0);

	//Add the new socket to the collection
    clients.put(newUsername, session);

    //also set username property of the session.
    //so when there a new message from a particular socket's session obj
    //we can get the username whom send the message
    session.getUserProperties().put(USERNAME_KEY, newUsername);

    //Give a list current online users to the new socket connection
    //because we store username as the key of the map, we can get all
    //  username list from the map's keySet
    System.out.println(newUsername);
	if (newUsername.equalsIgnoreCase("admin")){
		 String response = "newUser|" + String.join("|", clients.keySet());
		 session.getBasicRemote().sendText(response);
	}
    //Loop through all socket's session obj, then send a text message
    for (String client: clients.keySet()){
    	if (client.equalsIgnoreCase("admin")){
    		if (clients.get(client)==session) continue;
    		clients.get(client).getBasicRemote().sendText("newUser|" + newUsername);
    		
//    		for (Session client1 : clients.values()) {
//    	        if(client1 == session) continue;
//    	        clients.get(client).getBasicRemote().sendText("newUser|" + newUsername);
//    	    }
    	}else if (clients.get(client)==session){
    		  String response = "message|admin| Hi "+newUsername+", How may I help you today?" ;
    		  session.getBasicRemote().sendText(response);
    	}
    }
//    for (Session client : clients.values()) {
//        if(client == session) continue;
//        client.getBasicRemote().sendText("newUser|" + newUsername);
//    }
}

@OnMessage
public void onMessage(Session session, String message) throws Exception {
    //Extract the information of incoming message.
    //Message format: 'From|Message'
    //so we split the incoming message with '|' token
    //to get the destination and message content data
    String[] data = message.split("\\|");
    String destination = data[0];
    String messageContent = data[1];
    //Retrieve the sender's username from it's property
    String sender = (String)session.getUserProperties().get(USERNAME_KEY);
System.out.println(destination);System.out.println("=================="+sender);
    //Deliver the message according to the destination
    //Outgoing Message format: "message|sender|content|messageType?"
    //the message type is optional, if the message is intended to be broadcast
    //  then the message type value is "|all"
    if(destination.equals("admin")) {
        //if the destination chat is 'all', then we broadcast the message
    	clients.get("admin").getBasicRemote().sendText("message|" + sender + "|" + messageContent);
//    	for (Session client : clients.values()) {
//            if(client.equals(session)) continue;
//            client.getBasicRemote().sendText("message|" + sender + "|" + messageContent + "|all" );
//        }
    } else {
        //find the username to be sent, then deliver the message
    
        Session client = clients.get(destination);
        String response = "message|" + sender+ "|" + messageContent;
        clients.get(destination).getBasicRemote().sendText(response);
    }
}

@OnClose
public void onClose(Session session) throws Exception {
    //remove client from collecton  
    String username = (String)session.getUserProperties().get(USERNAME_KEY);
    clients.remove(username);
    
    //broadcast to all people, that the current user is leaving the chat room
    for (Session client : clients.values()) {
        client.getBasicRemote().sendText("removeUser|" + username);
    }
}


}
