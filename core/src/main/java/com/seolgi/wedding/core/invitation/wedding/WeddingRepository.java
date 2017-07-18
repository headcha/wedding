package com.seolgi.wedding.core.invitation.wedding;

import org.springframework.data.jpa.repository.JpaRepository;


interface WeddingRepository extends JpaRepository<Wedding, Integer> {
    Wedding findOneByUrl(String url);

    Wedding findOneByIdAndAccountId(int id, String accountId);
}
