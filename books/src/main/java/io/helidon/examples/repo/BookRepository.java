package io.helidon.examples.repo;

import io.helidon.examples.db.Books;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import java.util.List;

@ApplicationScoped
@Transactional
public class BookRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public void ingresar(Books books){
        entityManager.persist(books);
    }

    public Books buscarId(Integer id){
        return entityManager.find(Books.class, id);
    }

    public List<Books> bucarTodos(){
        return entityManager.createQuery("SELECT c FROM Books c", Books.class).getResultList();
    }

    public void actualizar(Books books){
         entityManager.merge(books);
    }

    public void eliminar(Integer id){
        entityManager.remove(buscarId(id));
    }



}
