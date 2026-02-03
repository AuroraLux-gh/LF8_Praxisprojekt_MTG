package com.lux.LF8MTG;

import java.util.List;

public record DeckMitKarteDTO(
        int deck_id,
        String name,
        List<KarteDTO> karten
) {
}
