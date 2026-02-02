package com.lux.LF8MTG.controller;

import com.lux.LF8MTG.Deck;
import com.lux.LF8MTG.DeckDTO;
import com.lux.LF8MTG.DeckService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/decks")
@RequiredArgsConstructor
public class DeckController {

    private final DeckService deckService;

    @PostMapping
    public Deck create(@RequestBody Map<String, String> body) {
        return deckService.createDeck(body.get("name"));
    }

    @GetMapping("/all")
    public List<DeckDTO> getAll() {
        return deckService.findAll();
    }

    @GetMapping("/{id}")
    public DeckDTO getDeck(@PathVariable int id) {
        return deckService.getById(id);
    }
}
