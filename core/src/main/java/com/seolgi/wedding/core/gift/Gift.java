package com.seolgi.wedding.core.gift;

import com.seolgi.wedding.core.guest.Guest;
import com.seolgi.wedding.core.invitation.wedding.Wedding;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity(name = "gift")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class Gift {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String imageUrl;

    @Column
    private long price;

    @Column(length = 20)
    private String name;

    @ManyToOne
    @JoinColumn(name = "weddingId" , referencedColumnName = "id")
    private Wedding wedding = new Wedding();

    @OneToMany(mappedBy = "gift")
    private List<Guest> guests = new ArrayList<>();

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createDate;

    @CreationTimestamp
    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(insertable = false)
    private Date updateDate;

    public int getGuestsSize() {
        if (this.getGuests() == null)
            return 0;

        return this.getGuests().size();
    }

    public double getAmountGuestPriceRate() {
        double amountGuestPriceRate = (double)getAmountGuestPrice() / (double)getPrice() * 100.0 ;

        if (amountGuestPriceRate > 100)
            amountGuestPriceRate = 100;

        return amountGuestPriceRate;
    }

    public String getFormatAmountGuestPrice() {
        return NumberFormat.getInstance().format(getAmountGuestPrice());
    }

    private long getAmountGuestPrice() {
        if (this.getGuests() == null || this.getGuests().isEmpty())
            return 0;
        else
            return this.getGuests().stream().mapToLong(Guest::getPrice).sum();
    }

    public boolean isComplete() {
        return this.getPrice() <= getAmountGuestPrice();
    }
}
