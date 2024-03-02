package io.helidon.examples.controller;


import io.helidon.examples.model.Authors;
import io.helidon.examples.repository.AuthorsRespository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.media.Content;
import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;

import java.util.List;

@Path("/authors")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@Transactional
@ApplicationScoped
public class AuthorsController {

    @Inject
    AuthorsRespository rep;

    @GET
    @Operation(summary = "Get all authors", description = "Returns a list of all authors")
    @APIResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Authors.class))
    )
    public List<Authors> findAll(){
        return rep.buscarTodos();
    }

    @GET
    @Path("/{id}")
    @APIResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Authors.class))
    )
    public Response findById(@PathParam("id") Integer id){
        var a = rep.buscarId(id);
        if(a == null){
            return Response.status(Response.Status.NOT_FOUND).build();

        }

        return Response.ok(a).build();

    }

    @POST
    @APIResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Authors.class))
    )
    public Response create(Authors a){
        rep.ingresar(a);

        return Response.status(Response.Status.CREATED.getStatusCode(), "author created").build();

    }

    @PUT
    @Path("/{id}")
    @APIResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Authors.class))
    )
    public  Response update(@PathParam("id") Integer id, Authors aO){
        Authors a = rep.buscarId(id);
        a.setFirstName(aO.getFirstName());
        a.setLastName(aO.getLastName());

        return Response.ok().build();
    }

    @DELETE
    @Path("/{id}")
    @APIResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Authors.class))
    )
    public Response delete(@PathParam("id") Integer id){
        rep.eliminar(id);

        return Response.ok().build();
    }
}
