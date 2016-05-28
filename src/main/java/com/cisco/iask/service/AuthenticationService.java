package com.cisco.iask.service;

import java.io.IOException;
import org.apache.commons.codec.binary.Base64;
import java.util.List;
import java.util.StringTokenizer;

import org.mongodb.morphia.Datastore;

import com.cisco.iask.entity.User;
import com.cisco.iask.service.ServicesFactory;

public class AuthenticationService {
	public boolean authenticate(String authCredentials) {

		if (null == authCredentials)
			return false;
		// header value format will be "Basic encodedstring" for Basic
		// authentication. Example "Basic YWRtaW46YWRtaW4="
		final String encodedUserPassword = authCredentials.replaceFirst("Basic"
				+ " ", "");
		String usernameAndPassword = null;
		try {
			byte[] decodedBytes = Base64.decodeBase64(
					encodedUserPassword);
			usernameAndPassword = new String(decodedBytes, "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
		final StringTokenizer tokenizer = new StringTokenizer(
				usernameAndPassword, ":");
		final String username = tokenizer.nextToken();
		final String password = tokenizer.nextToken();

		// we have fixed the userid and password as admin
		// call some UserService/LDAP here
		
		Datastore dataStore = ServicesFactory.getMongoDB();
		
		/*User user = (User) dataStore.createQuery(User.class).field("name")
				.equal(username);*/
		List<User> u = dataStore.find(User.class, "name =", username).asList();
		boolean authenticationStatus = false;
		if (!u.isEmpty())
		{
			if(u.get(0).getPassword().equals(password))
				authenticationStatus = true;
		}
		return authenticationStatus;
	}

}
