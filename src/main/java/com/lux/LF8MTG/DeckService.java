package com.lux.LF8MTG;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DeckService {

    private final DeckRepository deckRepository;

    public DeckMitKarteDTO getDeckMitKarte(Integer deck_id) {
        Deck deck = deckRepository.findById(deck_id)
                .orElseThrow(() -> new RuntimeException("Deck not found"));

        List<KarteDTO> karten = deck.getDeckKarten()
                .stream()
                .map(DeckKarte::getKarte)
                .map(k -> new KarteDTO(
                        k.getKarten_id(),
                        k.getName(),
                        k.getBeschreibung()
                ))
                .toList();

        return new DeckMitKarteDTO(
                deck.getDeck_id(),
                deck.getName(),
                karten
        );
    }

    public Deck createDeck(String name) {
        Deck deck = Deck.builder().name(name).build();
        return deckRepository.save(deck);
    }

    public DeckDTO toDTO(Deck deck) {
        return new DeckDTO(
                deck.getDeck_id(),
                deck.getName()
        );
    }

    public List<DeckDTO> findAll() {
        return deckRepository.findAll()
                .stream()
                .map(this::toDTO)
                .toList();
    }

    public DeckDTO getById(int id) {
        Deck deck = deckRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Deck nicht gefunden: " + id));
        return toDTO(deck);
    }
}
