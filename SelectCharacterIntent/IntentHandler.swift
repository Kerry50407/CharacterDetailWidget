//
//  IntentHandler.swift
//  SelectCharacterIntent
//
//  Created by Kerry Dong on 2020/7/3.
//

import Intents

class IntentHandler: INExtension, SelectCharacterIntentHandling {
    func resolveCharacter(for intent: SelectCharacterIntent, with completion: @escaping (GameCharacterResolutionResult) -> Void) {
        
    }
    
    func provideCharacterOptionsCollection(for intent: SelectCharacterIntent, with completion: @escaping (INObjectCollection<GameCharacter>?, Error?) -> Void) {
        let characters: [GameCharacter] = CharacterDetail.availableCharacters.map { character in
            let gameCharacter = GameCharacter(identifier: character.name, display: character.name)
            gameCharacter.name = character.name
            return gameCharacter
        }
        
        let collection = INObjectCollection(items: characters)
        completion(collection, nil)
    }
    
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}

struct CharacterDetail {
    let name: String
    let avatar: String
    let healthLevel: Double
    let heroType: String
    
    static let availableCharacters = [
        CharacterDetail(name: "Power Panda", avatar: "🐼", healthLevel: 0.14, heroType: "Forest Dweller"),
        CharacterDetail(name: "Unipony", avatar: "🦄", healthLevel: 0.67, heroType: "Free Rangers"),
        CharacterDetail(name: "Spouty", avatar: "🐳", healthLevel: 0.83, heroType: "Deep Sea Goer")
    ]
}

