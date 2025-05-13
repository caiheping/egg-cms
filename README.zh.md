### Blog Management > Article List ———— Zeng Yuqing
**I.About Setting Up the Project:**
- 1. Set up the environment by downloading the software: node-v20.18.0-x64 and Navicat 
- 2. In Navicat, create the database egg_cms_development and then import the database data from the original blogger's project root directory, egg_cms_development.sql file
- 3. Open the project in VSC and modify the database name and password in the config/config.default.js file, as well as the host address. 
- 4. In VSC, create a new terminal and run the project with the command npm run dev 
- 5. After successful execution, open the browser to the address http://127.0.0.1:7001/index.html to successfully access the project. The default login account is admin, password: 123456, and you only need to enter the image verification code to access the homepage.

**II: Introduction to the Blog Management > Article List Function:**
![Article List Page](images/ariticle%20page.png)
Here is a guide on how to use the article list page:
1. **View Article List**: 
- Open the article list page, and users can see all published articles.
2. **Paginated Browsing**:   
- If there are many articles, you can use the pagination controls at the bottom of the page to browse articles on different pages.

### Search for Articles

1. **Using the Search Box**:  
 - Enter the title of the article you want to find in the search box at the top of the page.
2. **Execute the Search**:  
  - Click the “Search” button, and the system will display articles that match the search criteria.
3. **Reset Search**:   
 - If you need to clear the search criteria, you can click the “Reset” button.

### View Article Details

**Click on the Article Title**:  
  - In the article list, click on the title of the article you want to view, which will usually redirect you to the detailed article page.

### Modify Article

  1. **Click the “Modify” Button**:  
 - In the article list, find the article you want to modify, and click the “Modify” button in that article's row.
 2. **Edit Article**: 
 - The system will redirect to the article editing page, where you can modify the article's title, content, and other information.
 3. **Save Changes**:   
 - After completing the modifications, click the "OK" button to save the changes.

 ### Delete Article

 1. **Click the "Delete" Button**: 
 - In the article list, find the article you want to delete and click the "Delete" button on that article's row.
 2. **Confirm Deletion**: 
 - The system may pop up a confirmation dialog asking if you are sure you want to delete the article; click "OK" to confirm deletion.


 ### Managing Article Types

 1. **Access Article Type Management**: 
   - In the left navigation bar, click on "Article Types" to manage the categories of articles.
 2. **Add or Modify Types**: 
  - On the article type management page, you can add new article types or modify existing ones.

### Adding a New Article
  
![Add Article Page](images/article%20%20%20ADD.png)
Here is a detailed description of this page:
1. **Title**:
- Used to input the title of the article. 
   **Subtitle**: Write the subtitle.
2. **Category**:
- There is a dropdown menu to select the category of the article.
3. **Content**:
- Used to input the main content of the article. Above the editing box, there are some text formatting tools, such as bold, italic, list, link, etc.to facilitate user editing.

The design of this add article page allows users to easily create and edit articles while providing a real-time preview function to check the final effect of the article before publishing.

**The article list function in the backend management system provides users with multiple conveniences. Its intuitive interface design allows even non-technical users to easily get started and perform operations such as adding, deleting, modifying, and querying articles.**



### Department Management - huangxiaorong 

#### View Department List (Displayed on the Department Management Page)  
**Open the Department List Page**  
After logging into the backend management system, navigate to **"System Management" → "Department Management"** in the left sidebar.  
The page will display all existing departments, including:  
- Department Name  
- Status  
- Sorting Order  
- Creation Time  

---

#### Add a New Department (Can Add a Top-Level Department or a Sub-Department Under the Same Level)  
**Click "Add"**  
Click the **"Add"** button (located at the top-left/right of the department list).  

**Fill in Department Information**  
- **Parent Department**: Select the superior department (e.g., "Headquarters") from the dropdown.  
  - *System Requirement*: This field is **mandatory**. If left blank, the system will prompt: **"parentId cannot be empty."**  
- **Department Name**: Enter the department name (e.g., "Test Department 1").  
  - *System Requirement*: This field is **mandatory**. If left blank, the system will prompt: **"Department name cannot be empty."**  
- **Display Order**: Set the display order (optional; the system may apply default sorting rules if unspecified).  
  - *System Requirement*: This field is **mandatory**. If left blank, the system will prompt: **"Display order cannot be empty."**  
- **Status**: Choose **"Active"** or **"Inactive."**  

**Save Settings**  
- Click **"Confirm"** to complete the addition.  
- Click **"Cancel"** to discard changes.  

---

#### Modify Department Information (All Fields Are Mandatory)  
**Click "Edit"**  
In the department list, locate the target department and click the **"Edit"** button in the action column.  

**Modify Content**  
Adjust the department name, status, or other details in the pop-up edit window.  

**Save Changes**  
- Click **"Confirm"** to save.  
- Click **"Cancel"** to exit without saving.  

---

#### Delete a Department (Requires Confirmation)  
**Click "Delete"**  
In the department list, locate the target department and click the **"Delete"** button in the action column.  

**Confirm Action**  
The system will display a confirmation dialog:  
- Click **"Confirm"** to proceed with deletion.  
- Click **"Cancel"** to abort.  

---

### Important Notes  
1. **Hierarchy Relationships**:  
   - Ensure the correct **parent department** is selected to maintain a clear organizational structure.  
2. **Status Management**:  
   - **Inactivating** a department may affect its sub-departments and related permissions. Proceed with caution.


  
 # Blog Management > Article Type — Liang Wenli

## Introduction to the Blog Management > Article Type Feature:

Here’s a guide on how to use the article type page:

### Interface Overview:

- **Article Type Page:**
  - **Left Navigation Bar**
    - Contains multiple management modules such as "Home", "Blog Management", "Article List", "Article Type", "Friendly Links", and "System Management".
    - The currently selected module is "Article Type".
  - **Top Navigation Bar**
    - Includes a search box, refresh button, user information, etc.
  - **Article Type List**
    - Displays the existing article types.
    - The list includes the following columns:
      - **Name**: The name of the article type.
      - **Key**: The key value of the article type.
      - **Display Order**: The display sequence of the article type.
      - **Remarks**: Notes about the article type.
      - **Creation Time**: The time when the article type was created.
      - **Operations**: Provides "Edit" and "Delete" buttons for editing or deleting article types.
  - **Pagination Control**
    - Shows the current page number and total number of items, and provides page-turning functionality.

- **Add Article Type Popup:**
  - **Popup Title**
    - Displays "Add Article Type".
  - **Input Fields**
    - **Name**: Enter the name of the article type (required).
    - **Key**: Enter the key value of the article type (required).
    - **Display Order**: Set the display order of the article type (default value is 0).
    - **Remarks**: Enter remarks about the article type (optional).
  - **Operation Buttons**
    - **Confirm**: Click to save the newly added article type.
    - **Cancel**: Click to cancel the operation and close the popup.

### Usage Guide:

- **View Article Types**
  1. Click "Article Type" in the left navigation bar to enter the article type page.
  2. View the existing article types and their related information in the article type list.

- **Add Article Type**
  1. On the article type page, click the "Add" button.
  2. In the "Add Article Type" popup:
     - Enter the name of the article type (required).
     - Enter the key value of the article type (required).
     - Set the display order (optional, default value is 0).
     - Enter remarks (optional).
  3. Click the "Confirm" button to save the newly added article type, or click the "Cancel" button to cancel the operation.

- **Edit Article Type**
  1. Find the article type that needs to be edited in the article type list.
  2. Click the "Edit" button in the corresponding row.
  3. Make changes in the pop-up editing window.
  4. Click the "Confirm" button to save the changes, or click the "Cancel" button to cancel the operation.

- **Delete Article Type**
  1. Find the article type that needs to be deleted in the article type list.
  2. Click the "Delete" button in the corresponding row.
  3. The system will pop up a confirmation dialog box, and after confirmation, the article type will be deleted.

### Precautions:

- Ensure that the names and key values of the article types entered are unique to avoid duplication.
- Editing and deleting operations are irreversible, please proceed with caution.
- Ensure to back up important data before operating to prevent data loss due to misoperation.

- # Personal Center + Layout Settings --- Zhang Linpei

## Personal Center

In the top-right corner of the homepage of the backend management system, clicking the dropdown arrow next to your avatar provides access to three options: Personal Center, Layout Settings, and Log Out.

### Functional Overview

- **Personal Information Management**: View and edit basic information such as username, mobile phone number, and email address.
- **Account Security**: Use mobile phone numbers and email addresses for security verification, such as password recovery or receiving system notifications.
- **Personalized Services**: Select gender for personalized services or statistical analysis.
- **Permission Management**: Display the department and role the user belongs to, helping system administrators understand the user's organizational affiliation and facilitating permission management and work coordination.
- **Account History**: Record the account creation time, which is helpful for tracking the account's history and conducting audits.

### Interface Introduction

1. **Personal Information Overview**:
   - Displays basic information such as the user's avatar, username, department, role, and creation date.

2. **Username**:
   - Displayed as "admin," identifying the user's identity within the system.

3. **Mobile Phone Number and Email Address**:
   - Input fields for filling in or modifying contact information, used for account security verification and receiving system notifications.

4. **Gender**:
   - Provides options for "Male" and "Female," used for personalized services or statistical analysis.

5. **Department and Role**:
   - Displays the user's organizational structure and permission level, defining the operations the user can perform within the system.

6. **Creation Date**:
   - Records the account creation time, which is useful for tracking the account's history and conducting audits.

7. **Basic Information and Change Password Tabs**:
   - Provide interfaces for users to manage their personal information and account security.

8. **Save and Close Buttons**:
   - The "Save" button is used to save the user's modifications to personal information, while the "Close" button is used to close the Personal Center page.

## Layout Settings

The Layout Settings feature is located in the system layout configuration area at the top-right corner, allowing users to customize and adjust the system interface's layout to meet their personal work habits and preferences.

### Customizable Content

1. **Theme Color**:
   - Allows users to select different theme colors to change the overall visual style of the interface, providing a more personalized user experience.

2. **Enable Tags-Views**:
   - Controls whether to display tag views on the interface, helping users quickly switch between different work pages and improving work efficiency.

3. **Fixed Header**:
   - Allows users to choose whether to fix the top navigation bar of the page, making it easier to access navigation options when scrolling.

4. **Display Logo**:
   - Controls whether to display the system logo at the top of the page, enhancing brand recognition and making the interface more aesthetically pleasing.

### Usage Instructions

1. **Access Layout Settings**:
   - Find the system layout configuration area at the top-right corner, which contains all layout settings options.

2. **Adjust Settings**:
   - Adjust the settings according to personal preferences by clicking on the corresponding switches or selectors.

3. **Save Settings**:
   - After completing the settings, the system usually automatically saves your choices, or you may need to click a "Save" button to apply the changes.

4. **View Effects**:
   - Once the settings are adjusted, the interface will immediately reflect your changes, allowing you to see the new layout effects right away.

# System Management > User Center—Wu Hui Zhen

## User Center

### View User List
- Upon accessing the User Center page, all registered users will be displayed in the list.

### Pagination Navigation
- When dealing with a large number of users, utilize the pagination controls at the bottom of the page to browse through different pages.

### Search for Users
1. **Using the search box:** Enter the desired username in the search field located at the top of the page.
2. **Execute search:** Click the "Search" button to display users matching the search criteria.
3. **Reset search:** Click the "Reset" button to clear the current search conditions if needed.

### View User Details
- Click on any username in the list to view the detailed user information.

### Modify User Information
1. **Click "Edit":** Locate the target user in the list and click the "Edit" button in their corresponding row.
2. **Edit user details:** A modification dialog will appear, allowing you to edit:
   - Nickname
   - Department
   - Gender
   - Role
   - Mobile number
   - Status (Active/Inactive)
   - Email
   - Remarks
3. **Save changes:** Click "Confirm" to save all modifications.

### Delete User
1. **Click "Delete":** Identify the user you wish to remove and click the "Delete" button in their row.
2. **Confirmation:** The system will display a confirmation dialog - click "Confirm" to proceed with deletion.

### Reset User Password
1. **Click "Reset Password":** Locate the user and click the "Reset Password" button in their row.
2. **Enter new password:** A prompt will appear requesting the new password.
3. **Confirm reset:** Enter the new password and click "Confirm" to complete the process.

### Add New User
1. **Click "Add":** Select the "Add" button located above the user list.
2. **Complete user information:** Fill in all required fields in the pop-up window:
   - Nickname
   - Department
   - Gender
   - Role
   - Mobile number
   - Status (Active/Inactive)
   - Email
   - Remarks
3. **Save information:** Click "Confirm" to register the new user.

### Manage User Status
- Locate the target user and toggle their status switch between "Active" and "Inactive".

### Benefits of User Center
The User Center module in the backend management system provides:
- Centralized user information management
- Enhanced system security and stability
- Simplified maintenance and scalability
- Improved user engagement through feedback mechanisms
- Better alignment with actual user requirements
- Optimized user experience


  # Role Management – Li Youling  

## View Role List  
1. **Open the Role Management Page**  
   - After logging into the backend management system, click **"Role Management"** in the left navigation bar.  
   - The page will display the existing roles and their details, including:  
     - Role ID  
     - Role name  
     - Permission key  
     - Display order  
     - Status  
     - Creator  
     - Creation time  

## Add a New Role  
1. **Click "Add"**  
   - Click the **"Add"** button at the top of the role management page.  
2. **Fill in Information**  
   - In the pop-up window, enter:  
     - Role name  
     - Permission key  
     - Display order  
     - Status (enable/disable)  
     - Menu permissions  
3. **Save the Role**  
   -  Add remarks.  
   - Click **"Confirm"** to save the new role.  

## Edit a Role  
1. **Select the Role**  
   - In the role list, locate the role you want to edit.  
2. **Modify Role Information**  
   - Click the **"Edit"** button on the right.  
   - Update the role details in the pop-up window.  
3. **Save Changes**  
   - Click **"Confirm"** to apply changes.  

## Assign Data Permissions  
1. **Select the Role for Permission Assignment**  
   - In the role list, find the role and click the **"Data Permissions"** button.  
2. **Configure Role Permissions**  
   - Fill in:  
     - Role name  
     - Permission key  
   - In the **Permission Scope** dropdown, select department-based data permissions.  
3. **Save the Settings**  
   - Click **"Confirm"** to finalize permissions.  

## Delete a Role  
1. **Select the Role to Delete**  
   - Check the box next to the roles in the list.  
   - Click the **"Delete"** button at the top.  
2. **Confirm Deletion**  
   - Click **"Confirm"** in the pop-up to proceed.  

## Search and Filter Roles  
- Use the search box to filter by:  
  - Role name  
  - Status  
- Click **"Search"** to apply filters.  
 
The **Role Management** feature enables efficient control over system roles and permissions, ensuring security and flexibility.  


# System Management > Menu Management————Chen Ying

This page is a menu management interface of the background management system. The following is a detailed introduction of the page:

## 1. Navigation bar:

There is a navigation bar on the left, which contains two tabs: Home Page and Menu Management. Menu Management is currently selected. Icons and characters in the navigation bar can help users quickly find the required functional modules.

## 2. Menu list:

**Menu name**: such as Home Page, Blog Management and System Management.

**icon**: icon of menu item, which helps users to quickly identify menu items.

**Sorting**: the sorting order of menu items. The smaller the value, the higher the priority of menu items.

**Authority ID**: Authority ID of menu item, which is used to control access rights of different users.

**Component name**: the name of the component corresponding to the menu item, such as "Home" and "Layout".

**Status**: Displays the status of the menu item, such as "Normal".

**Creation Time**: displays the creation time of the menu item in the format of "YYYY-MM-DD HH:MM:SS".

**Operation**: Provides operation options for menu items, including Modify, Add and Delete.

## 3. Add button function:

Users can click this button to add new menu items.

1) **Menu type**: directory, menu and button.
Click to select the directory and menu, and then click the input box to slide down the directory and menu.

Click the button to pop up the menu name: used to enter the name of the new menu item (required).
Display Order: used to enter the display order of menu items (required).
Permission ID: used to enter the permission ID of the menu item.
Menu Status: used to select the status of menu items, normal or disabled.
OK and Cancel buttons: Click OK to submit the form and save the new menu item. Click the Cancel button to close the dialog box without saving any changes.

2) **Menu icon**: The user can click the icon selector next to it to select the icon of the menu item. After clicking, the identifier of the icon is displayed in the input box. You can select the icon you need (for example, # means no icon).

3) **Menu Name**: Enter the name of the new menu item (required).

4) **Display Order**: used to enter the display order of menu items (required).

5) **External link**: used to select whether the menu item is external link.

Yes (outer chain):
When "Yes" is selected, it means that the menu item will be linked to an external website or external resource. For example, you can set a menu item to link to an online document, an external API interface or other websites that are not in this system. In this case, you usually need to enter the complete external URL address in the Routing Address field.

No (not external chain):
When "No" is selected, it means that the menu item will be linked to a page or component within the system. For example, you can set a menu item to link to the user management page and order management page within the system. In this case, it is usually necessary to enter the internal routing path of the system in the "Routing Address" field, rather than the complete URL.

6) **Routing Address**: used to enter the routing address corresponding to the menu item (if No is selected for External Link, it needs to be filled in).

7) **Component Name**: used to enter the component name corresponding to the menu item.

8) **Display status**: usually used to control the visibility of menu items on the front-end interface.

Normal:
When the display status is set to "Normal", the menu item will be displayed on the front-end interface, and users can see and click the menu item.

Deactivate:
When the display status is set to "Disabled", the menu item will not be displayed on the front-end interface, and users will not be able to see the menu item. (Applicable to menu items that do not need user access temporarily, or menu items that need to be hidden under certain conditions. )

9) **Menu status**: usually used to control the enabled status of menu items.

Normal:
When the menu status is set to "Normal", the menu item is enabled, and users can click and access the page or function pointed by the menu item.

Deactivate:
When the menu status is set to "Disabled", the menu item is disabled, and users cannot click and access the page or function pointed by the menu item.

10) **OK and Cancel buttons**:
Click OK to submit the form and save the new menu item. Click the Cancel button to close the dialog box without saving any changes.

## 4. Operation options:

**Modify**: Click this button to edit the details of the menu item.

Clicking the "Modify" button on the right side of a menu item will pop up a "Modify Menu" dialog box. Used to edit existing menu items. The functions of each option function are the same as those of (3. **New button function**).

**Add**: This button can add a submenu item under the current menu item.

**Delete**: This button can delete the selected menu item.

**This page is mainly used to manage menu items in the system. Administrators can add, modify and delete menu items through this interface, and adjust the ordering and authority identification of menu items, thus realizing flexible management of the system.**