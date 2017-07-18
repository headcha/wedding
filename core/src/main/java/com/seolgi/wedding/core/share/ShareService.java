package com.seolgi.wedding.core.share;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShareService {
    @Autowired
    private ShareRepository shareRepository;

    public void add(Share share) {
        shareRepository.save(share);
    }

    public long countByWeddingId(int weddingId) {
        return shareRepository.countByWeddingId(weddingId);
    }

    public long count() {
        return shareRepository.count();
    }
}
