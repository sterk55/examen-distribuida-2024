package io.helidon.examples.rest;


import io.helidon.examples.db.Books;
import io.helidon.examples.repo.BookRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;

@Path("/books")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@ApplicationScoped
@Transactional
public class BookRest {

    @Inject
    BookRepository repo;

    @GET
    public List<Books> findAll(){

    }

    @GET
    @Path("/{id}")
    public Response findById(@PathParam("id") Integer id){
        var b = repo.buscarId(id);

        if(b == null){
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        return Response.ok(b).build();
    }

}
