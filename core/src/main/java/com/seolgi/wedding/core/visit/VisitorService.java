package com.seolgi.wedding.core.visit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitorService {
    @Autowired
    private VisitorRepository visitorRepository;

    public void add(Visitor visitor) {
        visitorRepository.save(visitor);
    }

    public long count() {
        return visitorRepository.count();
    }

    public long countByWeddingId(int weddingId) {

        return visitorRepository.countByWeddingId(weddingId);
    }
}
