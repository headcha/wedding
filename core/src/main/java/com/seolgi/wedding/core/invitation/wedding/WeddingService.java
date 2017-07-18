package com.seolgi.wedding.core.invitation.wedding;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class WeddingService {
    @Autowired
    private WeddingRepository weddingRepository;

    public Wedding save(Wedding wedding) {
        return weddingRepository.save(wedding);
    }

    public long count() {
        return weddingRepository.count();
    }

    public boolean isExistByUrl(String url) {
        return weddingRepository.findOneByUrl(url) != null;
    }

    public Wedding findOneByUrl(String url) {
        return weddingRepository.findOneByUrl(url);
    }

    public void delete(int id) {
        weddingRepository.delete(id);
    }

    public Wedding enable(Wedding wedding) {
        Wedding saved = weddingRepository.findOne(wedding.getId());
        saved.updateEnable(wedding.isEnable());
        return saved;
    }

    public Wedding findOneByIdAndAccountId(int id, String accountId) {
        return weddingRepository.findOneByIdAndAccountId(id , accountId);
    }
}
