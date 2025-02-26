//
//  ImageExtension.swift
//  ToDoNotes
//
//  Created by Roman Tverdokhleb on 1/1/25.
//

import SwiftUI

extension Image {
    enum Placeholder {
        static let previewIcon = Image("PlaceholderPreviewIcon")
        static let tabbarIcon = Image("PlaceholderTabbarIcon")
    }
    
    enum NavigationBar {
        static let search = Image("NavIconSearch")
        static let favorites = Image("NavIconFavorites")
        static let calendar = Image("NavIconCalendar")
        static let more = Image("NavIconMore")
        static let back = Image("NavIconBack")
        static let share = Image("NavIconShare")
        
        static let completed = Image("NavIconCompleted")
        static let uncompleted = Image("NavIconUncompleted")
        static let pin = Image("NavIconPin")
        static let unpin = Image("NavIconUnpin")
        static let favorite = Image("NavIconFavorite")
        static let unfavorite = Image("NavIconUnfavorite")
        
        static let copy = Image("NavIconCopy")
        static let trash = Image("NavIconTrash")
    }
    
    enum TabBar {
        enum Selected {
            static let home = Image("TabBarIconSelectedHome")
            static let today = Image("TabBarIconSelectedToday")
            static let calendar = Image("TabBarIconSelectedCalendar")
            static let settings = Image("TabBarIconSelectedSettings")
        }
        
        enum Unselected {
            static let home = Image("TabBarIconHome")
            static let today = Image("TabBarIconToday")
            static let calendar = Image("TabBarIconCalendar")
            static let settings = Image("TabBarIconSettings")
        }
    }
    
    enum Folder {
        static let navBar = Image("FoldersNavIcon")
        static let locked = Image("FolderLockIcon")
        static let unlocked = Image("FolderUnlockIcon")
    }
    
    enum Settings {
        static let about = Image("SettingsAboutApp")
        static let appearance = Image("SettingsAppearance")
        static let language = Image("SettingsLanguage")
        static let notifications = Image("SettingsNotification")
        static let reset = Image("SettingsReset")
        static let email = Image("SettingsEmail")
        
        static let chevron = Image(systemName: "chevron.right")
        static let check = Image(systemName: "checkmark")
    }
    
    enum TaskManagement {
        static let plus = Image("AddPlusIcon")
        static let emptyList = Image("EmptyTaskList")
        static let scrollToTop = Image("ScrollToTopIcon")
        static let scrollToBottom = Image("ScrollToBottomIcon")
        
        enum EditTask {
            static let calendar = Image("EditTaskCalendar")
            static let check = Image("EditTaskCheck")
            static let uncheck = Image("EditTaskUncheck")
            static let more = Image("EditTaskMore")
            static let accept = Image("EditTaskAccept")
            static let ready = Image("EditTaskReady")
            static let link = Image("EditTaskLink")
            
            static let checkListCheck = Image("ChecklistItemChecked")
            static let checkListUncheck = Image("ChecklistItemUnchecked")
        }
        
        enum TaskRow {
            static let uncheckedBox = Image("TaskRowUncheckedBox")
            static let checkedBox = Image("TaskRowCheckedBox")
            
            static let uncheckedRemainder = Image("TaskRowUncheckedRemainder")
            static let checkedRemainder = Image("TaskRowCheckedRemainder")
            
            static let uncheckedContent = Image("TaskRowUncheckedContent")
            static let checkedContent = Image("TaskRowCheckedContent")
            
            static let uncheckedImportant = Image("TaskRowUncheckedImportant")
            static let checkedImportant = Image("TaskRowCheckedImportant")
            
            static let uncheckedExpired = Image("TaskRowUncheckedExpired")
        }
        
        enum DateSelector {
            static let monthForward = Image("TaskDateSelectorMonthForward")
            static let monthBackward = Image("TaskDateSelectorMonthBackward")
            
            static let time = Image("TaskDateSelectionTime")
            static let remainder = Image("TaskDateSelectionRemainder")
            static let cycle = Image("TaskDateSelectionCycle")
            
            static let checked = Image("TaskDateSelectionChecked")
            static let unchecked = Image("TaskDateSelectionUnchecked")
            
            static let remove = Image("TaskDateSelectionRemove")
            static let menu = Image("TaskDateSelectionMenu")
        }
    }
    
    enum LoginPage {
        static let appleLogo = Image("AppleLogo")
        static let googleLogo = Image("GoogleLogo")
    }
}
