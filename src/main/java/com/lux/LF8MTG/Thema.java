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
public class Thema {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int themen_id;

    private String name;

    @OneToMany(
            mappedBy = "thema",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private Set<Karte> karte = new HashSet<>();
}
