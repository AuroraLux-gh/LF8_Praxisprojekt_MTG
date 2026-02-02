package com.lux.LF8MTG;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface DeckRepository extends JpaRepository<Deck, Integer> {
}
