package vn.iotstar.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import vn.iotstar.config.JPAConfig;
import vn.iotstar.model.User;

public class UserJpaDao {

    public User findById(int userId) {

        EntityManager entityManager =
                JPAConfig.getEntityManager();

        try {

            return entityManager.find(
                    User.class,
                    userId
            );

        } finally {

            entityManager.close();
        }
    }

    public User updateProfile(
            int userId,
            String fullName,
            String phone,
            String images) {

        EntityManager entityManager =
                JPAConfig.getEntityManager();

        EntityTransaction transaction =
                entityManager.getTransaction();

        try {

            transaction.begin();

            User user =
                    entityManager.find(
                            User.class,
                            userId
                    );

            if (user == null) {

                transaction.rollback();
                return null;
            }

            user.setFullName(fullName);
            user.setPhone(phone);

            if (images != null &&
                    !images.trim().isEmpty()) {

                user.setImages(images);
            }

            entityManager.merge(user);

            transaction.commit();

            return user;

        } catch (Exception e) {

            if (transaction.isActive()) {
                transaction.rollback();
            }

            e.printStackTrace();

            throw e;

        } finally {

            entityManager.close();
        }
    }
}