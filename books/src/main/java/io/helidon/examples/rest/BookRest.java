package io.helidon.examples.rest;


import io.helidon.examples.db.Books;
import io.helidon.examples.repo.BookRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.media.Content;
import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;

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
    @APIResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Books.class))
    )
    public List<Books> findAll(){
        return repo.bucarTodos();
    }

    @GET
    @Path("/{id}")
    @APIResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Books.class))
    )
    public Response findById(@PathParam("id") Integer id){
        var b = repo.buscarId(id);

        if(b == null){
           return Response.status(Response.Status.NOT_FOUND).build();
        }

        return Response.ok(b).build();
    }

    @POST
    @Path("/{id}")
    @APIResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Books.class))
    )
    public Response update(@PathParam("id") Integer id, Books bO){
        Books b = repo.buscarId(id);
        b.setAuthorId(bO.getAuthorId());
        b.setId(bO.getId());
        b.setIsbn(bO.getIsbn());
        b.setTitle(bO.getTitle());
        b.setPrice(bO.getPrice());

        return Response.ok().build();
    }

    @DELETE
    @Path("/{id}")
    @APIResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(mediaType = "application/json",
                    schema = @Schema(implementation = Books.class))
    )
    public Response delete(@PathParam("id") Integer id){
        repo.eliminar(id);

        return Response.ok().build();
    }

}
