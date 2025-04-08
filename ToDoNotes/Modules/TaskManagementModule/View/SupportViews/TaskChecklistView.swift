//
//  TaskChecklistView.swift
//  ToDoNotes
//
//  Created by Roman Tverdokhleb on 1/15/25.
//

import SwiftUI
import SwiftUIIntrospect

struct TaskChecklistView: View {
    
    @ObservedObject private var viewModel: TaskManagementViewModel
    @FocusState private var focusedItemID: UUID?
    
    private var textFieldDelegates: [UUID: TextFieldDelegate]
    
    init(viewModel: TaskManagementViewModel) {
        self.viewModel = viewModel
        
        self.textFieldDelegates = Dictionary(uniqueKeysWithValues: viewModel.checklistLocal.map {
            ($0.id, TextFieldDelegate())
        })
    }
    
    internal var body: some View {
        List {
            ForEach($viewModel.checklistLocal) { $item in
                HStack {
                    checkbox(item: $item)
                    textField(item: $item)
                }
                .onChange(of: item.name) { _, newValue in
                    if newValue == String() {
                        focusOnPreviousItem(before: item.id)
                        withAnimation(.linear(duration: 0.2)) {
                            viewModel.removeChecklistItem(for: item.id)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 4)
    }
    
    @ViewBuilder
    private func checkbox(item: Binding<ChecklistItem>) -> some View {
        (item.wrappedValue.completed ? checkedBox : uncheckedBox)
            .foregroundStyle(
                (item.wrappedValue.completed || item.wrappedValue.name.isEmpty) ? Color.LabelColors.labelDetails : Color.LabelColors.labelPrimary)
        
            .frame(width: 18, height: 18)
            .animation(.easeInOut(duration: 0.2), value: item.wrappedValue.name)
        
            .onTapGesture {
                if !item.wrappedValue.name.isEmpty {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        item.wrappedValue.completed.toggle()
                    }
                }
            }
            .onAppear {
                if !item.wrappedValue.name.isEmpty, viewModel.check == .checked {
                    item.wrappedValue.completed = true
                }
            }
    }
    
    @ViewBuilder
    private func textField(item: Binding<ChecklistItem>) -> some View {
        TextField(Texts.TaskManagement.point,
                  text: item.name)
        .font(.system(size: 17, weight: .regular))
        .foregroundStyle(
            item.wrappedValue.completed ? Color.LabelColors.labelDetails : Color.LabelColors.labelPrimary)
        
        .submitLabel(.next)
        .focused($focusedItemID, equals: item.id)
        .introspect(.textField, on: .iOS(.v16, .v17, .v18)) { textField in
            setupDelegate(for: textField, itemID: item.id)
        }
    }
    
    private var uncheckedBox: Image {
        Image.TaskManagement.EditTask.checkListUncheck
            .renderingMode(.template)
            
    }
    
    private var checkedBox: Image {
        Image.TaskManagement.EditTask.checkListCheck
    }
}

#Preview {
    TaskChecklistView(viewModel: TaskManagementViewModel())
}


extension TaskChecklistView {
    
    // MARK: - Delegate setup
    
    private func setupDelegate(for textField: UITextField, itemID: UUID) {
        guard let delegate = textFieldDelegates[itemID] else { return }
        
        delegate.shouldReturn = {
            if let text = textField.text, text.isEmpty {
                self.focusOnPreviousItem(before: itemID)
                withAnimation(.linear(duration: 0.2)) {
                    self.viewModel.removeChecklistItem(for: itemID)
                }
            } else {
                self.viewModel.addChecklistItem(after: itemID)
                self.focusOnNextItem(after: itemID)
            }
            return false
        }
        
        textField.delegate = delegate
    }
    
    // MARK: - Focus menagement
    
    private func focusOnNextItem(after id: UUID) {
        if let currentIndex = viewModel.checklistLocal.firstIndex(where: { $0.id == id }),
           currentIndex < viewModel.checklistLocal.count - 1 {
            focusedItemID = viewModel.checklistLocal[currentIndex + 1].id
        }
    }
    
    private func focusOnPreviousItem(before id: UUID) {
        if let currentIndex = viewModel.checklistLocal.firstIndex(where: { $0.id == id }),
           currentIndex > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.21) {
                focusedItemID = viewModel.checklistLocal[currentIndex - 1].id
            }
        } else {
            if let firstIndex = viewModel.checklistLocal.first?.id {
                focusedItemID = firstIndex
            }
        }
    }
}
