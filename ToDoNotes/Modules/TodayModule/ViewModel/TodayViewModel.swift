//
//  TodayViewModel.swift
//  ToDoNotes
//
//  Created by Roman Tverdokhleb on 1/5/25.
//

import SwiftUI

/// ViewModel managing the state and interactions for the Today screen.
final class TodayViewModel: ObservableObject {
    
    // MARK: - Stored Properties
    
    /// Whether the Add Task button should glow (first-time user experience).
    @AppStorage(Texts.UserDefaults.addTaskButtonGlow)
    internal var addTaskButtonGlow: Bool = false
    
    /// User setting for how task creation should be presented (popup or fullscreen).
    @AppStorage(Texts.UserDefaults.taskCreation)
    private var taskCreationFullScreen: TaskCreation = .popup
    
    // MARK: - Published Properties (UI State)
    
    /// The currently selected task for editing.
    @Published internal var selectedTask: TaskEntity? = nil
    /// Current text entered into the search bar.
    @Published internal var searchText: String = String()
    /// Height of the task management sheet.
    @Published internal var taskManagementHeight: CGFloat = 15
    
    /// Flag to show the popup task creation view.
    @Published internal var showingTaskCreateView: Bool = false
    /// Flag to show the fullscreen task creation view.
    @Published internal var showingTaskCreateViewFullscreen: Bool = false
    /// Flag to toggle visibility of the search bar.
    @Published internal var showingSearchBar: Bool = false
    /// Whether to filter tasks to show only important ones.
    @Published internal var importance: Bool = false
    
    // MARK: - Private Properties
    
    /// The reference date used for today's tasks.
    private(set) var todayDate: Date = Date.now
    
    // MARK: - Task Creation Methods
    
    /// Toggles between showing popup or fullscreen task creation view based on settings.
    internal func toggleShowingTaskCreateView() {
        if taskCreationFullScreen == .popup {
            showingTaskCreateView.toggle()
        } else {
            showingTaskCreateViewFullscreen.toggle()
        }
    }
    
    // MARK: - UI Toggle Methods
    
    /// Clears the selected task to dismiss.
    internal func toggleShowingTaskEditView() {
        selectedTask = nil
    }
    
    /// Toggles the search bar visibility.
    internal func toggleShowingSearchBar() {
        showingSearchBar.toggle()
    }
    
    /// Toggles the importance filter with animation.
    internal func toggleImportance() {
        withAnimation(.easeInOut(duration: 0.2)) {
            importance.toggle()
        }
    }
}
