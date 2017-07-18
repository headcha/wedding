package com.seolgi.wedding.core.share;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ShareRepository extends JpaRepository<Share , Integer> {

    long countByWeddingId(int weddingId);
}
