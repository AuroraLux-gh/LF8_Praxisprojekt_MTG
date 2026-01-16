# LF8_Praxisprojekt_MTG

´´´mermaid
erDiagram
    DECK ||--|{ DECK_KARTE : beinhaltet
    KARTE ||--|{ DECK_KARTE : includes
    KARTE || --|| THEMA : herkunft
    KARTE {
        string card_id
        string name
        string beschreibung
    }
    DECK {
        int deck_id
        string name
    }
    DECK_KARTE {
        int deck_karte_id
        int card_id
        int deck_id
    }
    THEMA {
        int id
        string name
    }
´´´