package io.helidon.examples.repository;

import io.helidon.examples.model.Authors;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.eclipse.microprofile.openapi.models.security.SecurityScheme;

import java.util.List;


@ApplicationScoped
public class AuthorsRespository{

    @PersistenceContext
    EntityManager entityManager;

    public void ingresar(Authors authors){
        this.entityManager.persist(authors);
    }

    public List<Authors> buscarTodos(){
        return entityManager.createQuery("SELECT a FROM Authors a", Authors.class).getResultList();
    }

    public Authors buscarId(Integer id){
        return entityManager.find(Authors.class, id);
    }

    public void actualizar(Authors authors){
        entityManager.merge(authors);
    }

    public void eliminar(Integer id){
        entityManager.remove(buscarId(id));
    }


}
