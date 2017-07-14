package com.cha.kim.wedding.core.invitation.wedding;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


interface WeddingRepository extends JpaRepository<Wedding, Integer> {
    Wedding findOneByUrl(String url);

    Wedding findOneByIdAndAccountId(int id, String accountId);
}
