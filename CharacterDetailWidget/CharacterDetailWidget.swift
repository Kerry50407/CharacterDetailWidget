//
//  CharacterDetailWidget.swift
//  CharacterDetailWidget
//
//  Created by Kerry Dong on 2020/7/3.
//

import WidgetKit
import SwiftUI
import Intents

//struct Provider: IntentTimelineProvider {
//    public func snapshot(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date(), configuration: configuration)
//        completion(entry)
//    }
//
//    public func timeline(for configuration: ConfigurationIntent, with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, configuration: configuration)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//}

//struct SimpleEntry: TimelineEntry {
//    public let date: Date
//    public let configuration: ConfigurationIntent
//}
//
//struct PlaceholderView : View {
//    var body: some View {
//        Text("Placeholder View")
//    }
//}
//
//struct CharacterDetailWidgetEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        Text(entry.date, style: .time)
//    }
//}

@main
struct CharacterDetailWidget: Widget {
    private let kind: String = "CharacterDetailWidget"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectCharacterIntent.self, provider: CharacterDetailProvider(), placeholder: CharacterPlaceHolderView()) { entry in
            CharacterDetailView(entry: entry)
        }
        .configurationDisplayName("Character Details")
        .description("Displays a character's health and other details")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}


struct CharacterDetailEntry: TimelineEntry {
    public let date: Date
    public let configuration: SelectCharacterIntent
}

struct CharacterPlaceHolderView : View {
    var body: some View {
        Text("Character Placeholder View")
    }
}

struct CharacterDetailView : View {
    var entry: CharacterDetailEntry
    var body: some View {
        Text("Character Detail View")
    }
}

struct CharacterDetailProvider: IntentTimelineProvider {
    func snapshot(for configuration: SelectCharacterIntent, with context: Context, completion: @escaping (CharacterDetailEntry) -> ()) {
        let entry = CharacterDetailEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func timeline(for configuration: SelectCharacterIntent, with context: Context, completion: @escaping (Timeline<CharacterDetailEntry>) -> ()) {
        
    }
}
