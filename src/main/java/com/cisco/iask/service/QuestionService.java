package com.cisco.iask.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.bson.types.ObjectId;
import org.mongodb.morphia.Datastore;
import org.mongodb.morphia.query.Query;

import com.cisco.iask.auth.QuestionResponse;
import com.cisco.iask.entity.Question;

@Path("/question")
@Produces(MediaType.APPLICATION_JSON)
public class QuestionService {
	
	@GET
    @Path("/all")
	@Produces(MediaType.APPLICATION_JSON)
    public List<Question> findAll() {
		Datastore dS = ServicesFactory.getMongoDB();
		List<Question> qList = dS.find(Question.class).asList();
		System.out.println(qList.get(0).getId().toString());
        return qList;
    }
	
	@POST
    @Path("/create")
    @Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
    public QuestionResponse createQuestion(
    					Question q
                              ) {
		Datastore dS = ServicesFactory.getMongoDB();
		ObjectId id = (ObjectId) dS.save(q).getId();
		boolean status = false;
		if(id != null) status = true;
		
		return new QuestionResponse(id, status);
    }
	
	@GET
    @Path("/id/{id}")
	@Produces(MediaType.APPLICATION_JSON)
    public Question findById(@PathParam("id") ObjectId id) {
		Datastore dS = ServicesFactory.getMongoDB();
        return dS.get(Question.class, id); 
    }
	
	@GET
    @Path("/user/{username}")
	@Produces(MediaType.APPLICATION_JSON)
    public List<Question> findByUsername(@PathParam("username") String username) {
		Datastore dS = ServicesFactory.getMongoDB();
		Query q = dS.createQuery(Question.class).
				field("username").equal(username);
		List<Question> qList = q.asList();
		
        return qList; 
    }

}
