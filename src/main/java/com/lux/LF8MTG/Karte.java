package com.lux.LF8MTG;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Karte {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int karten_id;

    private String name;
    private String beschreibung;

    @OneToMany(
            mappedBy = "karte",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private Set<DeckKarte> deckKarten = new HashSet<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "themen_id", nullable = false)
    private Thema thema;
}
