### Department Management - Huang Xiaorong  

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

