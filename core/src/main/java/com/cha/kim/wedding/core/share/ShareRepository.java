package com.cha.kim.wedding.core.share;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ShareRepository extends JpaRepository<Share , Integer> {

    long countByWeddingId(int weddingId);
}
