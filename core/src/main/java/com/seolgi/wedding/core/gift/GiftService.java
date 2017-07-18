package com.seolgi.wedding.core.gift;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GiftService {
    @Autowired
    private GiftRepository giftRepository;

    public List<Gift> findListByWeddingId(int weddingId) {
        return giftRepository.findListByWeddingId(weddingId);
    }
}
