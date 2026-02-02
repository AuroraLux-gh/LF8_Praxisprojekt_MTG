package com.lux.LF8MTG;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Deck_Karte")
@Getter
@Setter
@NoArgsConstructor
public class DeckKarte {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int deck_karte_id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "deck_id", nullable = false)
    private Deck deck;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "karte_id", nullable = false)
    private Karte karte;
}
