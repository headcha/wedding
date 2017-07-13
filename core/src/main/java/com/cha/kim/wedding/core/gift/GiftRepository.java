package com.cha.kim.wedding.core.gift;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GiftRepository extends JpaRepository<Gift , Integer> {
    List<Gift> findListByWeddingId(int weddingId);
}
