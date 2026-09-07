package vn.iotstar.config;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAConfig {

    private static final EntityManagerFactory factory;

    static {
        try {
            factory = Persistence.createEntityManagerFactory(
                    "ServletCRUDMVC"
            );
        } catch (Exception e) {
            System.err.println("LOI KHOI TAO JPA");
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    public static EntityManager getEntityManager() {
        return factory.createEntityManager();
    }

    public static void close() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}