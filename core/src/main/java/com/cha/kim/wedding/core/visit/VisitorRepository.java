package com.cha.kim.wedding.core.visit;


import org.springframework.data.jpa.repository.JpaRepository;

public interface VisitorRepository extends JpaRepository<Visitor, Integer> {
    long countByWeddingId(int weddingId);
}
